org 100h
%define SPRITEW 8
	
[bits 16]           ; Use 16-bit code
[org 0x100]         ; Origin point for the program

%define SCREEN_WIDTH 320
%define SCREEN_HEIGHT 200

%define SPRITEW 8
%define SPRITEH 8

%define MAZERLIMIT 40
%define MAZEBLIMIT 25	

%define BLINKY 10
%define INKY 6
%define CLYDE 7
%define PINKY 8

; ---------------------------------------------------------------------------
section .data
    
; ---------------------------------------------------------------------------

Walls:
    db 0x00, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x00
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x00, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x00

Dots:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x59, 0x59, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x59, 0x59, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

Gates:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x56, 0x56, 0x56, 0x56, 0x56, 0x56, 0x00
    db 0x56, 0x56, 0x56, 0x56, 0x56, 0x56, 0x56, 0x56
    db 0x56, 0x56, 0x56, 0x56, 0x56, 0x56, 0x56, 0x56
    db 0x00, 0x56, 0x56, 0x56, 0x56, 0x56, 0x56, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

PowerPellet:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x59, 0x59, 0x59, 0x59, 0x00, 0x00
    db 0x00, 0x59, 0x59, 0x59, 0x59, 0x59, 0x59, 0x00
    db 0x00, 0x59, 0x59, 0x59, 0x59, 0x59, 0x59, 0x00
    db 0x00, 0x59, 0x59, 0x59, 0x59, 0x59, 0x59, 0x00
    db 0x00, 0x59, 0x59, 0x59, 0x59, 0x59, 0x59, 0x00
    db 0x00, 0x00, 0x59, 0x59, 0x59, 0x59, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00


; ---------------------------------------------------------------------------
; initialize data for Blinky

yVelocityBlinky dw 320            ; to go from one line to another
xVelocityBlinky dw 1              ; horizontal speed
directionBl db 'R'            ; Current direction (R, L, U, D)

currentBlinkySprite dd blinky_right_1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; initialize data for Inky

yVelocityInky dw 320            ; to go from one line to another
xVelocityInky dw 1              ; horizontal speed
directionIn db 'R'            ; Current direction (R, L, U, D)

currentInkySprite dd inky_right_1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; Initialize data for Clyde
yVelocityClyde dw 320            ; to go from one line to another
xVelocityClyde dw 1              ; horizontal speed
directionCl db 'R'            ; Current direction (R, L, U, D)

currentClydeSprite dd clyde_right_1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; Initialize data for Pinky
yVelocityPinky dw 320            ; to go from one line to another   
xVelocityPinky dw 1              ; horizontal speed
directionPi db 'R'            ; Current direction (R, L, U, D)

currentPinkySprite dd pinky_right_1 ; the current sprite to be displayed
             ; the starting x coordinate of the sprite
; ---------------------------------------------------------------------------


; ---------------------------------------------------------------------------
; blinky sprites
blinky_right_1 db 0xFF, 0xFF, 0x28, 0x28, 0x28, 0x28, 0xFF, 0xFF
               db 0xFF, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0xFF
               db 0x28, 0x28, 0x0f, 0x00, 0x28, 0x0f, 0x00, 0x28
               db 0x28, 0x28, 0x0f, 0x0f, 0x28, 0x0f, 0x0f, 0x28
               db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
               db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
               db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
               db 0x28, 0xFF, 0x28, 0x28, 0xFF, 0x28, 0x28, 0x28

blinky_left_1  db 0xFF, 0xFF, 0x28, 0x28, 0x28, 0x28, 0xFF, 0xFF
               db 0xFF, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0xFF
               db 0x28, 0x00, 0x0f, 0x28, 0x00, 0x0f, 0x28, 0x28
               db 0x28, 0x0f, 0x0f, 0x28, 0x0f, 0x0f, 0x28, 0x28
               db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
               db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
               db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
               db 0x28, 0x28, 0x28, 0xFF, 0x28, 0x28, 0xFF, 0x28


blinky_down_1 db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0xFF, 0xFF
              db 0xFF, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0xFF
              db 0x28, 0x28, 0x28, 0x28, 0x0f, 0x0f, 0x28, 0x28
              db 0x28, 0x28, 0x28, 0x28, 0x0f, 0x0f, 0x28, 0x28
              db 0xFF, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
              db 0x28, 0x28, 0x28, 0x28, 0x0f, 0x0f, 0x28, 0x28
              db 0x28, 0x28, 0x28, 0x28, 0x0f, 0x00, 0x28, 0xFF
              db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0xFF, 0xFF


blinky_up_1   db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0xFF, 0xFF
              db 0x28, 0x28, 0x28, 0x28, 0x0f, 0x00, 0x28, 0xFF
              db 0x28, 0x28, 0x28, 0x28, 0x0f, 0x0f, 0x28, 0x28
              db 0xFF, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28
              db 0x28, 0x28, 0x28, 0x28, 0x0f, 0x0f, 0x28, 0x28
              db 0x28, 0x28, 0x28, 0x28, 0x0f, 0x0f, 0x28, 0x28
              db 0xFF, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0xFF
              db 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0xFF, 0xFF
; ---------------------------------------------------------------------------
; inky sprites
inky_right_1 db 0xFF, 0xFF, 0x34, 0x34, 0x34, 0x34, 0xFF, 0xFF
             db 0xFF, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0xFF
             db 0x34, 0x34, 0x0f, 0x00, 0x34, 0x0f, 0x00, 0x34
             db 0x34, 0x34, 0x0f, 0x0f, 0x34, 0x0f, 0x0f, 0x34
             db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34
             db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34
             db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34
             db 0x34, 0xFF, 0x34, 0x34, 0xFF, 0x34, 0x34, 0x34

inky_left_1  db 0xFF, 0xFF, 0x34, 0x34, 0x34, 0x34, 0xFF, 0xFF
             db 0xFF, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0xFF
             db 0x34, 0x00, 0x0f, 0x34, 0x00, 0x0f, 0x34, 0x34
             db 0x34, 0x0f, 0x0f, 0x34, 0x0f, 0x0f, 0x34, 0x34
             db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34
             db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34
             db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34
             db 0x34, 0x34, 0x34, 0xFF, 0x34, 0x34, 0xFF, 0x34


inky_down_1 db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0xFF, 0xFF
            db 0xFF, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0xFF
            db 0x34, 0x34, 0x34, 0x34, 0x0f, 0x0f, 0x34, 0x34
            db 0x34, 0x34, 0x34, 0x34, 0x0f, 0x00, 0x34, 0x34
            db 0xFF, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34
            db 0x34, 0x34, 0x34, 0x34, 0x0f, 0x0f, 0x34, 0x34
            db 0x34, 0x34, 0x34, 0x34, 0x0f, 0x00, 0x34, 0xFF
            db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0xFF, 0xFF


inky_up_1   db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0xFF, 0xFF
            db 0x34, 0x34, 0x34, 0x34, 0x0f, 0x00, 0x34, 0xFF
            db 0x34, 0x34, 0x34, 0x34, 0x0f, 0x0f, 0x34, 0x34
            db 0xFF, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34
            db 0x34, 0x34, 0x34, 0x34, 0x0f, 0x0f, 0x34, 0x34
            db 0x34, 0x34, 0x34, 0x34, 0x0f, 0x00, 0x34, 0x34
            db 0xFF, 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0xFF
            db 0x34, 0x34, 0x34, 0x34, 0x34, 0x34, 0xFF, 0xFF

; ---------------------------------------------------------------------------
; Pinky sprites

pinky_right_1 db 0xFF, 0xFF, 0x54, 0x54, 0x54, 0x54, 0xFF, 0xFF
             db 0xFF, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0xFF
             db 0x54, 0x54, 0x0f, 0x00, 0x54, 0x0f, 0x00, 0x54
             db 0x54, 0x54, 0x0f, 0x0f, 0x54, 0x0f, 0x0f, 0x54
             db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54
             db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54
             db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54
             db 0x54, 0xFF, 0x54, 0x54, 0xFF, 0x54, 0x54, 0x54

pinky_left_1 db 0xFF, 0xFF, 0x54, 0x54, 0x54, 0x54, 0xFF, 0xFF
             db 0xFF, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0xFF
             db 0x54, 0x00, 0x0f, 0x54, 0x00, 0x0f, 0x54, 0x54
             db 0x54, 0x0f, 0x0f, 0x54, 0x0f, 0x0f, 0x54, 0x54
             db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54
             db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54
             db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54
             db 0x54, 0x54, 0x54, 0xFF, 0x54, 0x54, 0xFF, 0x54


pinky_down_1 db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0xFF, 0xFF
            db 0xFF, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0xFF
            db 0x54, 0x54, 0x54, 0x54, 0x0f, 0x00, 0x54, 0x54
            db 0x54, 0x54, 0x54, 0x54, 0x0f, 0x0f, 0x54, 0x54
            db 0xFF, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54
            db 0x54, 0x54, 0x54, 0x54, 0x0f, 0x0f, 0x54, 0x54
            db 0x54, 0x54, 0x54, 0x54, 0x0f, 0x00, 0x54, 0xFF
            db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0xFF, 0xFF


pinky_up_1  db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0xFF, 0xFF
            db 0x54, 0x54, 0x54, 0x54, 0x0f, 0x00, 0x54, 0xFF
            db 0x54, 0x54, 0x54, 0x54, 0x0f, 0x0f, 0x54, 0x54
            db 0xFF, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54
            db 0x54, 0x54, 0x54, 0x54, 0x0f, 0x0f, 0x54, 0x54
            db 0x54, 0x54, 0x54, 0x54, 0x0f, 0x00, 0x54, 0x54
            db 0xFF, 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0xFF
            db 0x54, 0x54, 0x54, 0x54, 0x54, 0x54, 0xFF, 0xFF
; ---------------------------------------------------------------------------

; Clyde sprites

clyde_right_1 db 0xFF, 0xFF, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF
              db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF
              db 0x42, 0x42, 0x0f, 0x00, 0x42, 0x0f, 0x00, 0x42
              db 0x42, 0x42, 0x0f, 0x0f, 0x42, 0x0f, 0x0f, 0x42
              db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
              db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
              db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
              db 0x42, 0xFF, 0x42, 0x42, 0xFF, 0x42, 0x42, 0x42

clyde_left_1 db 0xFF, 0xFF, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF
             db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF
             db 0x42, 0x00, 0x0f, 0x42, 0x00, 0x0f, 0x42, 0x42
             db 0x42, 0x0f, 0x0f, 0x42, 0x0f, 0x0f, 0x42, 0x42
             db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
             db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
             db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
             db 0x42, 0x42, 0x42, 0xFF, 0x42, 0x42, 0xFF, 0x42


clyde_down_1 db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF
            db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x00, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x0f, 0x42, 0x42
            db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x0f, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x00, 0x42, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF


clyde_up_1  db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x00, 0x42, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x0f, 0x42, 0x42
            db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x0f, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x00, 0x42, 0x42
            db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF
			
; ---------------------------------------------------------------------------
Empty_sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

; ---------------------------------------------------------------------------


xPos dw 0
xVelocity dw 1
yPos dw 80

old_XPOS dw 0

old_YPOS dw 0

currentSprite dw 0

actualKeystroke dw 0
; ---------------------------------------------------------------------------

; ASCII representation of the maze
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
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 10, 0, 0, 1, 2, 1, 1, 1, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0, 1, 1, 4, 4, 4, 1, 1, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0, 1, 0, 6, 7, 8, 0, 1, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 1, 2, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 1, 1, 1, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 3, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 3, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 
    db 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9 

    Column dw 40
    Row dw 25
    PixelPerTileRow dw 2560

; ---------------------------------------------------------------------------
section .bss
yPosBlinky resw 1
xPosBlinky resw 1

yPosInky resw 1
xPosInky resw 1
 
yPosClyde resw 1
xPosClyde resw 1 

yPosPinky resw 1
xPosPinky resw 1 
 
section .text
 
    mov ah, 00h
    mov al, 13h
    int 10h
    call clearScreen
    call Maze
	
    gameloop:
    mov al, 0FFh

    ; display blinky
	call find_Blinky_spawn
	mov ax, [yPosBlinky]
	mov bx, [xPosBlinky]
	call draw_Blinky_at_position

    ; display inky
	call find_Inky_spawn
    mov ax, [yPosInky]
    mov bx, [xPosInky]
	call draw_Inky_at_position
    ;call draw_ghost12
        
    ; display clyde
	call find_Clyde_spawn
	mov ax, [yPosClyde]
	mov bx, [xPosClyde]
    call draw_Clyde_at_position

    ; display pinky
	call find_Pinky_spawn
	mov ax, [yPosPinky]
	mov bx, [xPosPinky]
    call draw_Pinky_at_position
	
	;waitting...
    mov cx, 0xFFFF
    waitloop1:
    loop waitloop1
    mov cx, 0x0001
    waitloop2:
    loop waitloop2
    mov cx, 0x0001
    waitloop3:
    loop waitloop3
    mov cx, 0x0001
    waitloop4:
    loop waitloop4
    
	
;--------------------------------
	;change the position
    ; Change position
	
	mov bx, [xPosBlinky]
	add bx, [xVelocityBlinky]
	mov [xPosBlinky], bx
	cmp word [xPosBlinky],320 - SPRITEW
	jbe .noflip_blinky
    neg word [xVelocityBlinky]
	jmp .noflip_blinky

.noflip_blinky:
	
	mov bx, [xPosInky]
    add bx, [yVelocityInky]
    mov [xPosInky], bx
	cmp word [yPosInky],200 + SPRITEH
	jbe .noflip_inky
	neg word [yVelocityInky]
	.noflip_inky:
	
	mov bx, [xPosClyde]
    sub bx, [yVelocityClyde]
    mov [xPosClyde], bx
	cmp word [yPosClyde],SPRITEH - 200
	jbe .noflip_clyde
    sub bx, [yVelocityClyde]
	.noflip_clyde:

	
	mov bx, [xPosPinky]
    add bx, [xVelocityPinky]
    mov [xPosPinky], bx
	cmp word [xPosPinky],320 - SPRITEW
	jbe .noflip_pinky
    neg word [xVelocityPinky]
	jmp .noflip_pinky
	
	;change direction

	.noflip_pinky:
		jmp gameloop
		
	

    ; this loop is to slow down the animation
    mov cx, 50000
    waitloop:
        loop waitloop

    ; update the positions of the sprites
; ---------------------------------------------------------------------------

find_Blinky_spawn:
    mov bx, 0                ; Start index for scanning the maze array
    mov cx, MAZERLIMIT       ; Total number of tiles in a row
    mov dx, MAZEBLIMIT       ; Total number of rows in the maze
	jmp .find_spawn_loop_Blinky

.find_spawn_loop_Blinky:
    ; Check if current tile is the spawn point (ASCII value 5)
    cmp byte [ASCII_Maze + bx], BLINKY
    je .found_spawn_Blinky
    ; Move to the next tile
    inc bx
    ; Check if we reached the end of a row
    dec cx
    jnz .find_spawn_loop_Blinky
    ; Move to the next row
    mov cx, MAZERLIMIT
    dec dx
    jnz .find_spawn_loop_Blinky
    ; If spawn point not found, you can handle it here
    ; For now, just hang (or add error handling)
    jmp $

.found_spawn_Blinky:
    xor dx, dx            ; Clear dx for division
    mov ax, bx            ; Copy index to ax for division
    mov cx, MAZERLIMIT    ; Move MAZERLIMIT to the CX register
    div cx                ; ax = bx / cx, dx = bx MOD cx
    ; ax now contains the Y coordinate in tiles
    ; dx now contains the X coordinate in tiles
    shl ax, 3             ; Multiply by 8 to convert tile coordinates to pixels
    shl dx, 3             ; Multiply by 8 to convert tile coordinates to pixels
    mov [yPosBlinky], ax     ; Store Y pixel position
    mov [xPosBlinky], dx     ; Store X pixel position
    ret
	
	
	
	
find_Inky_spawn:
    mov bx, 0                ; Start index for scanning the maze array
    mov cx, MAZERLIMIT       ; Total number of tiles in a row
    mov dx, MAZEBLIMIT       ; Total number of rows in the maze
	jmp .find_spawn_loop_Inky

.find_spawn_loop_Inky:
    ; Check if current tile is the spawn point (ASCII value 7 for Inky)
    cmp byte [ASCII_Maze + bx], INKY
    je .found_spawn_Inky
    ; Move to the next tile
    inc bx
    ; Check if we reached the end of a row
    dec cx
    jnz .find_spawn_loop_Inky
    ; Move to the next row
    mov cx, MAZERLIMIT
    dec dx
    jnz .find_spawn_loop_Inky
    ; If spawn point not found, you can handle it here
    ; For now, just hang (or add error handling)
    jmp $

.found_spawn_Inky:
    xor dx, dx            ; Clear dx for division
    mov ax, bx            ; Copy index to ax for division
    mov cx, MAZERLIMIT    ; Move MAZERLIMIT to the CX register
    div cx                ; ax = bx / cx, dx = bx MOD cx
    ; ax now contains the Y coordinate in tiles
    ; dx now contains the X coordinate in tiles
    shl ax, 3             ; Multiply by 8 to convert tile coordinates to pixels
    shl dx, 3             ; Multiply by 8 to convert tile coordinates to pixels
    mov [yPosInky], ax     ; Store Y pixel position
    mov [xPosInky], dx     ; Store X pixel position
    ret

	
	
	
	

find_Clyde_spawn:
    mov bx, 0                ; Start index for scanning the maze array
    mov cx, MAZERLIMIT       ; Total number of tiles in a row
    mov dx, MAZEBLIMIT       ; Total number of rows in the maze
	jmp .find_spawn_loop_Clyde

.find_spawn_loop_Clyde:
    ; Check if current tile is the spawn point (ASCII value 8 for Clyde)
    cmp byte [ASCII_Maze + bx], CLYDE
    je .found_spawn_Clyde
    ; Move to the next tile
    inc bx
    ; Check if we reached the end of a row
    dec cx
    jnz .find_spawn_loop_Clyde
    ; Move to the next row
    mov cx, MAZERLIMIT
    dec dx
    jnz .find_spawn_loop_Clyde
    ; If spawn point not found, you can handle it here
    ; For now, just hang (or add error handling)
    jmp $

.found_spawn_Clyde:
    xor dx, dx            ; Clear dx for division
    mov ax, bx            ; Copy index to ax for division
    mov cx, MAZERLIMIT    ; Move MAZERLIMIT to the CX register
    div cx                ; ax = bx / cx, dx = bx MOD cx
    ; ax now contains the Y coordinate in tiles
    ; dx now contains the X coordinate in tiles
    shl ax, 3             ; Multiply by 8 to convert tile coordinates to pixels
    shl dx, 3             ; Multiply by 8 to convert tile coordinates to pixels
    mov [yPosClyde], ax     ; Store Y pixel position
    mov [xPosClyde], dx     ; Store X pixel position
    ret

	
	
	
	
find_Pinky_spawn:
    mov bx, 0                ; Start index for scanning the maze array
    mov cx, MAZERLIMIT       ; Total number of tiles in a row
    mov dx, MAZEBLIMIT       ; Total number of rows in the maze
	jmp .find_spawn_loop_Pinky

.find_spawn_loop_Pinky:
    ; Check if current tile is the spawn point (ASCII value 9 for Pinky)
    cmp byte [ASCII_Maze + bx], PINKY
    je .found_spawn_Pinky
    ; Move to the next tile
    inc bx
    ; Check if we reached the end of a row
    dec cx
    jnz .find_spawn_loop_Pinky
    ; Move to the next row
    mov cx, MAZERLIMIT
    dec dx
    jnz .find_spawn_loop_Pinky
    ; If spawn point not found, you can handle it here
    ; For now, just hang (or add error handling)
    jmp $

.found_spawn_Pinky:
    xor dx, dx            ; Clear dx for division
    mov ax, bx            ; Copy index to ax for division
    mov cx, MAZERLIMIT    ; Move MAZERLIMIT to the CX register
    div cx                ; ax = bx / cx, dx = bx MOD cx
    ; ax now contains the Y coordinate in tiles
    ; dx now contains the X coordinate in tiles
    shl ax, 3             ; Multiply by 8 to convert tile coordinates to pixels
    shl dx, 3             ; Multiply by 8 to convert tile coordinates to pixels
    mov [yPosPinky], ax     ; Store Y pixel position
    mov [xPosPinky], dx     ; Store X pixel position
    ret

	
	
; ---------------------------------------------------------------------------


; ---------------------------------------------------------------------------
;the_functions:

draw_Blinky_at_position:
    ; Assuming ax = Y position, bx = X position

    ; Calculate the starting address in video memory
    mov di, ax                ; DI = Y position
    imul di, 320              ; Convert Y position to row index in video memory
    add di, bx                ; Add X position to get the exact memory location

    ; Set segment to video memory (VGA Mode 13h)
    mov ax, 0A000h
    mov es, ax

    ; Point SI to Pacman's sprite data
    lea si, [blinky_left_1]

    ; Draw the sprite 8x8 pixels
    mov cx, 8                 ; Sprite height
.draw_row_Blinky:
    push cx
    mov cx, 8                 ; Sprite width
    rep movsb                 ; Copy sprite data to video memory
    pop cx
    add di, 320 - 8           ; Move to the next row
    loop .draw_row_Blinky

    ret


	
draw_Clyde_at_position:
    ; Assuming ax = Y position, bx = X position

    ; Calculate the starting address in video memory
    mov di, ax                ; DI = Y position
    imul di, 320              ; Convert Y position to row index in video memory
    add di, bx                ; Add X position to get the exact memory location

    ; Set segment to video memory (VGA Mode 13h)
    mov ax, 0A000h
    mov es, ax

    ; Point SI to Pacman's sprite data
    lea si, [clyde_left_1]

    ; Draw the sprite 8x8 pixels
    mov cx, 8                 ; Sprite height
.draw_row_Clyde:
    push cx
    mov cx, 8                 ; Sprite width
    rep movsb                 ; Copy sprite data to video memory
    pop cx
    add di, 320 - 8           ; Move to the next row
    loop .draw_row_Clyde

    ret
	
	
	
	draw_Inky_at_position:
    ; Assuming ax = Y position, bx = X position

    ; Calculate the starting address in video memory
    mov di, ax                ; DI = Y position
    imul di, 320              ; Convert Y position to row index in video memory
    add di, bx                ; Add X position to get the exact memory location

    ; Set segment to video memory (VGA Mode 13h)
    mov ax, 0A000h
    mov es, ax

    ; Point SI to Pacman's sprite data
    lea si, [inky_left_1]

    ; Draw the sprite 8x8 pixels
    mov cx, 8                 ; Sprite height
.draw_row_Inky:
    push cx
    mov cx, 8                 ; Sprite width
    rep movsb                 ; Copy sprite data to video memory
    pop cx
    add di, 320 - 8           ; Move to the next row
    loop .draw_row_Inky

    ret


	
	draw_Pinky_at_position:
    ; Assuming ax = Y position, bx = X position

    ; Calculate the starting address in video memory
    mov di, ax                ; DI = Y position
    imul di, 320              ; Convert Y position to row index in video memory
    add di, bx                ; Add X position to get the exact memory location

    ; Set segment to video memory (VGA Mode 13h)
    mov ax, 0A000h
    mov es, ax

    ; Point SI to Pacman's sprite data
    lea si, [pinky_left_1]

    ; Draw the sprite 8x8 pixels
    mov cx, 8                 ; Sprite height
.draw_row_Pinky:
    push cx
    mov cx, 8                 ; Sprite width
    rep movsb                 ; Copy sprite data to video memory
    pop cx
    add di, 320 - 8           ; Move to the next row
    loop .draw_row_Pinky

    ret
	
; ---------------------------------------------------------------------------
drawWalls:
        mov dx, 8
        .eachLine:  
            mov cx, 8
            rep movsb
            add di, 320-8
            dec dx
            jnz .eachLine
            call nextColumn
        inc bx
        ret
    nextColumn:
        mov ax, [Column]
        dec ax
        mov [Column], ax
        cmp ax, 0
        je nextRow
        sub di, 2552
        ret

    nextRow:
        mov ax, [Row]
        dec ax
        mov [Row], ax
        cmp ax, 0
        je gameloop
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
        wallchoice:
            mov al, [bx]
            cmp al,  0   			
            je drawEmpty        
            cmp al, 1
            je drawWall
            cmp al, 2
            je DrawDot
            cmp al, 3
            je DrawPowerPellet
            cmp al, 4
            je DrawGates
			cmp al, 9
			je drawEmpty
			
			; Iterates over the ASCII_Maze and sets the spawn point based on the value 5
		
;---------------------------------------------------------------------


          ; ===================================

          drawEmpty:
               mov si, Empty_sprite
               call drawWalls
               jmp wallchoice
          drawWall:
               mov si, Walls
               call drawWalls
               jmp wallchoice   
          DrawDot:
               mov si, Dots
               call drawWalls
               jmp wallchoice
          DrawGates:
             mov si, Gates
             call drawWalls
             jmp wallchoice
          DrawPowerPellet:
                mov si, PowerPellet
                call drawWalls
                jmp wallchoice
		  		  
;----------------------------------------------------------------------

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



