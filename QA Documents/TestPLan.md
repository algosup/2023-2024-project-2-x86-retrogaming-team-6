Testing plan V2:
last update: 11/21/23 




introduction:

This testing plan is made to check the quality and the functionality of the pacman game in a PC environment. The tests are made to make sure that the game is efficient in every way and that the player can enjoy the game.


Objectives: 

Validation of the key features, performance,  UI, audiovisual and stability of the game. The game must be challenging, but not too hard. 

Here are what will be covered: 

I. Unitary testing.
1. Pac-Mans movements

We must ensure that Pac-Man can be pointed in every dictated direction by the keyboard, which are up, down, let and right.

2. Collisions with the walls and with the points

When Pac-Man eats a dot, the score should move accordingly and the dot must vanish. When Pac-Man faces a wall, he must be stopped.

 3. Ghosts behavior.

We must ensure that every ghosts respects their assigned behavior, which are : 

Blinky : he tracks Pac-Man and is always agressiv.

Pinky : she tries to predict Pac-Mans movements, and will position herslef in front of Pac-Man to trap him. 

Inky : his movements are depending of Blinkys movements, as Pinky, he will try to trap Pac-Man.

Clyde : in opposition to the others, Clyde doesnt always chase Pac-Man ; if he's far of him, he will chase him down, but if he's too close, he will runaway. 

II. Integration testing.

1. Pac-Mans movements with the dots.

We must verify that Pac-Man interacts correctly with the dots when he mooves through the maze. Pac-Man movements shouldnt be impacted when he picks up dots.

2. Interactions between Pac-Man and the ghosts.

We must test the interactions between Pac-Man and every single ghosts, we have to make sure that Pac-Man dies/looses a life when this happens. We have to ensure that each ghosts react and moove according to Pac-Man movments.    

3. Level transitions and screen menu.

We have to see if the screen transitions between levels and level to menu is smooth enough. In addtition to this, we must check if there is nothing  wrong when we move from a level to another.

4. Power-ups integration between Pac-Man and the ghosts.

When Pac-Man eats a power-up, we have to make sure that it makes the ghosts vulnerable to him, futhermore, their attitude toward Pac-Man change, they all try to escape, no matter their assigned behavior is. 

III. System testing.

 game stability, fluidity

 1. Game stability.
  
  We must check if the game stays stable even on a long game session. Playing for a long periode of time must not impact the players gameplay.
 
  2. Game fluidity.
  
  We have to ensure that the player doesnt encounter any freezes or slowdowns during his playtime. Futhermore, there should be no latency when the player presses the keyboard.

IV. Display check.
 
 1. Maze check.
 
 We must ensure that every wall, path and every elements in the maze are correctly displayed, without any visual artifact or distortion. 

 2. Characters check.

 We must check that Pac-Man and the ghosts are correctly shown, with every  proper details and animations, which are : eyes changing direction depending of where they are facing, the ghosts tentacles that are moving or the Pac-Mans mouth that is in the direction he his moving. 

 3. UI check.

 The user interface must be watched carefully, the score and the remaining lives should be displayed so that the player can see these informations. Some space will be left to eventually put the highscores or other features that we'll eventualy implement.

 4. Animation check and visual effects.
 
 We have to check if Pac-Man and the ghosts movements are smoothly displayed, without couplings or any other problems. The powerups, collisions and transitions visual effects should be displayed with no issues. 


V. (Potential) Update testing. 
 
 1. Backups.
  
  For safety, we will do backups before every update that we are planning to do. In case of an inconvenient event, all the data will remain stored.

  2. New features testing. 

 If an updates occures, we will take note of any changes that will be made and test them manually as was done for the maze and every previous features. 








V. (Potential) Update testing
VI. Documentation and test reporting requirements
VII. Testing schedule (dates)
VIII. Testing tools (environement)(hardware, software, flaws tracking app/device)
IX. Validation criteria (at what point will we consider a point as "done")
X. Test methodology (?) everything will be done manualy ig

faire un table of content. 