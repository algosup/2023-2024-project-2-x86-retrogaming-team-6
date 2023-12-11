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

%include "maze.asm"


section .data

section .bss

;------------------------------------------------------

section .text
start:
    call maze
