org 100h
 
%include 'sprites.inc'

%define SPRITEW 8
%define SPRITEH 8

; ---------------------------------------------------------------------------
section .data
     
; initialize data for Pacman
yPosPac dw 200; the starting y coordinate of the sprite
xPosPac dw 100                   ; the starting x coordinate of the sprite
yVelocityPac dw 960          ; to go from one line to another
xVelocityPac dw 6/2              ; horizontal speed
directionPac db 'R'            ; Current direction (R, L, U, D)

currentPacmanSprite dd pacman_right_1 ; the current sprite to be displayed
;---------------------------------------------------------------------------
 
section .text
 
        mov ah, 00h ; set video mode requirement
        mov al, 13h ; set video mode option to 320 x 200 256 colors
        int 10h

        gameloop:
        mov al, 0FFh
        call clearScreen

        ; display maze
        call printMaze 



        ; display pacman
        mov si, [currentPacmanSprite]
        mov di, [xPosPac]
        call draw_pacman

        ; this loop is to slow down the animation
        mov cx, 30000
        waitloop:
        loop waitloop

        ;reset the keyboard buffer and then wait for a keypress :
        mov ax, 0C01h ;
        int 21h
 
        ; update the positions of the sprites
; ---------------------------------------------------------------------------
call waitForKey
; check if key pressed WASD
cmp al, 119 ; 'w' ASCII
je up
cmp al, 115 ; 's' ASCII
je down
cmp al, 100 ; 'd' ASCII 
je right
cmp al, 97 ; 'a' ASCII
je left

; check if key pressed zqsd
cmp al, 122 ; 'z' ASCII
je up
cmp al, 115 ; 's' ASCII
je down
cmp al, 100 ; 'd' ASCII
je right
cmp al, 113 ; 'q' ASCII
je left

; ---------------------------------------------------------------------------
; Exit the program if the escape key is pressed
cmp al, 27                  ; ASCII value of escape key
je clearScreen
je quit                     ; go to the exit function if the comparison return an equal
jmp gameloop                ; else return to the main loop

; ---------------------------------------------------------------------------
;the_functions:



draw_pacman:
    mov ax, 0xA000              ; memory location of the video mode
    mov es, ax
    mov dx, 8                   ; set the destination index to 8 (starting position in video memory)
    .eachLine:                  ; loop till each line of the sprite is printed
        mov cx, 8               ; setthe count register to 8 (number of pixel to copy per line)
        rep movsb               ; repeat the move byte action (copying pixel)
        add di, 320-8           ; move the destination index to the next line (320 pixel per line)
        dec dx                  ; decrement the loop counter (dx) and jump to .eachLine if not zero
        jnz .eachLine
        ret                     ; return to the main loop


; ---------------------------------------------------------------------------
right: 
    ; move the sprite to the right 
    mov word [currentPacmanSprite], pacman ; set the current sprite to the right facing sprite
    cmp word [xVelocityPac], 0 ; check if the sprite is moving to the left
    jl .reverse ; if it is, reverse the direction
    mov bx , [xVelocityPac] ; move the velocity to bx
    add bx, [xPosPac] ; add the velocity to the current position
    mov [xPosPac], bx ; move the new position to the current position
    jmp gameloop
    .reverse: 
        neg word [xVelocityPac] ; reverse the velocity
        jmp right ; jump back to the right_loop function
    ret



left:
    ; move the sprite to the left
    mov word [currentPacmanSprite], pacman ; set the current sprite to the left facing sprite
    cmp word [xVelocityPac], 0                       ; check if the sprite is moving to the right
    jg .reverse                                   ; if it is, reverse the direction
    mov bx , [xVelocityPac]                          ; move the velocity to bx
    add bx, [xPosPac]                                ; add the velocity to the current position
    mov [xPosPac], bx                                ; move the new position to the current position
    jmp gameloop
    .reverse: 
        neg word [xVelocityPac]                      ; reverse the velocity
        jmp left                               ; jump back to the left function
    ret 


up:
    ; Move the sprite upward
    mov word [currentPacmanSprite], pacman ; select the sprite to be displayed
    cmp word [yVelocityPac], 0     ; check the value of velocity
    jg .reverse                 ; if the value is positive go to sub procedure .reverse
    mov bx, [xPosPac]              ; the position is increased by the speed of the sprite to go to the next line (here 320)
    add bx, [yVelocityPac]
    mov [xPosPac], bx              ; update the position and speed of the sprite
    jmp gameloop                ; return to the main loop
    .reverse:
        neg word [yVelocityPac]    ; negate the value of velocity to -320
        jmp up                  ; return to the procedure up
    ret

down:
    ; Move the sprite downward
    mov word [currentPacmanSprite], pacman ; select the sprite to be displayed
    cmp word [yVelocityPac], 0     ; check the value of velocity
    jl .reverse                 ; if the value is negative go to sub procedure .reverse
    mov bx, [xPosPac]              ; the position is increased by the speed of the sprite to go to the next line (here -320)
    add bx, [yVelocityPac]
    mov [xPosPac], bx              ; update the position and speed of the sprite 
    jmp gameloop                ; return to the main loop
    .reverse:
        neg word [yVelocityPac]    ; negate the value of velocity to +320
        jmp down                ; return to the procedure down
    ret
 ; ---------------------------------------------------------------------------

waitForKey:
    mov ah, 0x00                 ; BIOS function to read keyboard input
    int 16h                      ; Call BIOS interrupt
    ret

;dos box default video mode
mov ax, 03h                 ; set into video mode
int 21h                     ; call DOS interupt
int 20h                     ; quit 

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