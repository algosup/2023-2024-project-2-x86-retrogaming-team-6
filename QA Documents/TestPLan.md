Testing plan v1:
last update: 11/20/23 




introduction:

This testing plan is made to check the quality and the functionality of the pacman game in a PC environment. The tests are made to make sure that the game is efficient in every way and that the player can enjoy the game.


Objectives: 

Validation of the key features, performance,  UI, audiovisual and stability of the game. The game must be challenging, but not too hard. 

Here are what will be covered: 

I. Unitary testing
1. Pac-Mans movements

We must ensure that Pac-Man can be pointed in every dictated direction by the keyboard, which are up, down, let and right.

2. Collisions with the walls and with the points

When Pac-Man eats a dot, the score should move accordingly and the dot must vanish. When Pac-Man faces a wall, he should be stopped.

 3. Ghosts behavior.

We must ensure that every ghosts respects its assigned behavior, which are : 

Blinky : he tracks Pac-Man, always agressiv.
Pinky : she tries to predict Pac-Mans movements, and will position herslef in front of Pac-Man to trap him. 
Inky : his movements are depending of Blinkys movements, as Pinky, he will try to trap Pac-Man.
Clyde : in opposition to the others, Clyde doesnt always chase Pac-Man ; if he's far of him, he will chase him down, but if he's too close, he will runaway. 

II. Integration testing

1. Pac-Mans movements with the dots.

We must verify that Pac-Man interacts correctly with the dots when he mooves through the maze. Pac-Man movements shouldnt be impacted when he picks up dots.

2. Interactions between Pac-Man and the ghosts.

We must test the interactions between Pac-Man and every single ghosts, we have to make sure that Pac-Man dies/looses a life when this happens. We have to ensure that each ghosts react and moove according to Pac-Man movments.    

3. Level transitions and screen menu.

We have to see if the screen transitions between levels and level to menu is smooth enough. In addtition to this, we have to check if there is nothing  wrong when we move from a level to another.

4. Power-ups integration between Pac-Man and the ghosts.

When Pac-Man eats a power-up, we have to make sure that it makes the ghosts vulnerable to him, futhermore, their behavior toward Pac-Man change, they all try to escape, no matter their assigned behavior is. 








III. System testing
IV. Display check
V. (Potential) Update testing
VI. Documentation and test reporting requirements
VII. Testing schedule
VIII. Testing tools
IX.