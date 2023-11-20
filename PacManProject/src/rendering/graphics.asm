;-------------------------------------------------
;
; Manages the rendering of all graphical elements 
; in the game, including the maze, characters 
; (Pac-Man® and ghosts), and power-ups.
;
; Brings the visual elements of the game to life.
;
;-------------------------------------------------

;-------------------------------------------------
; graphics.asm Pseudo-Code
;-------------------------------------------------
; Start:
;     Initialize Graphics System
;     Load Sprites and Images
;     Set Screen Dimensions and Parameters
; 
; DrawMaze:
;     For Each Maze Cell
;         If Wall Then
;             Draw Wall Sprite at Cell Location
;         Else
;             Draw Path Sprite
;         EndIf
;         If Pellet Then
;             Draw Pellet Sprite
;         EndIf
;         If Power Pellet Then
;             Draw Power Pellet Sprite
;         EndIf
;     Next
;     Return
; 
; DrawPacMan:
;     Get Pac-Man's Current Position
;     Select Correct Sprite Based on Direction
;     Draw Pac-Man Sprite at Position
;     Return
; 
; DrawGhosts:
;     For Each Ghost
;         Get Ghost's Position and State
;         Select Correct Sprite Based on State
;         Draw Ghost Sprite at Position
;     Next
;     Return
; 
; RenderScore:
;     Draw Current Score on Screen
;     Return
; 
; RenderLives:
;     Draw Pac-Man Lives Remaining on Screen
;     Return
; 
; UpdateScreen:
;     Refresh Screen to Show Latest Graphics
;     Return
;-------------------------------------------------

