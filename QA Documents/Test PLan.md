Testing plan V8:
last updated: 12/19/23 


## Table of content : 

<details><summary>Click to expand</summary>

- [I. Unitary testing.](#i-unitary-testing)
- [II. Integration testing.](#ii-integration-testing)
- [III. System testing.](#iii-system-testing)
- [IV. Display check.](#iv-display-check)
- [V. Update testing.](#v-update-testing) 
- [VI. Documentation and test reporting requirements.](#vi-documentation-and-test-reporting-requirements)
- [VII. Testing schedule.](#vii-testing-schedule)
- [VIII. Testing tools.](#viii-testing-tools)
- [IX. Validation criteria and status.](#ix-validation-criteria-and-status)
- [X. Testing methodology.](#x-testing-methodology)

</details>

______________

This testing plan is made to check the quality and the functionality of the Pac-Man game in a PC environment. The tests are made to make sure that the game is efficient in every way and that the player can enjoy the game.
 

Validation of the key features, performance,  UI, audiovisual and stability of the game. The game must be challenging, but not too hard. 

Here is what will be covered : 

# I. Unitary testing.
## 1. Pac-Mans movements.

We must ensure that Pac-Man can be pointed in every dictated direction by the keyboard, which are up, down, left and right.

## 2. Collisions with the walls and with the points.

When Pac-Man eats a dot, the score should move accordingly and the dot must vanish. When Pac-Man faces a wall, he must be stopped.
 ## 3. Ghosts behavior.

 We must ensure that every ghosts respect their assigned behavior, which are :   
 Blinky : tracks Pac-Man and is always agressiv.  
 Pinky : tries to predict Pac-Mans movements, and will position herself in front of Pac-Man to trap him.   
 Inky : his movements are depending of Blinky's movements, as Pinky, he will try to trap Pac-Man.  
 Clyde : in opposition to the others, Clyde doesn't always chase Pac-Man ; if he's far of him, he will chase him down, but if he's too close, he will runaway.   

# II. Integration testing.

## 1. Pac-Mans movements with the dots.

 We must verify that Pac-Man interacts correctly with the dots when he moves through the maze. Pac-Man movements shouldn't be impacted when he picks up dots.

## 2. Interactions between Pac-Man and the ghosts.

 We must test the interactions between Pac-Man and every single ghosts, we have to make sure that Pac-Man dies/looses a life when this happens. We have to ensure that each ghosts react and move according to Pac-Man movements.    

## 3. Level transitions and screen menu.

 We have to see if the screen transitions between levels and level to menu is smooth enough. In addtition to this, we must check if there is nothing wrong when we move from a level to another.

## 4. Power-ups effects on Pac-Man and the ghosts.

 When Pac-Man eats a power-up, we have to make sure that it makes the ghosts vulnerable to him, futhermore, their attitude toward Pac-Man changes, they all try to escape, no matter what their assigned behavior is. 

# III. System testing.

 The following parts process the game stability and fluidity.

 ## 1. Game stability.
  
  We must check if the game stays stable even on a long game session. Playing for a long periode of time must not impact the player's gameplay.
 
  ## 2. Game fluidity.
  
  We have to ensure that the player doesnt encounter any freezes or slowdowns during his playtime. Futhermore, there should be no latency when the player presses the keyboard.

# IV. Display check.
 
 ## 1. Maze check.
 
   We must ensure that every wall, path and every elements in the maze are correctly displayed, without any visual artifact or distortion. 

 ## 2. Characters check.

  We must check that Pac-Man and the ghosts are correctly shown, with every proper details and animations, which are : eyes changing direction depending on where they are facing, the ghosts' tentacles that are moving or Pac-Mans mouth that is in the direction he's moving. 

 ## 3. UI check.

  The user interface must be watched carefully, the score and the remaining lives should be displayed so that the player can see these informations. Some space will be left to eventually put the highscores or other features that we'll eventualy implement.

 ## 4. Animation check and visual effects.
 
  We have to check if Pac-Man and the ghosts movements are smoothly displayed, without couplings or any other problems. The powerups, collisions and transitions visual effects should be displayed with no issues. 


# V. Update testing. 
 
 ## 1. Backups.
  
  For safety, we will do backups before every update that we are planning to do. In case of an inconvenient event, all the data will remain stored.

  ## 2. New features testing and backwards compatibility. 

  If an updates occures, we will take note of any changes that will be made and test them manually as was done for the maze and every previous features. We have to make sure that the existing files will still work even with new features added, so we'll test every features, even old ones, that will be impacted by the update. 

# VI. Documentation and test reporting requirements.

 ## 1. Documentation.

   ### 1.1 Test plan. 
   
   This document shows the testing strategy, the objectives and how the tests will be made.
  
  ### 1.2 Traceability table.

   This table will show every modification done, every found test, made by whom, when and how. It will also give the current version.
  
 ## 2. Test reporting requirements. 
   
   The test reports must include a summary of how the tests were done, the results of those said tests, and if issues got detected.
   For each made test, the steps and results should reported, with screen shots if necessary. 
   All the found bugs will be listed, their severity will be specified, as well as their status and every steps to remake them. 
   The traceability table will be updated in accordance to the test report. 
   Reports will be made after each done test. It will contain every results with the bugs, what bugs got detected and their state, if they are corrected or not yet, and their severity. 
  
  
  

# VII. Testing schedule.

 The test plan is due to the 12/8 at 5pm. A working prototype will be delivred on the 12/11 at 5pm, which will be tested as much as possible. Then, the final product will be sent on 12/21 at 5pm, fully tested and operational.
 Since we'll only have a playable version for the 12/11, all major tests will be done between 12/11 and 12/21. 




# VIII. Testing tools.

 ## 1. Hardware.
   A MacBook Air 2020 and a Lenovo Thinkbook 14 will be used to test our Pac-Man game.   

 ## 2. Software. 
   
   [DOSBox 0.74-3 for macOS](https://www.dosbox.com/download.php?main=1)  
   [DOSBox 0.74-3 for Windows](https://www.dosbox.com/download.php?main=1)  
   [NASM](https://www.nasm.us/) for the assembly language  
   [Visual Studio Code](https://code.visualstudio.com/) used to develop the game.  
   [GitHub](https://github.com/) to share the code between the devs.

 ## 3. Flaws tracking. 
    
   To keep an eye on every errors, we will use Githubs issues to keep track on a case-by-case basis. By doing this, we will be able to access every issue that occured during the project. 
 

 ## 4. Environment.
   Everything will be made to be run on DosBox in a x86 architecture. It will meet the conditions to develop Pac-Man like it was back in 1980.


# IX. Validation criteria and status.

The following table shows the most important features and their current progress. It will be updated during the test phase to keep track of the progress.

| Aspect               | Validation Criteria                                | Validation Status   | Comment     |
|----------------------|----------------------------------------------------|---------------------|-----------------|
| Collision            | Correctly working collision between Pac-Man and walls        | In progress             |                 |
|                      | Appropriate interaction between Pac-Man and ghosts  | In progress         |                 |
| Movement             | Smooth Pac-Mans movements                         | In progress         |                 |
|                      | Responsiveness and accuracy of commands             | In progress         |                 |
| Game Mechanics       | Efficient collection of pac-dots                    | In progress         |                 |
|                      | Pursuit and evasion mechanisms of ghosts            | In progress           |                 |
| Graphics             | Clear and representative maze display               | In progress             |                 |
|                      | Appealing visuals for characters and game elements  | In progress         |                 |
| Audio                | Clear and coherent sound effects                    | Optional           |   Will be done if everything else is done               |
|                      | Accompanying music                        | Optional            |              Will be done if everything else is done   |
| Controls             | Easy grasp for new players                          | In progress             |                 |
|                      | Adaptation of controls to gaming platforms          | In progress             |                 |
| User Interface       | Clarity and readability of on-screen information    | In progress         |                 |
|                      | Ease of navigation through menus                     | In progress             |                 |



# X. Testing methodology. 
 
A series of manual test cases will lead the tester through the validation process, covering various scenarios. Every issues will be reported in "Github issues", like in the part "Flaws tracking". Futhermore, a complete documentation of every test results, including observed behavior and if they are resolved or not like specified in the "Test reporting requirements." part. 
