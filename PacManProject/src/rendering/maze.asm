;-----------------------------------------------
;
; This file contains the layout and design of 
; the Pac-Man® maze. It should include data 
; representing the structure of the maze, such 
; as the positions of walls, paths, and special 
; items (like power pellets).
;
;-----------------------------------------------

;-----------------------------------------------
; maze.asm Pseudo-Code
;-----------------------------------------------
;
; Start:
;     Initialize Maze Configuration
;     Load Maze Layout from Data
; 
; CreateMaze:
;     Set Maze Dimensions
;     For Each Cell in the Maze
;         Determine if Cell is Wall, Path, Pellet, or Power Pellet
;         Store Cell Type in Maze Data Structure
;     Next
;     Return
; 
; DrawMaze:
;     For Each Cell in the Maze
;         If Wall Then
;             Call DrawWall at Cell's Position
;         Else If Path Then
;             Call DrawPath at Cell's Position
;         EndIf
;         If Pellet Then
;             Call DrawPellet at Cell's Position
;         Else If Power Pellet Then
;             Call DrawPowerPellet at Cell's Position
;         EndIf
;     Next
;     Return
; 
; DrawWall:
;     Draw Wall Graphics at Given Position
;     Return
; 
; DrawPath:
;     Draw Path Graphics at Given Position
;     Return
; 
; DrawPellet:
;     Draw Pellet Graphics at Given Position
;     Return
; 
; DrawPowerPellet:
;     Draw Power Pellet Graphics at Given Position
;     Return
; 
; UpdateMaze:
;     If Pellet Eaten Then
;         Remove Pellet from Maze Layout
;     EndIf
;     If Power Pellet Eaten Then
;         Remove Power Pellet from Maze Layout
;     EndIf
;     Return
;
;-----------------------------------------------
