org 100h
; Pacman Game in x86 Assembly for DOS
; This code creates a maze for the game using ASCII characters

[bits 16]           ; Use 16-bit code
[org 0x100]         ; Origin point for the program

%define SCREEN_WIDTH 320
%define SCREEN_HEIGHT 200

%define SPRITEW 8 
%define SPRITEH 8

%define MAZERLIMIT 151
%define MAZEBLIMIT 32 

%include "pacman.asm"
%include "ghosts.asm"


section .data

; ; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------

section .bss
keyPressed resb 1
keyReleased resb 1
lastDirection resb 1


section .text
start:
    mov ah, 00h
    mov al, 13h
    int 10h
    call clearScreen
    call Maze

 gameloop:
 call clearSprite
 call draw_sprite

    ; display pacman
    mov si, [currentPacmanSprite]
    mov di, [xPosPac]
    call draw_pacman
    
    

    mov cx, 64000
    waitloop:
        loop waitloop

    ; ---------------------------------------------------------------------------

        call checkKeyPress
        
    ; update the positions of the sprites
        call waitForKey
    ; check if key pressed WASD
        cmp al, 119     ; 'w' ASCII
        je up
        cmp al, 115     ; 's' ASCII
        je down
        cmp al, 4DH     ; 'd' ASCII 
        je right 
        cmp al, 97      ; 'a' ASCII
        je left


    ; check if key pressed zqsd
        cmp al, 122      ; 'z' ASCII
        je up
        cmp al, 115      ; 's' ASCII
        je down
        cmp al, 100      ; 'd' ASCII
        je right
        cmp al, 113      ; 'q' ASCII
        je left

    ; Exit the program if the escape key is pressed
        cmp al, 27   ; ASCII value of escape key
        je quit      ; go to the exit function if the comparison returns equal

    ; jump back to the main loop if no key is pressed
        jmp gameloop
    ; ---------------------------------------------------------------------------
    handleKey:
        mov byte [keyReleased], 0 ; Clear the key released flag
        ; Handle key logic		


    releaseKey:
        mov byte [keyReleased], 1 ; Set the key released flag
        jmp gameloop

 checkKeyPress:
    mov ah, 0x11 ; BIOS function to check keyboard status
        int 16h
        ; AL = scan code, AH = ASCII character
        mov [keyPressed], al
        ret

    .keyChanged:
    ret
	

    ; ---------------------------------------------------------------------------

    ; Exit the program if the escape key is pressed
    cmp al, 27                  ; ASCII value of escape key
    je clearScreen
    je quit                     ; go to the exit function if the comparison return an equal
    ; ---------------------------------------------------------------------------

    draw_pacman:
        mov ax, 0xA000          ; memory location of the video mode
        mov es, ax
        mov dx, 8               ; set the destination index to 8 (starting position in video memory)
    .eachLine:                  ; loop till each line of the sprite is printed
        mov cx, 8               ; setthe count register to 8 (number of pixel to copy per line)
        rep movsb               ; repeat the move byte action (copying pixel)
        add di, 320-8           ; move the destination index to the next line (320 pixel per line)
        dec dx                  ; decrement the loop counter (dx) and jump to .eachLine if not zero
        jnz .eachLine
        ret                     ; return to the main loop

    draw_sprite:
        mov si, [currentSprite]
        mov ax, [xPos]
        mov [old_XPOS], ax
        mov ax, [yPos]
        mov [old_YPOS], ax
        mov ax, 0A000h
        mov es, ax
        mov ax, [yPos]
        imul ax, 320
        add ax, [xPos] 
        mov di, ax
        mov cx, SPRITEH
    .draw_line:
        push cx
        mov cx, SPRITEW
        rep movsb
        pop cx
        add di, 320 - SPRITEW
        loop .draw_line
        ret

    ; ---------------------------------------------------------------------------

    ; ---------------------------------------------------------------------------


    waitForKey:
        mov ah, 0x00                 ; BIOS function to read keyboard input
        int 16h                      ; Call BIOS interrupt
        ret


    clearSprite:
    ; Set up the graphics segment
    mov ax, 0A000h
    mov es, ax
    ; Calculate the screen offset for the old position of the sprite
    mov ax, [old_YPOSPAC]     ; Get the old Y position
    imul ax, 320              ; Multiply Y position by screen width to get the offset
    add ax, [old_XPOSPAC]     ; Add the old X position to the offset
    mov di, ax                ; DI = starting address for erasure
    ; Define the height and width of the sprite
    mov cx, SPRITEH           ; Sprite height
    .clear_line:
        push cx                ; Save CX as it is modified by the loop
        mov cx, SPRITEW        ; Sprite width for a single line
        mov al, 0              ; Background color (usually black for Pac-Man)
        rep stosb              ; Clear pixels with background color
        pop cx                 ; Restore CX for the next line
        add di, 320 - SPRITEW  ; Adjust DI to the start of the next line
        loop .clear_line       ; Repeat for each line of the sprite
    ret
     

    quit:                       ; If escape key is pressed, jump to label 'exit'
        mov ah, 4ch                 ; DOS function to exit program
        int 21h                     ; Call DOS interrupt

    clearScreen:
        mov ax, 0xA000
        mov es, ax
        mov di, 0
        mov cx, 200*320
        rep stosb
        ret

    ;dos box default video mode
    mov ax, 03h                 ; set into video mode
    int 21h                     ; call DOS interupt
    int 20h                     ; quit
    
 %include "Maze.asm" 
 %include "movement.asm"