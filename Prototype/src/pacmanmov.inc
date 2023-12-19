org 100h
%define SPRITEW 8

; ---------------------------------------------------------------------------
section .data
     
; initialize data for Pacman
yPosPac dw 100; the starting y coordinate of the sprite
xPosPac dw 100                   ; the starting x coordinate of the sprite
yVelocityPac dw 640          ; to go from one line to another
xVelocityPac dw 4/2              ; horizontal speed
directionPac db 'R'            ; Current direction (R, L, U, D)

currentPacmanSprite dd pacmanRight1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; Pacman sprites

pacmanRight1    db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                db 0x00, 0x0e, 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e 
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00
                db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e 
                db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e 

pacmanRight2    db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                db 0x00, 0x0e, 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e 
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00
                db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e 
                db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e 

pacmanRight3    db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                db 0x00, 0x0e, 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e 
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00, 0x00
                db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e 
                db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e 

pacmanRight4    db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
                db 0x00, 0x0e, 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e 
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
                db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
                db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e 
                db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e 

pacmanDown1   db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00
              db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x0e
              db 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x00, 0x00, 0x00, 0x0e, 0x0e, 0x00

pacmanDown2   db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00
              db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x0e
              db 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x00

pacmanDown3   db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00
              db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x0e
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
              db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00



pacmanUp1   db 0x0e, 0x0e, 0x00, 0x00, 0x00, 0x0e, 0x0e, 0x00
            db 0x0e, 0x0e, 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
            db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00


pacmanUp2   db 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
            db 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
            db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00

pacmanUp3   db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
            db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
            db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00




pacmanLeft1    db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e 
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x00, 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00

pacmanLeft2    db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e 
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x00, 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00

pacmanLeft3    db 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x0e, 0x0e, 0x0e 
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00
               db 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x0e, 0x00, 0x00

; ---------------------------------------------------------------------------
section .text

MainLoop: 
 ; display pacman
    mov si, [currentPacmanSprite]
    mov di, [xPosPac]
    call draw_pacman    

    ; update the positions of the sprites
    call waitForKey
 ; check if key pressed WASD
    cmp al, 119 ; 'w' ASCII
    je up
    cmp al, 115 ; 's' ASCII
    je down
    cmp al, 4DH ; 'd' ASCII 
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
 ; Exit the program if the escape key is pressed
    cmp al, 27 ; ASCII value of escape key
    je quit ; go to the exit function if the comparison returns equal
 ; jump back to the main loop if no key is pressed


 draw_pacman:
    mov ax, 0xA000 ; memory location of the video mode
    mov es, ax ; move the video mode to the ax register
    mov dx, 8 ; set the destination index to 8 (starting position in video memory)
    .eachLine: ; loop till each line of the sprite is printed
        mov cx, 8 ; set the count register to 8 (number of pixels to copy per line)
        rep movsb ; repeat the move byte action (copying pixels)
        add di, 320-8 ; move the destination index to the next line (320 pixels per line)
        dec dx ; decrement the loop counter (dx) and jump to .eachLine if not zero
        Jnz .eachLine
    ret ; return to the main loop


 right: 
    ; move the sprite to the right 
    cmp word [xVelocityPac], 0 ; check if the sprite is moving to the left
    jl .reverse ; if it is, reverse the direction
    mov bx, [xVelocityPac] ; move the velocity to bx
    add bx, [xPosPac] ; add the velocity to the current position
    call update_right
    mov [xPosPac], bx ; move the new position to the current position
    jmp gameloop
    .reverse: 
        neg word [xVelocityPac] ; reverse the velocity
        jmp right ; jump back to the right function
    ret 
     
 
 update_right: 
    cmp word [currentPacmanSprite], pacmanRight1 ; check if the current sprite is the right facing sprite
    je .secondOpen ; if it is, jump to .rightSemiOpen

    cmp word [currentPacmanSprite], pacmanRight2 ; check if the current sprite is the right facing sprite
    je .rightSemiOpen ; if it is, jump to .semiRightClosed

    cmp word [currentPacmanSprite], pacmanRight4 ; check if the current sprite is the right facing sprite
    je .rightOpen ; if it is, jump to .RightOpen

    cmp word [currentPacmanSprite], pacmanRight3 ; check if the current sprite is the right facing sprite
    je .RightClosed ; if it is, jump to .RightClosed

    .secondOpen: 
        mov word [currentPacmanSprite], pacmanRight2 ; set the current sprite to the right facing sprite
        mov si, [currentPacmanSprite]
        ret
    .rightSemiOpen:
        mov word [currentPacmanSprite], pacmanRight3 ; set the current sprite to the right facing sprite
        mov si, [currentPacmanSprite]
        ret
    .RightClosed:
        mov word [currentPacmanSprite], pacmanRight4 ; set the current sprite to the right facing sprite
        mov si, [currentPacmanSprite]
        ret 
    .rightOpen:
        mov word [currentPacmanSprite], pacmanRight1 ; set the current sprite to the right facing sprite
        mov si, [currentPacmanSprite]
        ret 


 left:
    ; move the sprite to the left
    cmp word [xVelocityPac], 0 ; check if the sprite is moving to the right
    jg .reverse ; if it is, reverse the direction
    mov bx, [xVelocityPac] ; move the velocity to bx
    add bx, [xPosPac] ; add the velocity to the current position
    mov [xPosPac], bx ; move the new position to the current position
    call update_left
    jmp gameloop
    .reverse: 
        neg word [xVelocityPac] ; reverse the velocity
        jmp left ; jump back to the left function
    ret 

 update_left:
    cmp word [currentPacmanSprite], pacmanLeft1 ; check if the current sprite is the left facing sprite
    je .leftSemiOpen ; if it is, jump to .leftSemiOpen
    cmp word [currentPacmanSprite], pacmanLeft2 ; check if the current sprite is the left facing sprite
    je .leftClosed ; if it is, jump to .leftClosed
    cmp word [currentPacmanSprite], pacmanLeft3 ; check if the current sprite is the left facing sprite
    je .leftOpen ; if it is, jump to .leftOpen

    .leftSemiOpen:
        mov word [currentPacmanSprite], pacmanLeft2 ; set the current sprite to the left facing sprite
        mov si, [currentPacmanSprite]
        ret

    .leftClosed:
        mov word [currentPacmanSprite], pacmanLeft3 ; set the current sprite to the left facing sprite
        mov si, [currentPacmanSprite]
        ret

    .leftOpen:
        mov word [currentPacmanSprite], pacmanLeft1 ; set the current sprite to the left facing sprite
        mov si, [currentPacmanSprite]
        ret


 up:
    ; Move the sprite upward
    cmp word [yVelocityPac], 0 ; check the value of velocity
    jg .reverse ; if the value is positive, go to sub procedure .reverse
    mov bx, [xPosPac] ; the position is increased by the speed of the sprite to go to the next line (here 320)
    add bx, [yVelocityPac]
    mov [xPosPac], bx ; update the position and speed of the sprite
    call update_up
    jmp gameloop ; return to the main loop
    .reverse:
        neg word [yVelocityPac] ; negate the value of velocity to -320
        jmp up ; return to the procedure up
    ret

 update_up:
    cmp word [currentPacmanSprite], pacmanUp1 ; check if the current sprite is the up facing sprite
    je .upSemiOpen ; if it is, jump to .upSemiOpen
    cmp word [currentPacmanSprite], pacmanUp2 ; check if the current sprite is the up facing sprite
    je .upClosed ; if it is, jump to .upClosed
    cmp word [currentPacmanSprite], pacmanUp3 ; check if the current sprite is the up facing sprite
    je .upOpen ; if it is, jump to .upOpen

    .upSemiOpen:
        mov word [currentPacmanSprite], pacmanUp2 ; set the current sprite to the up facing sprite
        mov si, [currentPacmanSprite]
        ret
    .upClosed:
        mov word [currentPacmanSprite], pacmanUp3 ; set the current sprite to the up facing sprite
        mov si, [currentPacmanSprite]
        ret
    .upOpen:
        mov word [currentPacmanSprite], pacmanUp1 ; set the current sprite to the up facing sprite
        mov si, [currentPacmanSprite]
        ret



 down:
    ; Move the sprite downward
    cmp word [yVelocityPac], 0 ; check the value of velocity
    jl .reverse ; if the value is negative, go to sub procedure .reverse
    mov bx, [xPosPac] ; the position is increased by the speed of the sprite to go to the next line (here -320)
    add bx, [yVelocityPac]
    mov [xPosPac], bx ; update the position and speed of the sprite 
    call update_down
    jmp gameloop ; return to the main loop
    .reverse:
        neg word [yVelocityPac] ; negate the value of velocity to +320
        jmp down ; return to the procedure down
    ret

 update_down: 
    cmp word [currentPacmanSprite], pacmanDown1 ; check if the current sprite is the down facing sprite
    je .downSemiOpen ; if it is, jump to .downSemiOpen
    cmp word [currentPacmanSprite], pacmanDown2 ; check if the current sprite is the down facing sprite
    je .downClosed ; if it is, jump to .downClosed
    cmp word [currentPacmanSprite], pacmanDown3 ; check if the current sprite is the down facing sprite
    je .downOpen ; if it is, jump to .downOpen

    .downSemiOpen:
        mov word [currentPacmanSprite], pacmanDown2 ; set the current sprite to the down facing sprite
        mov si, [currentPacmanSprite]
        ret
    .downClosed:
        mov word [currentPacmanSprite], pacmanDown3 ; set the current sprite to the down facing sprite
        mov si, [currentPacmanSprite]
        ret
    .downOpen:
        mov word [currentPacmanSprite], pacmanDown1 ; set the current sprite to the down facing sprite
        mov si, [currentPacmanSprite]
        ret