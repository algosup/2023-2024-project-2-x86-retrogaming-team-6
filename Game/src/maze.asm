[bits 16]
[org 0x100]

%include "sprites.inc"  

; Constants
%define SCREEN_WIDTH 320
%define SCREEN_HEIGHT 200

%define TILE_WIDTH 8
%define TILE_HEIGHT 8


%define SPRITEW 8
%define SPRITEH 8

%define MAZERLIMIT 40
%define MAZEBLIMIT 25

%define EMPTY_SPACE 0
%define DOT 2
%define WALL 1
%define PACMAN 5
%define GATES 4
%define POWER_PELLET 3
%define OUTSIDE_MAP 9

%define PACMAN_CURRENT 6     ; Unique value to mark Pacman's current position


; Data Segment
section .data

direction dw 0                 ; 0 = No movement, 1 = Right, 2 = Left, 3 = Up, 4 = Down
directionChanged db 0          ; 0 = No change, 1 = Changed
isDirectionFeasible db 0       ; 0 = Not feasible, 1 = Feasible

canMoveRight db 0      ; 0 for no, 1 for yes
canMoveLeft db 0       ; 0 for no, 1 for yes
canMoveUp db 0         ; 0 for no, 1 for yes
canMoveDown db 0       ; 0 for no, 1 for yes


collision db 0                 ; 0 = No collision, 1 = Collision

yPosPacTile dw 0               ; Pacman's Y tile position

currentSprite dw 0
xPos dw 0
yPos dw 0
old_XPOS dw 0
old_YPOS dw 0

xVelocityPac dw 1                ; Pacman's horizontal speed
yVelocityPac dw 320             ; Pacman's vertical speed (for line changes)
currentPacmanSprite dd Pacman    ; Current sprite of Pacman
ASCII_Maze: 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 3, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 2, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9  
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0, 1, 1, 4, 4, 4, 1, 1, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 1, 2, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 1, 1, 1, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 3, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 3, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9

    Column dw 40
    Row dw 25
    PixelPerTileRow dw 2560

; BSS Segment
section .bss
keyPressed resb 1
keyReleased resb 1
xPosPac resw 1                 ; Pacman's starting X coordinate
yPosPac resw 1                  ; Pacman's starting Y coordinate
newKeyPress resb 1              ; Stores the most recent key press
xPosPacTile resw 1              ; Pacman's starting X tile position

;===============================================================================

; Text Segment
section .text
maze:
    mov ah, 00h
    mov al, 13h
    int 10h

    call clearScreen
    call find_pacman_spawn ; Find the spawn location before drawing the maze

    ; After the maze is drawn, draw Pacman at the spawn point
    mov ax, [yPosPac]    ; Get Pacman's Y pixel position
    mov bx, [xPosPac]    ; Get Pacman's X pixel position

    call Maze


mazeloop: 

    ; Handle user input and movement
    call handle_user_input

    mov ax, [direction]
    cmp ax, 1
    je move_right
    cmp ax, 2
    je move_left
    cmp ax, 3
    je move_up
    cmp ax, 4
    je move_down

    ; Check for game exit condition
    cmp al, 27                  ; ASCII value of escape key
    je clearScreen
    je quit                     ; Exit if escape key is pressed

    ; Loop back to start of mazeloop
    jmp mazeloop
   
;===============================================================================

; Iterates over the ASCII_Maze and sets the spawn point based on the value 5
find_pacman_spawn:
    mov bx, 0                ; Start index for scanning the maze array
    mov cx, MAZERLIMIT       ; Total number of tiles in a row
    mov dx, MAZEBLIMIT       ; Total number of rows in the maze

.find_spawn_loop:
    ; Check if current tile is the spawn point (ASCII value 5)
    cmp byte [ASCII_Maze + bx], PACMAN
    je .found_spawn
    ; Move to the next tile
    inc bx
    ; Check if we reached the end of a row
    dec cx
    jnz .find_spawn_loop
    ; Move to the next row
    mov cx, MAZERLIMIT
    dec dx
    jnz .find_spawn_loop
    ; If spawn point not found, you can handle it here
    ; For now, just hang (or add error handling)
    jmp $

.found_spawn:
    xor dx, dx            ; Clear dx for division
    mov ax, bx            ; Copy index to ax for division
    mov cx, MAZERLIMIT    ; Move MAZERLIMIT to the CX register
    div cx                ; ax = bx / cx, dx = bx MOD cx
    ; ax now contains the Y coordinate in tiles
    ; dx now contains the X coordinate in tiles
    shl ax, 3             ; Multiply by 8 to convert tile coordinates to pixels
    shl dx, 3             ; Multiply by 8 to convert tile coordinates to pixels
    mov [yPosPac], ax     ; Store Y pixel position
    mov [xPosPac], dx     ; Store X pixel position
    ret

;===============================================================================

; Function: Draw Walls  
drawWalls:
        mov dx, 8
        .eachLine:  
            mov cx, 8
            rep movsb
            add di, 320-8
            dec dx
            jnz .eachLine
            call .nextColumn
        inc bx
        ret
    .nextColumn:
        mov ax, [Column]
        dec ax
        mov [Column], ax
        cmp ax, 0
        je .nextRow
        sub di, 2552
        ret
        
    .nextRow:
        mov ax, [Row]
        dec ax
        mov [Row], ax
        cmp ax, 0
        je mazeloop
        mov ax, 40
        mov [Column], ax
        mov ax, [PixelPerTileRow] 
        mov di, ax
        add ax, 2560
        mov [PixelPerTileRow], ax  
        ret 

Maze:
    mov di, 0
    mov bx, ASCII_Maze
    .wallchoice:
        mov al, [bx]
        cmp al,  EMPTY_SPACE         
        je .drawEmpty        
        cmp al, WALL
        je .drawWall
        cmp al, DOT
        je .DrawDot
        cmp al, POWER_PELLET
        je .DrawPowerPellet
        cmp al, GATES
        je .DrawGates

    
      ; ===================================
      
.drawEmpty:
     mov si, EmptySpace
     call drawWalls
     jmp .wallchoice

.drawWall:
     mov si, Walls
     call drawWalls
     jmp .wallchoice 

.DrawDot:
     mov si, Dots
     call drawWalls
     jmp .wallchoice

.DrawGates:
   mov si, Gates
   call drawWalls
   jmp .wallchoice

.DrawPowerPellet:
      mov si, PowerPellet
      call drawWalls
      jmp .wallchoice


;===============================================================================

handle_user_input:
    ; Check for key press
    mov ah, 0x01
    int 0x16      ; Check if a key has been pressed
    jz .noKeyPress ; Jump if no key press

    ; Read the key press
    mov ah, 0x00
    int 0x16  ; BIOS keyboard service

    ; Update direction based on the most recent keypress
    cmp al, 100 ; 'd' key for right
    je .setRight
    cmp al, 113 ; 'q' key for left
    je .setLeft
    cmp al, 122 ; 'z' key for up
    je .setUp
    cmp al, 115 ; 's' key for down
    je .setDown
    jmp .endInput

.setRight:
    mov word [direction], 1
    jmp .endInput
.setLeft:
    mov word [direction], 2
    jmp .endInput
.setUp:
    mov word [direction], 3
    jmp .endInput
.setDown:
    mov word [direction], 4
    jmp .endInput

.noKeyPress:
.endInput:
    ret

;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; Subroutine: Move Right
; Moves Pac-Man to the right if possible, and updates the sprite accordingly.
;-------------------------------------------------------------------------------

move_right:
    .moveLoop:
        ; Check for a new direction key press
        call check_new_direction_press
        cmp byte [directionChanged], 1
        je .changeDirection

        ; Predict the next position to the right
        mov ax, [yPosPac]             ; Current Y position
        mov bx, [xPosPac]             ; Current X position
        add bx, 1                     ; Move 1 pixel to the right

        ; Check for collision with a wall
        call check_collision_right    ; Assuming this checks [yPosPac] and [xPosPac] positions
        cmp byte [collision], 1
        je .stopMovement              ; If collision, stop movement

        ; Update Pacman's position
        mov [xPosPac], bx             ; Update X position

        ; Render new position and delay
        call update_sprite_and_delay  ; Update the sprite and insert delay

        jmp .moveLoop                 ; Continue the loop for moving right

    .changeDirection:
        ; Direction has changed, exit current loop to handle new direction
        jmp mazeloop

    .stopMovement:
        ; Collision detected, reset direction and return to main loop
        mov word [direction], 0
        jmp mazeloop
        
;-------------------------------------------------------------------------------
; This code assumes that the following are defined and implemented properly:
; - check_direction_feasibility
; - check_new_direction_press
; - update_sprite_and_delay
; - mazeloop label as the main loop of the game
; - canMoveRight byte that indicates if moving right is possible
; - directionChanged byte that indicates if a direction change has occurred
; - direction word that indicates the current direction of movement
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------

move_left:
    ; Begin a loop for continuous movement
    .moveLoop:
        ; Calculate the position 8 pixels to the left for collision check
        mov ax, [yPosPac]             ; Current Y position
        mov bx, [xPosPac]             ; Current X position
        sub bx, 1                     ; Predict next position by 8 pixels to the left

        ; Convert predicted position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision with a wall
        cmp byte [si], WALL
        je .stopMovement              ; If it's a wall, stop movement

        ; Update Pacman's position pixel by pixel
        mov bx, [xPosPac]
        sub bx, 1                     ; Move only 1 pixel to the left
        mov [xPosPac], bx             ; Update X position

        ; Clear Pacman's old sprite
        mov ax, [old_YPOS]
        mov bx, [old_XPOS]
        call clear_sprite_at_position

        ; Store the new position as the old position for the next loop
        mov ax, [yPosPac]
        mov [old_YPOS], ax
        mov bx, [xPosPac]
        mov [old_XPOS], bx

        ; Draw Pacman's new sprite at the new position
        mov ax, [yPosPac]
        mov bx, [xPosPac]
        call draw_pacman_at_position

        ; Insert a delay for animation smoothness
        mov cx, 35000                ; Adjust the delay as needed
        .delayLoop:
            nop
            loop .delayLoop

        jmp .moveLoop                 ; Continue the loop for moving left

    .stopMovement:
        ; Collision detected, reset direction and return to main loop
        mov word [direction], 0
        jmp mazeloop

;-------------------------------------------------------------------------------

move_up:
    ; Begin a loop for continuous movement
    .moveLoop:
        ; Calculate the position 8 pixels above for collision check
        mov ax, [yPosPac]             ; Current Y position
        mov bx, [xPosPac]             ; Current X position
        sub ax, 1                     ; Predict next position by 8 pixels upwards

        ; Convert predicted position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision with a wall
        cmp byte [si], WALL
        je .stopMovement              ; If it's a wall, stop movement

        ; Update Pacman's position pixel by pixel
        mov ax, [yPosPac]
        sub ax, 1                     ; Move only 1 pixel upwards
        mov [yPosPac], ax             ; Update Y position

        ; Clear Pacman's old sprite
        mov ax, [old_YPOS]
        mov bx, [old_XPOS]
        call clear_sprite_at_position

        ; Store the new position as the old position for the next loop
        mov ax, [yPosPac]
        mov [old_YPOS], ax
        mov bx, [xPosPac]
        mov [old_XPOS], bx

        ; Draw Pacman's new sprite at the new position
        mov ax, [yPosPac]
        mov bx, [xPosPac]
        call draw_pacman_at_position

        ; Insert a delay for animation smoothness
        mov cx, 35000                 ; Adjust the delay as needed
        .delayLoop:
            nop
            loop .delayLoop

        jmp .moveLoop                 ; Continue the loop for moving up

    .stopMovement:
        ; Collision detected, reset direction and return to main loop
        mov word [direction], 0
        jmp mazeloop

;-------------------------------------------------------------------------------

move_down:
    ; Begin a loop for continuous movement
    .moveLoop:
        ; Calculate the position 8 pixels below for collision check
        mov ax, [yPosPac]             ; Current Y position
        mov bx, [xPosPac]             ; Current X position
        add ax, 8                     ; Predict next position by 8 pixels downwards

        ; Convert predicted position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision with a wall
        cmp byte [si], WALL
        je .stopMovement              ; If it's a wall, stop movement

        ; Update Pacman's position pixel by pixel
        mov ax, [yPosPac]
        add ax, 1                     ; Move only 1 pixel downwards
        mov [yPosPac], ax             ; Update Y position

        ; Clear Pacman's old sprite
        mov ax, [old_YPOS]
        mov bx, [old_XPOS]
        call clear_sprite_at_position

        ; Store the new position as the old position for the next loop
        mov ax, [yPosPac]
        mov [old_YPOS], ax
        mov bx, [xPosPac]
        mov [old_XPOS], bx

        ; Draw Pacman's new sprite at the new position
        mov ax, [yPosPac]
        mov bx, [xPosPac]
        call draw_pacman_at_position

        ; Insert a delay for animation smoothness
        mov cx, 35000                 ; Adjust the delay as needed
        .delayLoop:
            nop
            loop .delayLoop

        jmp .moveLoop                 ; Continue the loop for moving down

    .stopMovement:
        ; Collision detected, reset direction and return to main loop
        mov word [direction], 0
        jmp mazeloop

;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; Subroutine: Check Collision Right
; Checks if moving to the right from Pacman's current position will hit a wall.
; Input: None (uses global variables for Pacman's position)
; Output: Sets collision flag (1 if there is a wall to the right, 0 otherwise)
;-------------------------------------------------------------------------------

check_movement_feasibility:
    call check_collision_right
    call check_collision_left
    call check_collision_up
    call check_collision_down
    ret


check_collision_right:
    pusha                       ; Save all registers
    
    mov ax, [yPosPac]           ; Get current Y position of Pacman
    mov bx, [xPosPac]           ; Get current X position of Pacman
    add bx, TILE_WIDTH          ; Predict the next X position (to the right)
    shr bx, 3                   ; Convert X pixel to tile coordinate
    shr ax, 3                   ; Convert Y pixel to tile coordinate

    ; Calculate index for ASCII_Maze array
    imul ax, MAZERLIMIT         ; Convert Y tile to index
    add ax, bx                  ; Add X offset to index
    mov si, ASCII_Maze
    add si, ax                  ; SI points to the tile in the maze

    ; Check for a wall
    cmp byte [si], WALL
    je .collision               ; If wall, set collision flag

    mov byte [collision], 0          ; No collision
    popa                        ; Restore all registers
    ret

.collision:
    mov byte [collision], 1          ; Collision detected
    popa                        ; Restore all registers
    mov byte [canMoveRight], al
    ret

check_collision_left:
    pusha                       ; Save all registers
    
    mov ax, [yPosPac]           ; Get current Y position of Pacman
    mov bx, [xPosPac]           ; Get current X position of Pacman
    sub bx, TILE_WIDTH          ; Predict the next X position (to the left)
    shr bx, 3                   ; Convert X pixel to tile coordinate
    shr ax, 3                   ; Convert Y pixel to tile coordinate

    ; Calculate index for ASCII_Maze array
    imul ax, MAZERLIMIT         ; Convert Y tile to index
    add ax, bx                  ; Add X offset to index
    mov si, ASCII_Maze
    add si, ax                  ; SI points to the tile in the maze

    ; Check for a wall
    cmp byte [si], WALL
    je .collision               ; If wall, set collision flag

    mov byte [collision], 0          ; No collision
    popa                        ; Restore all registers
    ret

.collision:
    mov byte [collision], 1          ; Collision detected
    popa                        ; Restore all registers
    mov byte [canMoveLeft], al
    ret

check_collision_up:
    pusha                       ; Save all registers
    
    mov ax, [yPosPac]           ; Get current Y position of Pacman
    mov bx, [xPosPac]           ; Get current X position of Pacman
    sub ax, TILE_WIDTH          ; Predict the next Y position (upwards)
    shr bx, 3                   ; Convert X pixel to tile coordinate
    shr ax, 3                   ; Convert Y pixel to tile coordinate

    ; Calculate index for ASCII_Maze array
    imul ax, MAZERLIMIT         ; Convert Y tile to index
    add ax, bx                  ; Add X offset to index
    mov si, ASCII_Maze
    add si, ax                  ; SI points to the tile in the maze

    ; Check for a wall
    cmp byte [si], WALL
    je .collision               ; If wall, set collision flag

    mov byte[collision], 0          ; No collision
    popa                        ; Restore all registers
    ret

.collision:
    mov byte [collision], 1          ; Collision detected
    popa                        ; Restore all registers
    mov byte[canMoveUp], al
    ret

check_collision_down:
    pusha                       ; Save all registers
    
    mov ax, [yPosPac]           ; Get current Y position of Pacman
    mov bx, [xPosPac]           ; Get current X position of Pacman
    add ax, TILE_WIDTH          ; Predict the next Y position (downwards)
    shr bx, 3                   ; Convert X pixel to tile coordinate
    shr ax, 3                   ; Convert Y pixel to tile coordinate

    ; Calculate index for ASCII_Maze array
    imul ax, MAZERLIMIT         ; Convert Y tile to index
    add ax, bx                  ; Add X offset to index
    mov si, ASCII_Maze
    add si, ax                  ; SI points to the tile in the maze

    ; Check for a wall
    cmp byte [si], WALL
    je .collision               ; If wall, set collision flag

    mov byte [collision], 0          ; No collision
    popa                        ; Restore all registers 
    ret

.collision:
    mov byte [collision], 1          ; Collision detected
    popa                        ; Restore all registers
    mov byte [canMoveDown], al
    ret

;-------------------------------------------------------------------------------

clear_input_buffer:
    ; Vider le tampon de saisie
    mov ah, 0x0C ; Fonction BIOS pour vider le tampon du clavier
    mov al, 0    ; Sous-fonction pour lire le prochain caractère
    int 0x21     ; Appel d'interruption du DOS
    ret

;-------------------------------------------------------------------------------

check_new_direction_press:
    pusha                           ; Save registers
    mov     ah, 01h                 ; Function: Check for keystroke
    int     16h                     ; Call keyboard interrupt
    jz      no_new_key_press        ; Jump if no key press

    ; Read the key press
    mov     ah, 00h                 ; Function: Get keystroke
    int     16h                     ; Call keyboard interrupt
    mov     [newKeyPress], al       ; Store new key press for direction change

    ; Check if the new direction is feasible before changing
    call    check_direction_feasibility

    ; Change direction based on key press if the move is feasible
    cmp     word [newKeyPress], 'd'      ; Compare with 'd' for right
    je      right_feasible
    cmp     word [newKeyPress], 'a'      ; Compare with 'a' for left
    je      left_feasible
    cmp     word [newKeyPress], 'w'      ; Compare with 'w' for up
    je      up_feasible
    cmp     word [newKeyPress], 's'      ; Compare with 's' for down
    je      down_feasible

    jmp     no_new_key_press

right_feasible:
    cmp     byte [canMoveRight], 1
    jne     no_new_key_press
    mov     word [direction], 1
    mov     byte [directionChanged], 1
    jmp     change_done

left_feasible:
    cmp     byte [canMoveLeft], 1
    jne     no_new_key_press
    mov     word [direction], 2
    mov     byte [directionChanged], 1
    jmp     change_done

up_feasible:
    cmp     byte [canMoveUp], 1
    jne     no_new_key_press
    mov     word [direction], 3
    mov     byte [directionChanged], 1
    jmp     change_done

down_feasible:
    cmp     byte [canMoveDown], 1
    jne     no_new_key_press
    mov     word [direction], 4
    mov     byte [directionChanged], 1
    jmp     change_done

no_new_key_press:
    mov     byte [directionChanged], 0

change_done:
    popa                            ; Restore registers
    ret

;-------------------------------------------------------------------------------

update_sprite_and_delay:
    ; Clear Pacman's old sprite
    mov ax, [old_YPOS]
    mov bx, [old_XPOS]
    call clear_sprite_at_position

    ; Store the new position as the old position for the next loop
    mov ax, [yPosPac]
    mov [old_YPOS], ax
    mov bx, [xPosPac]
    mov [old_XPOS], bx

    ; Draw Pacman's new sprite at the new position
    mov ax, [yPosPac]
    mov bx, [xPosPac]
    call draw_pacman_at_position

    ; Insert a delay for animation smoothness
    mov cx, 35000
    .delayLoop:
        nop
        loop .delayLoop

    ret

;-------------------------------------------------------------------------------

; Subroutine: Check Direction Feasibility
; Checks if moving in the current direction is possible (i.e., no wall is present)
; Input: None (uses global variables)
; Output: Sets the canMove flags (canMoveUp, canMoveDown, canMoveLeft, canMoveRight)

check_direction_feasibility:
    ; Save current position
    mov ax, [yPosPacTile]
    mov bx, [xPosPacTile]
    
    ; Check Up
    dec ax
    call check_wall_collision
    mov [canMoveUp], al
    
    ; Restore position and Check Down
    mov ax, [yPosPacTile]
    inc ax
    call check_wall_collision
    mov [canMoveDown], al

    ; Restore position and Check Left
    mov ax, [yPosPacTile]
    mov bx, [xPosPacTile]
    dec bx
    call check_wall_collision
    mov [canMoveLeft], al

    ; Restore position and Check Right
    inc bx
    call check_wall_collision
    mov [canMoveRight], al
    
    ; Restore registers if needed and return
    ret

check_wall_collision:
    push ax
    push bx
    
    ; Convert tile position to index
    imul ax, MAZERLIMIT
    add ax, bx
    add ax, ASCII_Maze  ; Point to the ASCII_Maze with the offset
    
    ; Check for wall
    mov si, ax          ; Move the content of AX to SI
    cmp byte [si], WALL ; Compare the byte at memory location SI with WALL

    sete al  ; Set AL to 1 if there is a wall, otherwise 0
    
    pop bx
    pop ax
    ret

;-------------------------------------------------------------------------------


;-------------------------------------------------------------------------------

clear_sprite_at_position:
    ; Assuming ax = Y position, bx = X position
    ; and each sprite is 8x8 pixels
    mov di, ax
    imul di, 320     ; Convert Y position to row index in video memory
    add di, bx       ; Add X position to get the exact memory location
    mov ax, 0A000h   ; VGA video memory segment
    mov es, ax
    mov cx, 8        ; Height of the sprite

.clear_row:
    push cx
    mov cx, 8        ; Width of the sprite
    mov al, 0        ; Background color index (e.g., 0 for black)
    rep stosb        ; Draw 8 pixels of the background color
    pop cx
    add di, 320 - 8  ; Move to the next row
    loop .clear_row

    ret

;-------------------------------------------------------------------------------

draw_pacman_at_position:
    ; Assuming ax = Y position, bx = X position

    ; Calculate the starting address in video memory
    mov di, ax                ; DI = Y position
    imul di, 320              ; Convert Y position to row index in video memory
    add di, bx                ; Add X position to get the exact memory location

    ; Set segment to video memory (VGA Mode 13h)
    mov ax, 0A000h
    mov es, ax

    ; Point SI to Pacman's sprite data
    lea si, [Pacman]

    ; Draw the sprite 8x8 pixels
    mov cx, 8                 ; Sprite height
.draw_row:
    push cx
    mov cx, 8                 ; Sprite width
    rep movsb                 ; Copy sprite data to video memory
    pop cx
    add di, 320 - 8           ; Move to the next row
    loop .draw_row

    ret

;-------------------------------------------------------------------------------

checkKeyPress:
    mov ah, 0x11                  ; BIOS function to check keyboard status
    int 16h                       ; Call BIOS interrupt for keyboard
    mov [keyPressed], al          ; Store the pressed key

    ; Compare input and move Pacman
    cmp al, 122 ; Move up
    je move_up
    cmp al, 115 ; Move down
    je move_down
    cmp al, 113 ; Move left
    je move_left
    cmp al, 100 ; Move right
    je move_right
    ret

;===============================================================================

clearScreen:
    mov bx, 0xA000
    mov es, bx
    mov di, 0
    mov cx, 200*320
    rep stosb
    ret 

;===============================================================================    

quit:                       ; If escape key is pressed, jump to label 'exit'
    mov ah, 4ch                 ; DOS function to exit program
    int 21h                     ; Call DOS interrupt
