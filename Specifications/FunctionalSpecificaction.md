# Functional Specification Team-6

| | |
| ----- | ----- |
| Author | Thibaud Marlier|
| Team | Team 6 |
| Reviewer(s) | Rémy CHARLES |
| Created on | 11/06/2023 |
| Last updated | 11/09/2023 |

### Table of content : 
<details><summary> Click to expand </summary>

- [Functional Specification Team-6](#functional-specification-team-6)
    - [Table of content :](#table-of-content-)
    - [1 - Introduction](#1---introduction)
      - [1.1 Pac-Man®](#11-pac-man)
      - [1.2 Assembly language](#12-assembly-language)
      - [1.3 Our passion](#13-our-passion)
    - [2 - Project Scope and Obectives](#2---project-scope-and-obectives)
      - [2.1 - Scope](#21---scope)
      - [2.2 - Objectives](#22---objectives)
    - [3 - Functional Requirements](#3---functional-requirements)
      - [3.1 Basic Game Mechanics:](#31-basic-game-mechanics)
      - [3.2 New Game Mechanics](#32-new-game-mechanics)
    - [4 - Non-Functional Requirements](#4---non-functional-requirements)
    - [5 - Dependencies](#5---dependencies)
    - [6 - Testing Requirements](#6---testing-requirements)
    - [7 - Constraints and Assumptions](#7---constraints-and-assumptions)
    - [8 - Risks and Mitigation Strategies](#8---risks-and-mitigation-strategies)
    - [9  - Appendix](#9----appendix)
    - [10 - Glossary](#10---glossary)
    
</details>

## 1 - Introduction 

### 1.1 Pac-Man®
The Pac-Man video game was released in 1980. It is a maze action game developed by Namco, originally for arcades. The player controls Pac-Man, who is chased by four different ghosts in a maze. The player's goal is to eat every dot in the maze to complete the level and move on to the next one.
But there's a twist: large flashing dots, named "Power Pellets", turn the ghosts blue, making them vulnerable to the player and gives bonus points to him/her.  
This is a simple arcade game originally designed for childrens and teenagers.  
The player has to accumulate as many points as possible until he runs out of lives. 

![Alt text](https://www.capitalkoala.com/project/public/media//pac-man-jeu-video.jpg)

### 1.2 Assembly language
Assembly is a low-level programming language, created in 1947, closely related to the architecture of a CPU. Each assembly language instruction corresponds to a specific operation that the CPU can perform, such as arithmetic calculations, data movement, and control flow. Assembly is used to write programs that interact directly with a computer's hardware and control its operations. Assembly is specific to a particular CPU architecture, and code written for one type of CPU may not be compatible with another. 

### 1.3 Our passion 
We have a deep appreciation for the history of video games and we are  particularly fascinated by the arcade era. We discovered Pac-Man in our childhood and became captivated by its simplicity and challenging gameplay. We are computer science students who are intrigued by the technical aspects of classic arcade games.         
We are willing to recreate the game in a challenging way, with Assembly.           
We are willing to push ourselves and make the version of Pac-Man® we always dreamed of.         
We are willing to give our best while keeping the original and timeless format of Pac-Man®


## 2 - Project Scope and Obectives

### 2.1 - Scope 
The scope of this project is to recreate the classic Pac-Man® , using Assembly language on x86 on DosBox.

### 2.2 - Objectives 
The objectives of this project are simple, we must recreate Pac-Man®, using the Assembly language on an emulator.   
The game must be as enjoyable as the original game, re-using the idea of the maze action game, while twisting it a bit to add something new and original to it. 
The objectives of this document are to get an overview of the project and what needs to be done during the next few weeks. It will be use as a "placeholder" for our ideas. As well as for the cient to understand and have a insight of what the game will ressemble by the end of the project. 

### 2-3 Project Schedule and Deadlines
| Deadlines|          | Details  | 
|----------|----------|----------|
| 13/11/2023 | 1:30pm | Functional specification
| 27/11/2023 | 1.30pm | Technical specification
| 08/12/2023 | 5.pm   | Test plan 
| 11/12/2023 | 5.pm   | Working prototype 
| 21/12/2023 | 5.pm   | Final product 

## 3 - Functional Requirements

### 3.1 Basic Game Mechanics:

| **Mechanic** | **Description** |
| --- | --- |
| Player movement | The player must be able to control its character |
| Ghost AI | Ghosts have to follow a specific pattern that will be created by the developers. |
| Pellet collection | The character has to collect pellet in order to win the game, and not forget the "Power Pellets" that gives the ability to eat the Ghosts to the player. |
| Level progression | Once the player has collected every pellets available on the maze, a new level shall appear and bonus points will be given to the player. |
| Maze Design | The layout will be based on the original Pac-Man® game. The maze dimension will be the same as the original one from Pac-Man® |
| Scoring System | Points will be determined based on the original Pac-Man® game point system  |
| Game States | The game will include a start menu including "start game", "rules", "options" and "credit" buttons.  |
| User Interface | We will recreate the original User Interface of Pac-Man®.  
| Audio | The famous "wakka-wakka" sound that plays when the character eats a pellet will be added to the game.The song playing when you get caught by a ghost will be implemented. We will add the game-over and the level up sounds. |
| Input Controls | The player will be able to move the character using a  QWERTY keyboard (WASD) and the directional arrows (peut-être ajouter un support joystick) |
| Collision Detection | We will implement collision detection between Pac-Man, ghosts, and other game objects.|
| Win and Lose Conditions | The player wins when every pellets have been eaten, the player loses a life whenever he gets caught by a ghost. |
| High Scores | We will include the original leaderboard, that stores the high scores of the player. |
| Game Settings | Audio settings could be tweaked by the player in the setting section.
 |



### 3.2 New Game Mechanics
#### 3.2.1 Essential new game mechanics 

| **New Essential Mechanic** | **Description** |
| --- | --- |
|  |  |

#### 3.2.2 Potential new game mechanics

| **Potential New Mechanic** | **Description** |
| --- | --- |


## 4 - Non-Functional Requirements 

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

**Resource Management:**
Address memory management and resource allocation to prevent memory leaks and crashes.

**Documentation and Support:**
Document the codebase, game mechanics, and development process.
Provide user guides and support documentation for players.

**Legal and Licensing Considerations:**
Ensure compliance with any legal requirements related to intellectual property and trademarks when using the Pac-Man brand.


## 5 - Dependencies

## 6 - Acceptance & Testing Requirements

## 7 - Constraints
Copyright Namco, Pac-man is a trademark  

## 8 - Risks


## 9  - Appendix



## 10 - Glossary
Pac-Man® :  
Assembly language :     
Emulator :  
x86 :   
DosBox :    
maze action game :  
