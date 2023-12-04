;----------------------------------------------------------------------------
;
; Contains the primary game loop which controls the overall flow of the game,
; including initialization and updates of the game state at each frame.
;
; Orchestrates the game's overall operation, ensuring each component 
; interacts seamlessly.
;
;----------------------------------------------------------------------------

;----------------------------------------------------------------------------
; main.asm Pseudo-Code
;----------------------------------------------------------------------------
; Start:
;     Initialize Game
;     Call InitializeGame
; 
; MainGameLoop:
;     Call ProcessInput
;     Call UpdateGameState
;     Call RenderState
;     If Game Over Detected Then
;         Call HandleGameOver
;     Else If Game Won Detected Then
;         Call HandleGameWin
;     EndIf
;     If 'Exit Game' selected Then
;         Exit
;     Else
;         Jump to MainGameLoop
;     EndIf
; 
; InitializeGame:
;     Load Assets
;     Set Initial Positions
;     Set Initial Scores
;     Return
; 
; ProcessInput:
;     Read User Input
;     Update Pac-Man Direction based on Input
;     Return
; 
; UpdateGameState:
;     Move Pac-Man
;     Call MoveGhosts
;     Check for Collisions
;     Update Score and Lives
;     Return
; 
; RenderState:
;     Draw Maze
;     Draw Pac-Man
;     Draw Ghosts
;     Draw Score and Lives
;     Return
; 
; MoveGhosts:
;     For Each Ghost
;         Calculate Ghost Movement based on AI
;     Next
;     Return
; 
; CheckCollisions:
;     Check Pac-Man Collisions with Walls
;     Check Pac-Man Collisions with Ghosts
;     Check Pac-Man Collisions with Pellets
;     Check Pac-Man Collisions with Power Pellets
;     Return
; 
; HandleGameOver:
;     Display Game Over Screen
;     Wait for User Input
;     Return
; 
; HandleGameWin:
;     Display Victory Message
;     Wait for User Input
;     Return
; 
; Exit:
;     Perform Cleanup
;     Terminate Program
; 
;----------------------------------------------------------------------------