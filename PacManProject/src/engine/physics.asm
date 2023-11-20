;------------------------------------------------------------------------
;
; Responsible for the physics calculations, including movements of 
; Pac-Man® and ghosts, and handling the game's collision detection logic.
;
; Ensures realistic movement and interaction within the game world.
;
;------------------------------------------------------------------------

;------------------------------------------------------------------------
; physics.asm Pseudo-Code
;------------------------------------------------------------------------
; Start:
;     Initialize Physics Parameters
;     Set Movement Speeds for Pac-Man and Ghosts
;     Set Wall Boundaries
; 
; UpdatePositions:
;     Call UpdatePacmanPosition
;     Call UpdateGhostsPositions
;     Return
; 
; UpdatePacmanPosition:
;     Get Current Pac-Man Direction
;     Calculate New Position based on Speed and Direction
;     If New Position does not collide with Wall Then
;         Update Pac-Man's Position
;     EndIf
;     Return
; 
; UpdateGhostsPositions:
;     For Each Ghost
;         Get Current Ghost Direction
;         Calculate New Position based on Speed and AI Direction
;         If New Position does not collide with Wall Then
;             Update Ghost's Position
;         EndIf
;     Next Ghost
;     Return
; 
; CheckCollisions:
;     Call CheckPacmanCollision
;     Call CheckGhostsCollisions
;     Return
; 
; CheckPacmanCollision:
;     If Pac-Man's Position collides with Ghost and Power-Up is Active Then
;         Call HandleGhostEaten
;     Else If Pac-Man's Position collides with Ghost Then
;         Call HandlePacmanEaten
;     EndIf
;     Return
; 
; CheckGhostsCollisions:
;     For Each Ghost
;         If Ghost's Position collides with Pac-Man and Power-Up is Active Then
;             Call HandleGhostEaten
;         EndIf
;     Next Ghost
;     Return
; 
; HandleGhostEaten:
;     Reset Ghost Position
;     Increment Score
;     Return
; 
; HandlePacmanEaten:
;     Decrement Lives
;     Reset Pac-Man Position
;     If Lives are 0 Then
;         Call GameOver
;     EndIf
;     Return
; 
; GameOver:
;     Trigger Game Over Routine
;     Return
;------------------------------------------------------------------------
