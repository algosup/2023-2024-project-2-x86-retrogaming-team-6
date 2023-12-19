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

%include "pacmansprite.asm"

section .data

; ---------------------------------------------------------------------------

; ---------------------------------------------------------------------------
; blinky sprites
blinky_right_1 db 0xFF, 0xFF, 0x28, 0x28, 0x28, 0x28, 0xFF, 0xFF
               db 0xFF, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0xFF
               db 0x28, 0x28, 0x0f, 0x00, 0x28, 0x0f, 0x00, 0x28
               db 0x28, 0x28, 0x0f, 0x00, 0x28, 0x0f, 0x00, 0x28
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
             db 0x34, 0x34, 0x0f, 0x00, 0x34, 0x0f, 0x00, 0x34
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
             db 0x54, 0x54, 0x0f, 0x00, 0x54, 0x0f, 0x00, 0x54
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
              db 0x42, 0x42, 0x0f, 0x00, 0x42, 0x0f, 0x00, 0x42
              db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
              db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
              db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
              db 0x42, 0xFF, 0x42, 0x42, 0xFF, 0x42, 0x42, 0x42

clyde_left_1 db 0xFF, 0xFF, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF
             db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF
             db 0x42, 0x00, 0x0f, 0x42, 0x00, 0x0f, 0x42, 0x42
             db 0x42, 0x00, 0x0f, 0x42, 0x00, 0x0f, 0x42, 0x42
             db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
             db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
             db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
             db 0x42, 0x42, 0x42, 0xFF, 0x42, 0x42, 0xFF, 0x42


clyde_down_1 db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF
            db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x0f, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x00, 0x00, 0x42, 0x42
            db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x0f, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x00, 0x00, 0x42, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF


clyde_up_1  db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x00, 0x00, 0x42, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x0f, 0x42, 0x42
            db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x00, 0x00, 0x42, 0x42
            db 0x42, 0x42, 0x42, 0x42, 0x0f, 0x0f, 0x42, 0x42
            db 0xFF, 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF
            db 0x42, 0x42, 0x42, 0x42, 0x42, 0x42, 0xFF, 0xFF

; ---------------------------------------------------------------------------

; ---------------------------------------------------------------------------
; initialize data for Blinky
yPosBlinky dw 100                     ; the starting y coordinate of the sprite
xPosBlinky dw 200                     ; the starting x coordinate of the sprite
yVelocityBlinky dw 320                ; to go from one line to another
xVelocityBlinky dw 1                  ; horizontal speed
directionBl db 'R'                    ; Current direction (R, L, U, D)

currentBlinkySprite dd blinky_right_1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; initialize data for Inky
yPosInky dw 150                   ; the starting y coordinate of the sprite
xPosInky dw 150                   ; the starting x coordinate of the sprite
yVelocityInky dw 320              ; to go from one line to another
xVelocityInky dw 1                ; horizontal speed
directionIn db 'R'                ; Current direction (R, L, U, D)

currentInkySprite dd inky_right_1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; Initialize data for Clyde
yPosClyde dw 200                    ; the starting y coordinate of the sprite
xPosClyde dw 50                     ; the starting x coordinate of the sprite
yVelocityClyde dw 320               ; to go from one line to another
xVelocityClyde dw 1                 ; horizontal speed
directionCl db 'R'                  ; Current direction (R, L, U, D)

currentClydeSprite dd clyde_right_1 ; the current sprite to be displayed
; ---------------------------------------------------------------------------
; Initialize data for Pinky
yPosPinky dw 50                     ; the starting y coordinate of the sprite
xPosPinky dw 75                     ; the starting x coordinate of the sprite
yVelocityPinky dw 320               ; to go from one line to another   
xVelocityPinky dw 1                 ; horizontal speed
directionPi db 'R'                  ; Current direction (R, L, U, D)

currentPinkySprite dd pinky_right_1 ; the current sprite to be displayed

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


;wall sprite
WallVertical_Sprite:
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00

WallHorizontal_Sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

;Border Corner sprite
BorderUpRight_Sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x37
    db 0x00, 0x00, 0x00, 0x00, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37
    db 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x37, 0x00

BorderUpLeft_Sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x37, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00
    db 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00
    
BorderDownRight_Sprite:
    db 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37
    db 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x37
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

BorderDownLeft_Sprite:
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00
    db 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x00, 0x00, 0x00, 0x00
    db 0x37, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

;InsideWallCorner sprite
InsideWallCornerRight_Sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

InsideWallCornerLeft_Sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

InsideWallCornerUp_Sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00

InsideWallCornerDown_Sprite:
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

;Ghost Base Corner sprite

GhostBaseCornerUpRight_sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x37
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00

GhostBaseCornerUpLeft_sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x37, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00

GhostBaseCornerDownRight_sprite:
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x37
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

GhostBaseCornerDownLeft_sprite:
    db 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x37, 0x37, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x37, 0x00
    db 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x37, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    
;Gate sprite

Gate_sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x3B, 0x3B, 0x3B, 0x3B, 0x3B, 0x3B, 0x3B, 0x3B
    db 0x3B, 0x3B, 0x3B, 0x3B, 0x3B, 0x3B, 0x3B, 0x3B
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    
;Dot sprite

Dot_sprite:
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x37, 0x37, 0x37, 0x37, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

;Empty space sprite

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

yPosPac dw 100                           ; the starting y coordinate of the sprite
old_YPOSPAC dw 0
xPosPac dw 38520                         ; the starting x coordinate of the sprite   
old_XPOSPAC dw 0     
yVelocityPac dw 320                      ; to go from one line to another
xVelocityPac dw 7/4                      ; horizontal speed
directionPac db 'R'                      ; Current direction (R, L, U, D)

pacman_x dd 40                           ; the x coordinate of the sprite
pacman_y dd	12                           ; the y coordinate of the sprite
currentPacmanSprite dd pacmanRight1    ; the current sprite to be displayed

spritew dw 8
spriteh dw 8

old_XPOS dw 0

old_YPOS dw 0

currentSprite dw 0

actualKeystroke dw 0

; ---------------------------------------------------------------------------

; ASCII representation of the maze
ASCII_Maze: 
    db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 
    db 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1 
    db 1, 3, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 3, 1 
    db 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1 
    db 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1 
    db 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1 
    db 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1 
    db 0, 0, 0, 0, 1, 2, 1, 1, 1, 2, 1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 1, 2, 1, 1, 1, 2, 1, 0, 0, 0, 0 
    db 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0, 1, 1, 4, 4, 4, 1, 1, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1 
    db 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1, 6, 0, 7, 0, 8, 1, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0 
    db 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1 
    db 0, 0, 0, 0, 1, 2, 1, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 1, 1, 2, 1, 0, 0, 0, 0 
    db 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1 
    db 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1 
    db 1, 2, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 2, 1 
    db 1, 2, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 2, 1 
    db 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1 
    db 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1 
    db 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1    

    Column dw 31
    Row dw 19
    PixelPerTileRow dw 2560

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
    mov bx, [xVelocityPac]      ; move the velocity to bx
    add bx, [xPosPac]           ; add the velocity to the current position
    mov [xPosPac], bx           ; move the new position to the current position
    call update_left
    jmp gameloop
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


 checkCollision:

       

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
        mov ax, 31
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
            cmp al, 5
            je DrawBlinky 
            cmp al, 6
            je DrawPinky
            cmp al, 7
            je DrawInky
            cmp al, 8
            je DrawClyde   

        
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
          DrawBlinky: 
                mov si, [currentBlinkySprite]
                call drawWalls
                jmp wallchoice
          DrawInky: 
                mov si , [currentInkySprite]
                call drawWalls
                jmp wallchoice
          DrawClyde:
                mov si, [currentClydeSprite]
                call drawWalls
                jmp wallchoice
          DrawPinky:
                mov si, [currentPinkySprite]
                call drawWalls
                jmp wallchoice
                



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