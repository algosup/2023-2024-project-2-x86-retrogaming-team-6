right: 
    ; move the sprite to the right 
    cmp word [xVelocityPac], 0  ; check if the sprite is moving to the left
    jl .reverse                 ; if it is, reverse the direction
    mov bx, [xVelocityPac]      ; move the velocity to bx
    add bx, [xPosPac]           ; add the velocity to the current position
    call update_right
    mov [xPosPac], bx           ; move the new position to the current position
    jmp gameloop
    .reverse: 
        neg word [xVelocityPac] ; reverse the velocity
        jmp right               ; jump back to the right function
    ret 
     
 
 update_right: 
    cmp word [currentPacmanSprite], pacmanRight1 
    je .secondOpen 

    cmp word [currentPacmanSprite], pacmanRight2 
    je .rightSemiOpen 

    cmp word [currentPacmanSprite], pacmanRight4 
    je .rightOpen 

    cmp word [currentPacmanSprite], pacmanRight3 
    je .RightClosed 
    .secondOpen: 
        mov word [currentPacmanSprite], pacmanRight2 ; animation right 2
        mov si, [currentPacmanSprite]
        ret
    .rightSemiOpen:
        mov word [currentPacmanSprite], pacmanRight3 ; animation right 3
        mov si, [currentPacmanSprite]
        ret
    .RightClosed:
        mov word [currentPacmanSprite], pacmanRight4 ; animation right 4
        mov si, [currentPacmanSprite]
        ret 
    .rightOpen:
        mov word [currentPacmanSprite], pacmanRight1 ; set back to original sprite
        mov si, [currentPacmanSprite]
        ret 


 left:
    ; move the sprite to the left
    cmp word [xVelocityPac], 0  ; check if the sprite is moving to the right
    jg .reverse                 ; if it is, reverse the direction
    mov bx, [xVelocityPac]  
    add bx, [xPosPac]           ; add the velocity to the current position
    mov [xPosPac], bx           ; move the new position to the current position
    call update_left
    jmp gameloop                ; return to the main loop
    ; jmp gameloop                ; return to the main
    .reverse: 
        neg word [xVelocityPac] ; reverse the velocity
        jmp left                ; jump back to the left function
    ret


    
 update_left:
    cmp word [currentPacmanSprite], pacmanLeft1 
    je .leftSemiOpen 
    cmp word [currentPacmanSprite], pacmanLeft2 
    je .leftClosed 
    cmp word [currentPacmanSprite], pacmanLeft3 
    je .leftOpen 

    .leftSemiOpen:
        mov word [currentPacmanSprite], pacmanLeft2 
        mov si, [currentPacmanSprite]
        ret

    .leftClosed:
        mov word [currentPacmanSprite], pacmanLeft3 
        mov si, [currentPacmanSprite]
        ret

    .leftOpen:
        mov word [currentPacmanSprite], pacmanLeft1 
        mov si, [currentPacmanSprite]
        ret


 up:
    ; Move the sprite upward
    cmp word [yVelocityPac], 0  ; check the value of velocity
    jg .reverse                 ; if the value is positive, go to sub procedure .reverse
    mov bx, [xPosPac]           ; the position is increased by the speed of the sprite to go to the next line (here 320)
    add bx, [yVelocityPac] 
    mov [xPosPac], bx           ; update the position and speed of the sprite
    call update_up
    jmp gameloop                ; return to the main loop 
    .reverse:
        neg word [yVelocityPac] ; negate the value of velocity to -320
        jmp up                  ; return to the procedure up
    ret

 update_up:
    cmp word [currentPacmanSprite], pacmanUp1 
    je .upSemiOpen 
    cmp word [currentPacmanSprite], pacmanUp2 
    je .upClosed 
    cmp word [currentPacmanSprite], pacmanUp3 
    je .upOpen 

    .upSemiOpen:
        mov word [currentPacmanSprite], pacmanUp2 
        mov si, [currentPacmanSprite]
        ret
    .upClosed:
        mov word [currentPacmanSprite], pacmanUp3 
        mov si, [currentPacmanSprite]
        ret
    .upOpen:
        mov word [currentPacmanSprite], pacmanUp1 
        mov si, [currentPacmanSprite]
        ret



 down:
    ; Move the sprite downward
    cmp word [yVelocityPac], 0  ; check the value of velocity
    jl .reverse                 ; if the value is negative, go to sub procedure .reverse
    mov bx, [xPosPac]           ; the position is increased by the speed of the sprite to go to the next line (here -320)
    add bx, [yVelocityPac]
    mov [xPosPac], bx           ; update the position and speed of the sprite 
    call update_down
    jmp gameloop                ; return to the main loop
    .reverse:
        neg word [yVelocityPac] ; negate the value of velocity to +320
        jmp down                ; return to the procedure down
    ret

 update_down: 
    cmp word [currentPacmanSprite], pacmanDown1 
    je .downSemiOpen                            
    cmp word [currentPacmanSprite], pacmanDown2 
    je .downClosed 
    cmp word [currentPacmanSprite], pacmanDown3 
    je .downOpen 

    .downSemiOpen:
        mov word [currentPacmanSprite], pacmanDown2 
        mov si, [currentPacmanSprite]               
        ret
    .downClosed:
        mov word [currentPacmanSprite], pacmanDown3 
        mov si, [currentPacmanSprite]
        ret
    .downOpen:
        mov word [currentPacmanSprite], pacmanDown1 
        mov si, [currentPacmanSprite]
        ret

        

    stopMovement:
        mov word [xVelocityPac], 0
        mov word [yVelocityPac], 0
        jmp gameloop