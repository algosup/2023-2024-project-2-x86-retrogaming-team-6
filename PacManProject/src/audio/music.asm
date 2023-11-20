; -------------------------------------------------------
;
; Controls the background music playback, ensuring 
; seamless looping and adaptive music changes based on the 
; game state.
;
; Maintains an engaging and mood-appropriate 
; auditory backdrop.
;
; -------------------------------------------------------

; -------------------------------------------------------
; music.asm Pseudo-Code
; -------------------------------------------------------
;
; Start:
;     Initialize Music and Sound System
;     Load Music Tracks and Sound Effects
; 
; PlayBackgroundMusic:
;     Select Background Music Track for Current Level
;     Play Music Track in Loop Mode
;     Return
; 
; StopBackgroundMusic:
;     Stop Music Playback
;     Return
; 
; PlaySoundEffect:
;     Get Sound Effect Identifier (e.g., Pac-Man Eating, Ghost Eaten)
;     Play Corresponding Sound Effect Once
;     Return
; 
; HandleAudioEvents:
;     If Pac-Man Eats Pellet Then
;         Call PlaySoundEffect with Pellet Sound
;     EndIf
;     If Pac-Man Eats Power Pellet Then
;         Call PlaySoundEffect with Power Pellet Sound
;     EndIf
;     If Pac-Man Eats Ghost Then
;         Call PlaySoundEffect with Ghost Eaten Sound
;     EndIf
;     If Pac-Man Loses Life Then
;         Call PlaySoundEffect with Death Sound
;     EndIf
;     Return
; 
; AdjustVolume:
;     Set Volume Level for Music and Sound Effects
;     Return
; 
; CleanUpAudio:
;     Stop Any Playing Music or Sound Effects
;     Unload Audio Resources
;     Return
;
; -------------------------------------------------------