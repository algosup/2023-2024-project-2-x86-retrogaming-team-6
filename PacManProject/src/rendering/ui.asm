;---------------------------------------------
;
; Dedicated to rendering the user interface 
; elements like the score display, lives, 
; and game menus.
;
; Enhances user experience through clear and 
; responsive UI elements.
;
;---------------------------------------------

;---------------------------------------------
; ui.asm Pseudo-Code
;---------------------------------------------
;
; Start:
;     Initialize UI System
;     Load UI Assets (buttons, frames, icons)
; 
; RenderMainMenu:
;     Display Main Menu Options (Play, High Scores, Exit)
;     Handle User Input for Menu Selection
;     If Play Selected Then
;         Call StartGame
;     Else If High Scores Selected Then
;         Call ShowHighScores
;     Else If Exit Selected Then
;         Call ExitGame
;     EndIf
;     Return
; 
; RenderGameUI:
;     Display Game UI Elements
;     Call DrawScore
;     Call DrawLives
;     Return
; 
; DrawScore:
;     Get Current Score
;     Render Score on Screen using text.asm
;     Return
; 
; DrawLives:
;     Get Number of Lives Left
;     Render Lives Indicator on Screen using text.asm
;     Return
; 
; ShowHighScores:
;     Retrieve High Scores List
;     Display High Scores on Screen
;     Wait for User Input to Return to MainMenu
;     Return
; 
; StartGame:
;     Initialize Game Components
;     Switch to Game View
;     Return
; 
; PauseMenu:
;     Display Pause Menu Options (Resume, Main Menu)
;     Handle User Input for Menu Selection
;     If Resume Selected Then
;         Return to Game
;     Else If Main Menu Selected Then
;         Return to RenderMainMenu
;     EndIf
;     Return
; 
; GameOverScreen:
;     Display Game Over Message
;     Show Final Score and Options to Replay or Exit
;     Handle User Input for Selection
;     If Replay Selected Then
;         Call StartGame
;     Else
;         Return to RenderMainMenu
;     EndIf
;     Return
; 
; ExitGame:
;     Perform Cleanup Operations
;     Exit Application
;     Return
; 
;---------------------------------------------
