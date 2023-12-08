;------------------------------------------------------
; Manages the input handling logic for a generic 2D game.
; Interprets player inputs from the keyboard or gamepad
; and translates them into in-game movements and actions.
;
; Provides a basic framework for a 2D game loop including
; player movement and rendering.
;------------------------------------------------------

[bits 16]
[org 100h]

%include "game_sprites.asm"
%include "../rendering/TheOfficialMaze.asm"

%define SCREEN_WIDTH 320
%define SCREEN_HEIGHT 200

%define SPRITEW 8
%define SPRITEH 8

section .data
playerXPos dw 0
playerYPos dw 80
playerSprite dd sprite_right_1
actualKeystroke dw 0

section .bss
keyPressed resb 1

section .text
start:
    ; Initialize game and enter graphics mode
    call InitializeGame
    call EnterGraphicsMode

    gameloop:
        call ProcessPlayerInput
        call UpdateGameLogic
        call RenderGraphics
        call CheckGameExit
        jmp gameloop

    ; Return to text mode and exit game
    call ExitGame

InitializeGame:
    ; Initialize player position
    mov word [playerXPos], 100 ; Set initial X position of the player
    mov word [playerYPos], 100 ; Set initial Y position of the player

    ; Initialize player sprite
    mov dword [playerSprite], sprite_right_1 ; Set initial sprite for the player

    ; Initialize game variables
    ; (Add any additional game-specific variables or states to initialize here)

    ; Setup initial game environment
    ; (This can include loading level data, setting up initial game objects, etc.)

    ; Initialize other components as needed
    ; (Such as score, lives, timers, or any other game mechanics)

    ret


EnterGraphicsMode:
    ; Set video mode to 13h, a common graphics mode (320x200 with 256 colors)
    mov ah, 0x00   ; Function: Set Video Mode
    mov al, 0x13   ; Mode 13h: 320x200 pixels, 256 colors
    int 0x10       ; Call BIOS Video Services

    ; Additional setup can be done here if needed
    ; (like palette initialization, clearing the screen, etc.)

    ret


ProcessPlayerInput:
    ; Check for keyboard input
    ; Update playerXPos and playerYPos based on arrow key input
    ; Implement logic for moving the player sprite
    call ReadKeyboardInput
    call UpdatePlayerPosition
    ret

UpdateGameLogic:
    ; Check for collisions with game boundaries or obstacles
    call CheckCollisions

    ; Update game elements such as enemies, power-ups, etc.
    call UpdateGameElements

    ; Check for game objectives or end conditions
    call CheckGameConditions

    ret

CheckCollisions:
    ; Collision detection logic goes here
    ; Example: Check if playerXPos and playerYPos are within game boundaries
    ; and adjust or respond accordingly (like stopping movement or losing a life)
    ret

UpdateGameElements:
    ; Update logic for other game elements
    ; For example, move enemies, spawn items, etc.
    ret

CheckGameConditions:
    ; Check for conditions like score milestones, lives remaining, etc.
    ; Implement logic for level completion, game over, etc.
    ret


RenderGraphics:
    ; Clear screen
    ; Draw player sprite at playerXPos, playerYPos
    ; Render other game elements
    ret

CheckGameExit:
    ; Implement logic to check if the game should exit
    ; Exit game loop if necessary
    ret

ExitGame:
    ; Return to text mode and trigger game exit sequence
    ret

; Implementations of ReadKeyboardInput, UpdatePlayerPosition, and other functions

;------------------------------------------------------
; Example implementation for ReadKeyboardInput
;------------------------------------------------------
ReadKeyboardInput:
    ; Check if a key is pressed
    mov ah, 0x01
    int 0x16       ; BIOS Keyboard Service
    jz NoKeyPress  ; Jump if no key is pressed

    ; Read the keystroke
    mov ah, 0x00
    int 0x16       ; BIOS Keyboard Service
    mov [actualKeystroke], ax ; Store the keystroke

    ; Check for arrow keys
    cmp ah, 0x48   ; Up arrow key
    je KeyIsUp
    cmp ah, 0x50   ; Down arrow key
    je KeyIsDown
    cmp ah, 0x4B   ; Left arrow key
    je KeyIsLeft
    cmp ah, 0x4D   ; Right arrow key
    je KeyIsRight
    jmp NoKeyPress

KeyIsUp:
    ; Code to handle up arrow key
    mov [actualKeystroke], 0x4800 ; Store up arrow keystroke
    mov byte [playerDirection], 'U' ; 'U' for Up
    jmp EndOfInputCheck

KeyIsDown:
    ; Code to handle down arrow key
    mov [actualKeystroke], 0x5000 ; Store down arrow keystroke
    mov byte [playerDirection], 'D' ; 'D' for Down
    jmp EndOfInputCheck

KeyIsLeft:
    ; Code to handle left arrow key
    mov [actualKeystroke], 0x4B00 ; Store left arrow keystroke
    mov byte [playerDirection], 'L' ; 'L' for Left
    jmp EndOfInputCheck

KeyIsRight:
    ; Code to handle right arrow key
    mov [actualKeystroke], 0x4D00 ; Store right arrow keystroke
    mov byte [playerDirection], 'R' ; 'R' for Right
    jmp EndOfInputCheck

NoKeyPress:
    ; Code to handle no key press
    ; This can be used to stop the player's movement or take no action
    ; For example, to stop movement:
    ; mov byte [playerDirection], 'N' ; 'N' for None or Stationary
    mov [actualKeystroke], 0x0000 ; Clear the keystroke
    jmp EndOfInputCheck

;------------------------------------------------------
; Example implementation for UpdatePlayerPosition
;------------------------------------------------------
UpdatePlayerPosition:
    ; Compare the player's current direction and update position accordingly
    mov al, [playerDirection]
    cmp al, 'U' ; Compare with 'U' for Up
    je MoveUp
    cmp al, 'D' ; Compare with 'D' for Down
    je MoveDown
    cmp al, 'L' ; Compare with 'L' for Left
    je MoveLeft
    cmp al, 'R' ; Compare with 'R' for Right
    je MoveRight

    ; If no valid direction is found, skip movement update
    jmp EndOfPositionUpdate

MoveUp:
    ; Decrease Y position to move up
    dec word [playerYPos]
    jmp EndOfPositionUpdate

MoveDown:
    ; Increase Y position to move down
    inc word [playerYPos]
    jmp EndOfPositionUpdate

MoveLeft:
    ; Decrease X position to move left
    dec word [playerXPos]
    jmp EndOfPositionUpdate

MoveRight:
    ; Increase X position to move right
    inc word [playerXPos]
    jmp EndOfPositionUpdate

EndOfPositionUpdate:
    ret

