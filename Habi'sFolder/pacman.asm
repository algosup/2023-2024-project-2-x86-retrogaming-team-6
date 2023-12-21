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

directionBl db 'R'            ; Current direction (R, L, U, D)
old_XPOS_blinky dw 0
old_YPOS_blinky dw 0
direction dw 0

currentBlinkySprite dd blinky_right_1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; initialize data for Inky

directionIn db 'R'            ; Current direction (R, L, U, D)
old_XPOS_Inky dw 0
old_YPOS_Inky dw 0
currentInkySprite dd inky_right_1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; Initialize data for Clyde

directionCl db 'R'            ; Current direction (R, L, U, D)
old_XPOS_Clyde dw 0
old_YPOS_Clyde dw 0
currentClydeSprite dd clyde_right_1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; Initialize data for Pinky

directionPi db 'R'            ; Current direction (R, L, U, D)
old_XPOS_Pinky dw 0
old_YPOS_Pinky dw 0
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
yVelocityBlinky resw 320            ; to go from one line to another
xVelocityBlinky resw 1              ; horizontal speed

yPosInky resw 1
xPosInky resw 1
yVelocityInky resw 320
xVelocityInky resw 1
 
yPosClyde resw 1
xPosClyde resw 1 
yVelocityClyde resw 320            ; to go from one line to another
xVelocityClyde resw 1              ; horizontal speed

yPosPinky resw 1
xPosPinky resw 1
yVelocityPinky resw 320            ; to go from one line to another   
xVelocityPinky resw 1              ; horizontal speed 

counter resd 1

 
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


;mouv:
;call mouv_Blinky
;call mouv_Inky
;call mouv_Clyde
;call mouv_Pinky



mouv_Blinky:
call move_left
call move_right_haut
call rep_Blinky
rep_Blinky:
call move_up
call move_left
call move_up
call move_left
call move_down
call move_right
jmp mouv_Inky


move_right:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Pacman's next pixel position
        mov ax, [yPosBlinky]             ; Get current Y position
        mov bx, [xPosBlinky]             ; Get current X position
        add bx, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		cmp byte [si], 9           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		
		mov bx, [xPosBlinky]
		add bx, 1
		mov [xPosBlinky], bx
        ; Update Pacman's position
        mov [xPosBlinky], bx             ; Update X position
		
		mov ax, [old_YPOS_blinky]
        mov bx, [old_XPOS_blinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPac in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosBlinky]    ; Move yPosPac to ax
        mov [old_YPOS_blinky], ax   ; Move ax to old_YPOS

        ; Store xPosPac in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosBlinky]    ; Move xPosPac to bx
        mov [old_XPOS_blinky], bx   ; Move bx to old_XPOS

        ; Draw Pacman's new sprite at the new position
        mov ax, [yPosBlinky]              ; Get current Y position
        mov bx, [xPosBlinky]              ; Get current X position
        call draw_Blinky_at_position   ; Call subroutine to draw Pacman at new position
		
		 .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

        ; Continue the loop for moving right
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]

	ret
	
move_right_haut:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Pacman's next pixel position
        mov ax, [yPosBlinky]             ; Get current Y position
        mov bx, [xPosBlinky]             ; Get current X position
        add bx, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		cmp byte [si], 9           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		
		mov bx, [xPosBlinky]
		add bx, 1
		mov [xPosBlinky], bx
        ; Update Pacman's position
        mov [xPosBlinky], bx             ; Update X position
		
		mov ax, [old_YPOS_blinky]
        mov bx, [old_XPOS_blinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPac in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosBlinky]    ; Move yPosPac to ax
        mov [old_YPOS_blinky], ax   ; Move ax to old_YPOS

        ; Store xPosPac in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosBlinky]    ; Move xPosPac to bx
        mov [old_XPOS_blinky], bx   ; Move bx to old_XPOS

        ; Draw Pacman's new sprite at the new position
        mov ax, [yPosBlinky]              ; Get current Y position
        mov bx, [xPosBlinky]              ; Get current X position
        call draw_Blinky_at_position   ; Call subroutine to draw Pacman at new position
		call move_up
		
		 .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

        ; Continue the loop for moving right
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]

	ret	

	
move_down:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Pacman's next pixel position
        mov ax, [yPosBlinky]             ; Get current Y position
		mov bx, [xPosBlinky]             ; Get current X position
        add ax, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        mov dx, bx           ; Get current X position
        shr dx, 3                     ; Convert X pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov ax, [yPosBlinky]
		add ax, 1
		mov [yPosBlinky], ax
		mov [yPosBlinky], ax             ; Update Y position	
		
		mov ax, [old_YPOS_blinky]
        mov bx, [old_XPOS_blinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPac in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosBlinky]    ; Move yPosPac to ax
        mov [old_YPOS_blinky], ax   ; Move ax to old_YPOS

        ; Store xPosPac in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosBlinky]    ; Move xPosPac to bx
        mov [old_XPOS_blinky], bx   ; Move bx to old_XPOS
		

        ; Draw Pacman's new sprite at the new position
        mov ax, [yPosBlinky]              ; Get current Y position
        mov bx, [xPosBlinky]              ; Get current X position
        call draw_Blinky_at_position   ; Call subroutine to draw Pacman at new position
		
		 .delayLoop:
        nop              ; No-operation; does nothing but consumes time*
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

        ; Continue the loop for moving right
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]
        
	ret
		
		
move_up:
    ; Begin a loop for continuous movement
    .moveLoop:

        ; Calculate Blinky's next pixel position
        mov ax, [yPosBlinky]             ; Get current Y position
		mov bx, [xPosBlinky]             ; Get current X position
        sub ax, 1                     ; Decrement Y position by 1 pixel

        ; Convert this pixel position to maze index
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        mov dx, bx           ; Get current X position
        shr dx, 3                     ; Convert X pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		
		mov ax, [yPosBlinky]
		sub ax, 1
		mov [yPosBlinky], ax
		mov [yPosBlinky], ax             ; Update Y position
		
		mov ax, [old_YPOS_blinky]
        mov bx, [old_XPOS_blinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position


        ; Store yPosBlinky in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosBlinky]    ; Move yPosBlinky to ax
        mov [old_YPOS_blinky], ax   ; Move ax to old_YPOS

        ; Store xPosBlinky in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosBlinky]    ; Move xPosBlinky to bx
        mov [old_XPOS_blinky], bx   ; Move bx to old_XPOS

        ; Draw Blinky's new sprite at the new position
        mov ax, [yPosBlinky]              ; Get current Y position
        mov bx, [xPosBlinky]              ; Get current X position
        call draw_Blinky_at_position   ; Call subroutine to draw Blinky at new position

        .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]
		
			jmp .moveLoop    ; Continue the loop for moving up
    .stopMovement:
        ; Collision detected, stop moving and reset direction
        neg word [direction]
		
	ret

move_left:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Pacman's next pixel position
        mov ax, [yPosBlinky]             ; Get current Y position
        mov bx, [xPosBlinky]             ; Get current X position
        sub bx, 1                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov bx, [xPosBlinky]
		sub bx, 1
		mov [xPosBlinky], bx
        ; Update Pacman's position
        mov [xPosBlinky], bx             ; Update X position

		mov ax, [old_YPOS_blinky]
        mov bx, [old_XPOS_blinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPac in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosBlinky]    ; Move yPosPac to ax
        mov [old_YPOS_blinky], ax   ; Move ax to old_YPOS

        ; Store xPosPac in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosBlinky]    ; Move xPosPac to bx
        mov [old_XPOS_blinky], bx   ; Move bx to old_XPOS

        ; Draw Pacman's new sprite at the new position
        mov ax, [yPosBlinky]              ; Get current Y position
        mov bx, [xPosBlinky]              ; Get current X position
        call draw_Blinky_at_position   ; Call subroutine to draw Pacman at new position

		
		 .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

        ; Continue the loop for moving right
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]

	ret
		
		

		
;---------------------------------------

mouv_Inky:
call move_up_Inky
call move_left_Inky
call move_right_down_Inky
call rep_Inky
rep_Inky:
call move_left_Inky
call move_up_Inky
call move_right_Inky
call move_down_Inky
call move_right_Inky
call move_up_Inky
call move_left_Inky
call move_down_Inky
call move_left_Inky
call move_down_Inky
jmp mouv_Clyde


move_up_Inky:
    ; Begin a loop for continuous movement
    .moveLoop:

        ; Calculate Blinky's next pixel position
        mov ax, [yPosInky]             ; Get current Y position
		mov bx, [xPosInky]             ; Get current X position
        sub ax, 1                     ; Decrement Y position by 1 pixel

        ; Convert this pixel position to maze index
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        mov dx, bx           ; Get current X position
        shr dx, 3                     ; Convert X pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		
		mov ax, [yPosInky]
		sub ax, 1
		mov [yPosInky], ax
		mov [yPosInky], ax             ; Update Y position
		
		mov ax, [old_YPOS_Inky]
        mov bx, [old_XPOS_Inky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position


        ; Store yPosBlinky in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosInky]    ; Move yPosBlinky to ax
        mov [old_YPOS_Inky], ax   ; Move ax to old_YPOS

        ; Store xPosBlinky in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosInky]    ; Move xPosBlinky to bx
        mov [old_XPOS_Inky], bx   ; Move bx to old_XPOS

        ; Draw Blinky's new sprite at the new position
        mov ax, [yPosInky]              ; Get current Y position
        mov bx, [xPosInky]              ; Get current X position
        call draw_Inky_at_position   ; Call subroutine to draw Blinky at new position

        .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]
		
			jmp .moveLoop    ; Continue the loop for moving up
    .stopMovement:
        ; Collision detected, stop moving and reset direction
        neg word [direction]
	ret
	
	move_left_Inky:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Pacman's next pixel position
        mov ax, [yPosInky]             ; Get current Y position
        mov bx, [xPosInky]             ; Get current X position
        sub bx, 1                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov bx, [xPosInky]
		sub bx, 1
		mov [xPosInky], bx
        ; Update Pacman's position
        mov [xPosInky], bx             ; Update X position

		mov ax, [old_YPOS_Inky]
        mov bx, [old_XPOS_Inky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPac in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosInky]    ; Move yPosPac to ax
        mov [old_YPOS_Inky], ax   ; Move ax to old_YPOS

        ; Store xPosPac in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosInky]    ; Move xPosPac to bx
        mov [old_XPOS_Inky], bx   ; Move bx to old_XPOS

        ; Draw Pacman's new sprite at the new position
        mov ax, [yPosInky]              ; Get current Y position
        mov bx, [xPosInky]              ; Get current X position
        call draw_Inky_at_position   ; Call subroutine to draw Pacman at new position
		
		 .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

        ; Continue the loop for moving right
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]

	ret
	
	move_down_Inky:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Pacman's next pixel position
        mov ax, [yPosInky]             ; Get current Y position
        mov bx, [xPosInky]             ; Get current X position
        add ax, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        mov dx, bx           ; Get current X position
        shr dx, 3                     ; Convert X pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
        mov ax, [yPosInky]
        add ax, 1
        mov [yPosInky], ax
        mov [yPosInky], ax             ; Update Y position	
		
        mov ax, [old_YPOS_Inky]
        mov bx, [old_XPOS_Inky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPac in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosInky]    ; Move yPosPac to ax
        mov [old_YPOS_Inky], ax   ; Move ax to old_YPOS

        ; Store xPosPac in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosInky]    ; Move xPosPac to bx
        mov [old_XPOS_Inky], bx   ; Move bx to old_XPOS
		

        ; Draw Pacman's new sprite at the new position
        mov ax, [yPosInky]              ; Get current Y position
        mov bx, [xPosInky]              ; Get current X position
        call draw_Inky_at_position   ; Call subroutine to draw Pacman at new position
		
        .delayLoop:
        nop              ; No-operation; does nothing but consumes time*
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

        ; Continue the loop for moving right
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
        neg word [direction]
        
    ret

move_right_down_Inky:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Pacman's next pixel position
        mov ax, [yPosInky]             ; Get current Y position
        mov bx, [xPosInky]             ; Get current X position
        add bx, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		cmp byte [si], 9           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov bx, [xPosInky]
		add bx, 1
		mov [xPosInky], bx
        ; Update Inky's position
        mov [xPosInky], bx             ; Update X position
		
		mov ax, [old_YPOS_Inky]
        mov bx, [old_XPOS_Inky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosInky in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosInky]    ; Move yPosInky to ax
        mov [old_YPOS_Inky], ax   ; Move ax to old_YPOS

        ; Store xPosInky in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosInky]    ; Move xPosInky to bx
        mov [old_XPOS_Inky], bx   ; Move bx to old_XPOS

        ; Draw Inky's new sprite at the new position
        mov ax, [yPosInky]              ; Get current Y position
        mov bx, [xPosInky]              ; Get current X position
        call draw_Inky_at_position   ; Call subroutine to draw Inky at new position
		call move_down_Inky
		
        .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]

    ret
	
move_right_Inky:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Pacman's next pixel position
        mov ax, [yPosInky]             ; Get current Y position
        mov bx, [xPosInky]             ; Get current X position
        add bx, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		cmp byte [si], 9           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov bx, [xPosInky]
		add bx, 1
		mov [xPosInky], bx
        ; Update Inky's position
        mov [xPosInky], bx             ; Update X position
		
		mov ax, [old_YPOS_Inky]
        mov bx, [old_XPOS_Inky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosInky in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosInky]    ; Move yPosInky to ax
        mov [old_YPOS_Inky], ax   ; Move ax to old_YPOS

        ; Store xPosInky in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosInky]    ; Move xPosInky to bx
        mov [old_XPOS_Inky], bx   ; Move bx to old_XPOS

        ; Draw Inky's new sprite at the new position
        mov ax, [yPosInky]              ; Get current Y position
        mov bx, [xPosInky]              ; Get current X position
        call draw_Inky_at_position   ; Call subroutine to draw Inky at new position
		
        .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]

    ret
;---------------------------------------
mouv_Clyde:
call move_up_Clyde
call move_right_Clyde
call move_down_Clyde
call move_left_Clyde
jmp mouv_Pinky



move_up_Clyde:
    ; Begin a loop for continuous movement
    .moveLoop:

        ; Calculate Clyde's next pixel position
        mov ax, [yPosClyde]             ; Get current Y position
		mov bx, [xPosClyde]             ; Get current X position
        sub ax, 1                     ; Decrement Y position by 1 pixel

        ; Convert this pixel position to maze index
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        mov dx, bx           ; Get current X position
        shr dx, 3                     ; Convert X pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		
		mov ax, [yPosClyde]
		sub ax, 1
		mov [yPosClyde], ax
		mov [yPosClyde], ax             ; Update Y position
		
		mov ax, [old_YPOS_Clyde]
        mov bx, [old_XPOS_Clyde]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position


        ; Store yPosClyde in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosClyde]    ; Move yPosClyde to ax
        mov [old_YPOS_Clyde], ax   ; Move ax to old_YPOS

        ; Store xPosClyde in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosClyde]    ; Move xPosClyde to bx
        mov [old_XPOS_Clyde], bx   ; Move bx to old_XPOS

        ; Draw Clyde's new sprite at the new position
        mov ax, [yPosClyde]              ; Get current Y position
        mov bx, [xPosClyde]              ; Get current X position
        call draw_Clyde_at_position   ; Call subroutine to draw Clyde at new position

        .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]
		
		jmp .moveLoop    ; Continue the loop for moving up
    .stopMovement:
        ; Collision detected, stop moving and reset direction
        neg word [direction]
	ret

move_left_Clyde:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Clyde's next pixel position
        mov ax, [yPosClyde]             ; Get current Y position
        mov bx, [xPosClyde]             ; Get current X position
        sub bx, 1                     ; Decrement X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov bx, [xPosClyde]
		sub bx, 1
		mov [xPosClyde], bx
        ; Update Clyde's position
        mov [xPosClyde], bx             ; Update X position

		mov ax, [old_YPOS_Clyde]
        mov bx, [old_XPOS_Clyde]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosClyde in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosClyde]    ; Move yPosClyde to ax
        mov [old_YPOS_Clyde], ax   ; Move ax to old_YPOS

        ; Store xPosClyde in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosClyde]    ; Move xPosClyde to bx
        mov [old_XPOS_Clyde], bx   ; Move bx to old_XPOS

        ; Draw Clyde's new sprite at the new position
        mov ax, [yPosClyde]              ; Get current Y position
        mov bx, [xPosClyde]              ; Get current X position
        call draw_Clyde_at_position   ; Call subroutine to draw Clyde at new position

		
		 .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving left

        ; Continue the loop for moving left
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]

	ret
	

move_left_down_Clyde:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Clyde's next pixel position
        mov ax, [yPosClyde]             ; Get current Y position
        mov bx, [xPosClyde]             ; Get current X position
        sub bx, 1                     ; Decrement X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov bx, [xPosClyde]
		sub bx, 1
		mov [xPosClyde], bx
        ; Update Clyde's position
        mov [xPosClyde], bx             ; Update X position

		mov ax, [old_YPOS_Clyde]
        mov bx, [old_XPOS_Clyde]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosClyde in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosClyde]    ; Move yPosClyde to ax
        mov [old_YPOS_Clyde], ax   ; Move ax to old_YPOS

        ; Store xPosClyde in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosClyde]    ; Move xPosClyde to bx
        mov [old_XPOS_Clyde], bx   ; Move bx to old_XPOS

        ; Draw Clyde's new sprite at the new position
        mov ax, [yPosClyde]              ; Get current Y position
        mov bx, [xPosClyde]              ; Get current X position
        call draw_Clyde_at_position   ; Call subroutine to draw Clyde at new position
		call move_down_Clyde

		
		 .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving left

        ; Continue the loop for moving left
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]

	ret
	

move_down_Clyde:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Clyde's next pixel position
        mov ax, [yPosClyde]             ; Get current Y position
		mov bx, [xPosClyde]             ; Get current X position
        add ax, 8                    ; Increment Y position by 1 pixel

        ; Convert this pixel position to maze index
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        mov dx, bx           ; Get current X position
        shr dx, 3                     ; Convert X pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov ax, [yPosClyde]
		add ax, 1
		mov [yPosClyde], ax             ; Update Y position	
		
		mov ax, [old_YPOS_Clyde]
        mov bx, [old_XPOS_Clyde]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosClyde in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosClyde]    ; Move yPosClyde to ax
        mov [old_YPOS_Clyde], ax   ; Move ax to old_YPOS

        ; Store xPosClyde in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosClyde]    ; Move xPosClyde to bx
        mov [old_XPOS_Clyde], bx   ; Move bx to old_XPOS
		

        ; Draw Clyde's new sprite at the new position
        mov ax, [yPosClyde]              ; Get current Y position
        mov bx, [xPosClyde]              ; Get current X position
        call draw_Clyde_at_position   ; Call subroutine to draw Clyde at new position
		
		 .delayLoop:
        nop              ; No-operation; does nothing but consumes time*
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving down

        ; Continue the loop for moving down
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]
        
	ret
	
	
move_right_Clyde:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Clyde's next pixel position
        mov ax, [yPosClyde]             ; Get current Y position
        mov bx, [xPosClyde]             ; Get current X position
        add bx, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		cmp byte [si], 9           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov bx, [xPosClyde]
		add bx, 1
		mov [xPosClyde], bx
        ; Update Clyde's position
        mov [xPosClyde], bx             ; Update X position
		
		mov ax, [old_YPOS_Clyde]
        mov bx, [old_XPOS_Clyde]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosClyde in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosClyde]    ; Move yPosClyde to ax
        mov [old_YPOS_Clyde], ax   ; Move ax to old_YPOS

        ; Store xPosClyde in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosClyde]    ; Move xPosClyde to bx
        mov [old_XPOS_Clyde], bx   ; Move bx to old_XPOS

        ; Draw Clyde's new sprite at the new position
        mov ax, [yPosClyde]              ; Get current Y position
        mov bx, [xPosClyde]              ; Get current X position
        call draw_Clyde_at_position   ; Call subroutine to draw Clyde at new position
		
		 .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

        ; Continue the loop for moving right
        jmp .moveLoop

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]
		jmp move_down

	ret


;--------------------------------------
mouv_Pinky:
    call move_up_Pinky
	call move_right_Pinky
	call move_up_Pinky
	call move_right_Pinky
	call move_down_Pinky
	call move_left_Pinky
	jmp mouv_Blinky
	


move_up_Pinky:
    ; Begin a loop for continuous movement
    .moveLoop:

        ; Calculate Pinky's next pixel position
        mov ax, [yPosPinky]             ; Get current Y position
        mov bx, [xPosPinky]             ; Get current X position
        sub ax, 1                     ; Decrement Y position by 1 pixel

        ; Convert this pixel position to maze index
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        mov dx, bx           ; Get current X position
        shr dx, 3                     ; Convert X pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall

        mov ax, [yPosPinky]
        sub ax, 1
        mov [yPosPinky], ax
        mov [yPosPinky], ax             ; Update Y position

        mov ax, [old_YPOS_Pinky]
        mov bx, [old_XPOS_Pinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPinky in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosPinky]    ; Move yPosPinky to ax
        mov [old_YPOS_Pinky], ax   ; Move ax to old_YPOS

        ; Store xPosPinky in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosPinky]    ; Move xPosPinky to bx
        mov [old_XPOS_Pinky], bx   ; Move bx to old_XPOS

        ; Draw Pinky's new sprite at the new position
        mov ax, [yPosPinky]              ; Get current Y position
        mov bx, [xPosPinky]              ; Get current X position
        call draw_Pinky_at_position   ; Call subroutine to draw Pinky at new position

        .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving up

    .stopMovement:
        ; Collision detected, stop moving and reset direction
        neg word [direction]
    ret

move_right_down_Pinky:
    ; Begin a loop for continuous movement
    .moveLoop:
	
        ; Calculate Pacman's next pixel position
        mov ax, [yPosPinky]             ; Get current Y position
        mov bx, [xPosPinky]             ; Get current X position
        add bx, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		cmp byte [si], 9           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
		
		mov bx, [xPosPinky]
		add bx, 1
		mov [xPosPinky], bx
        ; Update Inky's position
        mov [xPosPinky], bx             ; Update X position
		
		mov ax, [old_YPOS_Pinky]
        mov bx, [old_XPOS_Pinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosInky in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosPinky]    ; Move yPosInky to ax
        mov [old_YPOS_Pinky], ax   ; Move ax to old_YPOS

        ; Store xPosInky in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosPinky]    ; Move xPosInky to bx
        mov [old_XPOS_Pinky], bx   ; Move bx to old_XPOS

        ; Draw Inky's new sprite at the new position
        mov ax, [yPosPinky]              ; Get current Y position
        mov bx, [xPosPinky]              ; Get current X position
        call draw_Pinky_at_position   ; Call subroutine to draw Inky at new position
		call move_down_Pinky

		
        .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

    .stopMovement:
        ; Collision detected, stop moving and reset direction
		neg word [direction]
		call move_down_Pinky

    ret

	move_left_Pinky:
    ; Begin a loop for continuous movement
    .moveLoop:

        ; Calculate Pacman's next pixel position
        mov ax, [yPosPinky]             ; Get current Y position
        mov bx, [xPosPinky]             ; Get current X position
        sub bx, 1                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall

        mov bx, [xPosPinky]
        sub bx, 1
        mov [xPosPinky], bx
        ; Update Pinky's position
        mov [xPosPinky], bx             ; Update X position

        mov ax, [old_YPOS_Pinky]
        mov bx, [old_XPOS_Pinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPinky in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosPinky]    ; Move yPosPinky to ax
        mov [old_YPOS_Pinky], ax   ; Move ax to old_YPOS

        ; Store xPosPinky in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosPinky]    ; Move xPosPinky to bx
        mov [old_XPOS_Pinky], bx   ; Move bx to old_XPOS

        ; Draw Pinky's new sprite at the new position
        mov ax, [yPosPinky]              ; Get current Y position
        mov bx, [xPosPinky]              ; Get current X position
        call draw_Pinky_at_position   ; Call subroutine to draw Pinky at new position

        .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving left

    .stopMovement:
        ; Collision detected, stop moving and reset direction
        neg word [direction]
    ret
	
	

move_down_Pinky:
    ; Begin a loop for continuous movement
    .moveLoop:

        ; Calculate Pacman's next pixel position
        mov ax, [yPosPinky]             ; Get current Y position
        mov bx, [xPosPinky]             ; Get current X position
        add ax, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        mov dx, bx           ; Get current X position
        shr dx, 3                     ; Convert X pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall

        mov ax, [yPosPinky]
        add ax, 1
        mov [yPosPinky], ax
        mov [yPosPinky], ax             ; Update Y position

        mov ax, [old_YPOS_Pinky]
        mov bx, [old_XPOS_Pinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPinky in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosPinky]    ; Move yPosPinky to ax
        mov [old_YPOS_Pinky], ax   ; Move ax to old_YPOS

        ; Store xPosPinky in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosPinky]    ; Move xPosPinky to bx
        mov [old_XPOS_Pinky], bx   ; Move bx to old_XPOS

        ; Draw Pinky's new sprite at the new position
        mov ax, [yPosPinky]              ; Get current Y position
        mov bx, [xPosPinky]              ; Get current X position
        call draw_Pinky_at_position   ; Call subroutine to draw Pinky at new position

        .delayLoop:
        nop              ; No-operation; does nothing but consumes time*
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving down

    .stopMovement:
        ; Collision detected, stop moving and reset direction
        neg word [direction]
    ret


	
move_right_Pinky:
    ; Begin a loop for continuous movement
    .moveLoop:

        ; Calculate Pacman's next pixel position
        mov ax, [yPosPinky]             ; Get current Y position
        mov bx, [xPosPinky]             ; Get current X position
        add bx, 8                     ; Increment X position by 1 pixel

        ; Convert this pixel position to maze index
        mov dx, bx
        shr dx, 3                     ; Convert X pixel to tile coordinate
        mov cx, ax
        shr cx, 3                     ; Convert Y pixel to tile coordinate
        imul cx, MAZERLIMIT           ; Convert Y tile coordinate to row index
        add cx, dx                    ; Add X tile coordinate to get maze index
        mov si, ASCII_Maze
        add si, cx                    ; SI points to the tile in the maze

        ; Check for collision
        cmp byte [si], 1           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall
        cmp byte [si], 9           ; Check if the next position is a wall
        je .stopMovement              ; Stop movement if it's a wall

        mov bx, [xPosPinky]
        add bx, 1
        mov [xPosPinky], bx
        ; Update Pinky's position
        mov [xPosPinky], bx             ; Update X position

        mov ax, [old_YPOS_Pinky]
        mov bx, [old_XPOS_Pinky]
        call clear_sprite_at_position  ; Call subroutine to clear sprite at old position

        ; Store yPosPinky in a register (e.g., ax) and then move it to old_YPOS
        mov ax, [yPosPinky]    ; Move yPosPinky to ax
        mov [old_YPOS_Pinky], ax   ; Move ax to old_YPOS

        ; Store xPosPinky in a register (e.g., bx) and then move it to old_XPOS
        mov bx, [xPosPinky]    ; Move xPosPinky to bx
        mov [old_XPOS_Pinky], bx   ; Move bx to old_XPOS

        ; Draw Pinky's new sprite at the new position
        mov ax, [yPosPinky]              ; Get current Y position
        mov bx, [xPosPinky]              ; Get current X position
        call draw_Pinky_at_position   ; Call subroutine to draw Pinky at new position

        .delayLoop:
        nop              ; No-operation; does nothing but consumes time
        loop .delayLoop  ; Decrease CX and loop until CX is 0

        ; [Rest of the movement logic]

        jmp .moveLoop    ; Continue the loop for moving right

    .stopMovement:
        ; Collision detected, stop moving and reset direction
        neg word [direction]

    ret
;--------------------------------------

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



