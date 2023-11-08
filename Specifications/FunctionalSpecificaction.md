# Functional Specification Team-6

### Table of content : 
<details><summary> Click to expand </summary><br>
1 - Team Members and roles <br>
2 - System Overview Overview <br>
3 - Goals and non goals <br>

</details>

### 1 - Introduction 
#### 1.1 Pac-Man®
The Pac-Man video game was released on October 25, 1980, in the USA. It is a maze action game developed by Namco, originally for arcades. The player controls Pac-Man, who is chased by four different ghosts in a maze. The player's goal is to eat every dot in the maze to complete the level and move on to the next one.

But there's a twist: large flashing dots, named "Power Pellets", turn the ghosts blue, making them vulnerable to the player's attacks and giving bonus points.

#### 1.2 Assembly language
Assembly is a low-level programming language, created in 1947, closely related to the architecture of a CPU. Each assembly language instruction corresponds to a specific operation that the CPU can perform, such as arithmetic calculations, data movement, and control flow. Assembly is used to write programs that interact directly with a computer's hardware and control its operations. Assembly is specific to a particular CPU architecture, and code written for one type of CPU may not be compatible with another. 

#### 1.3 Our passion 
We have a deep appreciation for the history of video games and we are  particularly fascinated by the arcade era. We discovered Pac-Man in our childhood and became captivated by its simplicity and challenging gameplay. We are computer science students who are intrigued by the technical aspects of classic arcade games.         
We are willign to recreate the game in a challenging way, with Assembly.           
We are willing to push ourselves and make the version of Pac-Man® we always dreamed of.         
We are willing to give our best while keeping the original and timeless format of Pac-Man®



### 2 - Project Scope and Obectives
#### 2.1 - Scope 
The scope of this project is to recreate the classic Pac-Man® , using Assembly language on x86 on DosBox.

#### 2.2 - Objectives 
The objectives of this project are simple, we must recreate Pac-Man®, using the Assembly language on an emulator.   
The game must be as enjoyable as the original game, re-using the idea of the maze action game, while twisting it a bit to add something new and original to it. 

### 3 - Functional Requirements
#### 3.1 Basic Game Mechanics:

**Player movement:** The player must be able to control its character
Ghost AI: Ghosts have to follow a specific pattern that will be created by the developers.     
*To have more information about the player's movement, refer to the input controls section below.*

**Pellet collection:** the character has to collect pellet in order to win the game, and not forget the "Power Pellets" that gives the ability to eat the Ghosts to the player.  

**Level progression:** Once the player has collected every pellets available on the maze, a new level shall appear and bonus points will be given to the player.

**Maze Design:**
The layout will be based on the original Pac-Man® game, with some twist added to it.
Add dimensions + how it will change, show which twist

**Scoring System:**
Determine how points are awarded for various in-game actions, such as eating pellets or consuming ghosts.
Define any bonus point opportunities.

**Game States:**
Describe the various game states, including start screens, gameplay, level transitions, and game over screens.

**User Interface:**
Create the user interface elements, such as the score display, lives remaining, and level indicator.

**Audio:**
The famous Pac-Man® music will be reused as part of our project, moreover the famous "wakka-wakka" sound that plays when the character eats a pellet will be added to the game.     The song playing when you get caught by a ghost will be implemented.    
We will add the game-over and the level up sounds. 

**Input Controls:**
The player will be able to move the character using a keyboard (peut-être ajouter un support joystick)

**Collision Detection:**
Implement precise collision detection between Pac-Man, ghosts, and other game objects.

**Win and Lose Conditions:**
The player wins when every pellets have been eaten, the player loses a life whenever he gets caught by a ghost. 

**High Scores:**
Include a high score system and display the top scores on a leaderboard.

**Game Settings:**
Provide options for configuring game settings, such as difficulty levels and controls.

**Save and Load:**
If applicable, outline the ability to save and load game progress.

**Bug Testing:**
Detail the testing procedures and expected behavior to identify and fix any bugs or glitches in the game.

**Packaging and Distribution:**
Plan how the game will be packaged, distributed, and made available to players.

#### 3.2 New Game Mechanics

### 4 - Non-Functional Requirements 

**Performance:**
Define the expected frame rate and responsiveness of the game.
Specify any performance optimizations, such as minimizing CPU and memory usage.

**Compatibility:**
Ensure that the game runs smoothly on a variety of x86-based systems and is compatible with different DOSBox configurations.

**Platform and Environment:**
Clarify the specific versions and configurations of DOSBox and x86 architecture to be supported.
Specify any system requirements for the game to run effectively.

**User Interface Design:**
Describe the overall user interface design, including the menu system, fonts, and graphical elements.
Ensure that the user interface is user-friendly and responsive.

**Accessibility:**
Consider accessibility features to make the game usable by a wide range of players, including those with disabilities.
Specify keyboard controls that are easy to use.

**Security:**
Address security concerns, such as protecting the game from hacks, cheats, or unauthorized access.

**Scalability:**
Define how the game handles different screen resolutions and window sizes.
Ensure that the game's graphics and text remain clear and functional on a variety of displays.

**Localization:**
Outline plans for translating the game's text and instructions into different languages if needed.
Ensure that the game can handle different character sets and text encodings.

**Data Storage and Backup:**
Describe how player progress and high scores are stored and backed up.
Ensure data integrity and recovery mechanisms.

**Resource Management:**
Address memory management and resource allocation to prevent memory leaks and crashes.

**Testing and Quality Assurance:**
Specify the testing approach, including the types of testing (e.g., unit testing, integration testing, user testing) and the criteria for success.

**Documentation and Support:**
Document the codebase, game mechanics, and development process.
Provide user guides and support documentation for players.

**Maintainability and Extensibility:**
Ensure that the codebase is well-structured and maintainable for future updates or modifications.
Consider the ease of adding new features or content to the game.

**Legal and Licensing Considerations:**
Ensure compliance with any legal requirements related to intellectual property and trademarks when using the Pac-Man brand.

**Project Schedule and Deadlines:**
Define the project timeline and milestones to meet development goals and release deadlines.

**Resource Availability:**
Specify the availability of hardware, software, and development tools required for the project.

**Team Collaboration:**
Outline the collaboration and communication procedures for team members working on the project.

### 5 - Dependencies

### 6 - Testing Requirements

### 7 - Constraints and Assumptions 
Copyright Namco, Pac-man is a trademark  


### 8 - Risks and Mitigation Strategies

### 9  - Appendix

Pac-Man® :  
Assembly language :     
Emulator :  
x86 :   
DosBox :    
maze action game :  




