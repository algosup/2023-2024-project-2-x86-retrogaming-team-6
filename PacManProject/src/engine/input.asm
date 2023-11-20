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

