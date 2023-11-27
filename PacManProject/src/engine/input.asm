;------------------------------------------------------
;
; Manages the input handling logic, capturing
; and interpreting player inputs from the keyboard
; or gamepad and converting them into in-game actions.
;
; Translates player actions into meaningful game 
; movements and decisions.
;
;------------------------------------------------------

;------------------------------------------------------
; input.asm Pseudo-Code
;------------------------------------------------------
; Start:
;     Initialize Input System
;     Set Up Key Bindings for Movement
; 
; ReadInput:
;     Check Keyboard Buffer for Key Presses
;     If Up Arrow Pressed Then
;         Call MovePacmanUp
;     Else If Down Arrow Pressed Then
;         Call MovePacmanDown
;     Else If Left Arrow Pressed Then
;         Call MovePacmanLeft
;     Else If Right Arrow Pressed Then
;         Call MovePacmanRight
;     EndIf
;     If Escape Key Pressed Then
;         Call ExitGame
;     Return
; 
; MovePacmanUp:
;     Set Pac-Man's Direction to Up
;     Update Pac-Man's Position
;     Return
; 
; MovePacmanDown:
;     Set Pac-Man's Direction to Down
;     Update Pac-Man's Position
;     Return
; 
; MovePacmanLeft:
;     Set Pac-Man's Direction to Left
;     Update Pac-Man's Position
;     Return
; 
; MovePacmanRight:
;     Set Pac-Man's Direction to Right
;     Update Pac-Man's Position
;     Return
; 
; ExitGame:
;     Trigger Game Exit Sequence
;     Return
;------------------------------------------------------
org 100h

; pacman.asm - Assembly code for a moving Pac-Man sprite using keyboard arrows in x86, with provided sprite data and drawing subroutine

section .data
    pacman_sprite db 0x00, 0x00, 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00, 0x00
                 db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00
                 db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                 db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                 db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00
                 db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                 db 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                 db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                 db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00
                 db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                 db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                 db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00
                 db 0x00, 0x00, 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00, 0x00

    backBuffer db 169 dup(0)             ; Backbuffer to erase the sprite trace, 13x13 area

    sprite_x dw 100
    sprite_y dw 100

section .bss
    posX resb 1                          ; X position of Pac-Man
    posY resb 1                          ; Y position of Pac-Man
    deltaX resb 1                        ; Delta X (change in X)
    deltaY resb 1                        ; Delta Y (change in Y)
    screenBuffer resb 320*200            ; Reserve space for off-screen buffer


section .text
    global _start

_start:
    ; Window setup and initial clear screen
    call setupWindow
    call clearScreen

    mov [posX], byte 10                ; Initialize X position in the middle
    mov [posY], byte 10                ; Initialize Y position in the middle
    mov [deltaX], byte 0                ; Initialize deltaX to 0
    mov [deltaY], byte 0                ; Initialize deltaY to 0

    ; Main loop
    .mainLoop:
        call clearBuffer                ; Clear the off-screen buffer
        call drawPacman                 ; Draw Pac-Man in the off-screen buffer
        ;call copyBufferToScreen         ; Copy the buffer to the screen
        call readKeyboardInput          ; Read keyboard input
        call updatePosition             ; Update Pac-Man's position based on input
        ;call delay                      ; Introduce a short delay for visibility
        jmp .mainLoop   

; Subroutine to set up the video mode
setupWindow:
    mov ah, 00h
    mov al, 13h
    int 10h
    mov al, 0FFH
    ret

clearScreen:

mov ax, 0xA000
mov es, ax
mov di, 0 
mov cx, 200*320
rep stosb
ret 

; Subroutine to clear the buffer
clearBuffer:
    mov ax, ds                          ; Data segment
    mov es, ax                          ; Set ES to DS
    mov di, screenBuffer                ; Start of the buffer
    mov cx, 320*200                     ; Size of the buffer
    xor al, al                          ; Clear (black)
    rep stosb                           ; Fill the buffer
    ret

; Subroutine to copy buffer to screen
copyBufferToScreen:
    mov ax, 0A000h                      ; Video memory segment for mode 13h
    mov es, ax                          ; Set extra segment to video memory segment
    mov ds, ax                          ; Also set data segment to video memory segment
    mov si, screenBuffer                ; Source index - start of the off-screen buffer
    xor di, di                          ; Destination index - start of the video memory
    mov cx, 320 * 200                   ; Number of pixels to copy (entire screen)
    rep movsb                           ; Copy buffer to video memory
    ret

; Subroutine to draw Pac-Man at the current position
;drawPacman:
;    mov ax, 0A000h
;    mov es, ax
;    xor di, di          ; Top-left corner of the screen
;    mov al, 0x0E        ; A visible color index, e.g., bright yellow
;    stosb               ; Draw a single pixel
;    ret



drawPacman:
    mov ax, 0A000h                      ; Video memory segment for mode 13h
    mov es, ax

    ; Calculate the position in video memory based on posX and posY
    xor bx, bx                          ; Clear BX
    mov al, [posY]                      ; Get Y position
    mov ah, 0                           ; Clear high byte of AX
    imul ax, 320                        ; Multiply Y position by screen width (320 pixels)
    add ax, [posX]                      ; Add X position to get the final offset
    mov di, ax                          ; DI now points to the correct position in video memory

    mov si, pacman_sprite               ; SI points to the start of the sprite data
    mov dx, 13                          ; Number of lines in the sprite

    .drawSpriteRow:
        push dx                         ; Save DX
        mov cx, 13                      ; Number of pixels in the row
        rep movsb                       ; Copy the row to video memory
        pop dx                          ; Restore DX
        add di, 320 - 13                ; Adjust DI to the start of the next row
        dec dx                          ; Decrement row count
        jnz .drawSpriteRow              ; Continue if there are more rows

    ret






; Subroutine to read keyboard input
readKeyboardInput:
    ; Check if a key has been pressed
    mov ah, 01h    
    int 16h         
    jz no_key       ; Jump to no_key if no key press is detected

    ; Get the pressed key code
    mov ah, 00h    
    int 16h         

    ; Arrow keys are read from the keyboard's scan code (in the AH register)
    ; Compare scan codes for arrow keys and call corresponding movement routines
    cmp ah, 48h    ; Check for Up arrow key
    je move_up
    cmp ah, 50h    ; Check for Down arrow key
    je move_down
    cmp ah, 4Bh    ; Check for Left arrow key
    je move_left
    cmp ah, 4Dh    ; Check for Right arrow key
    je move_right

    ; Optionally, check for other keys (like Escape to exit)
    cmp ah, 01h    
    je exit_program

no_key:
    ret

move_left:
    sub [posX], word 2
    ret

move_right:
    add [posX], word 2
    ret

move_up:
    sub [posY], byte 1   ; Decrease Y position by 1
    ret

move_down:
    add [posY], byte 1   ; Increase Y position by 1
    ret


; Subroutine to update Pac-Man's position
updatePosition:
    mov al, [posX]                     ; Load current X position
    add al, [deltaX]                   ; Add deltaX to X position
    mov [posX], al                     ; Store new X position

    mov al, [posY]                     ; Load current Y position
    add al, [deltaY]                   ; Add deltaY to Y position
    mov [posY], al                     ; Store new Y position
    ret


; Subroutine for delay
delay:
    mov cx, 0xFFFF                      ; Delay length
    .delayLoop:
        nop                             ; No operation
        loop .delayLoop
    ret

; wait for a keypress
mov ax, 0c01h
int 21h

; set back normal display mode
mov ax, 03
int 10h

exit_program:
    mov ax, 0x4c00                      ; Exit commands
    mov eax, 1                          ; Exit command
    xor ebx, ebx                        ; Status code
    int 0x80  

