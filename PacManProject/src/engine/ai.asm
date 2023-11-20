;-----------------------------------------------------------
;
; Implements the artificial intelligence for the ghosts, 
; defining their behavior patterns like chasing, scattering, 
; and evading Pac-Man®.
;
; Creates challenging and dynamic gameplay by programming 
; ghost behaviors.
;
;-----------------------------------------------------------

;-----------------------------------------------------------
; ai.asm Pseudo-Code
;-----------------------------------------------------------
; Start:
;     Initialize Ghost States
;     Set Scatter Mode Timers
;     Set Chase Mode Timers
; 
; GhostAI:
;     For Each Ghost
;         If Ghost is in Scatter Mode Then
;             Move towards Scatter Target
;         Else If Ghost is in Chase Mode Then
;             Move towards Chase Target based on Ghost Personality
;         Else If Ghost is in Frightened Mode Then
;             Move Randomly
;         EndIf
;         Switch Modes if Timer Expires
;     Next Ghost
;     Return
; 
; ScatterMode:
;     Set Scatter Mode Targets for Each Ghost
;     Return
; 
; ChaseMode:
;     For Each Ghost
;         If Ghost is Blinky Then
;             Target Pac-Man's Position
;         Else If Ghost is Pinky Then
;             Target Four Tiles ahead of Pac-Man's Direction
;         Else If Ghost is Inky Then
;             Use Complex Algorithm involving Blinky's Position
;         Else If Ghost is Clyde Then
;             Target Pac-Man's Position if Far, Scatter Target if Close
;         EndIf
;     Next Ghost
;     Return
; 
; FrightenedMode:
;     For Each Ghost
;         Move in a Random Direction
;     Next Ghost
;     Return
; 
; SwitchModes:
;     For Each Ghost
;         If Mode Timer Expires Then
;             Toggle between Scatter and Chase
;         EndIf
;         If Power Pellet Eaten by Pac-Man Then
;             Enter Frightened Mode
;         EndIf
;         If Ghost Eaten by Pac-Man Then
;             Respawn Ghost at Ghost House
;         EndIf
;     Next Ghost
;     Return
; 
; RespawnGhost:
;     Reset Ghost Position to Ghost House
;     Set to Scatter Mode
;     Return
;------------------------------------------------------------

