# Functional Specification Team-6

| | |
| ----- | ----- |
| Author | Thibaud Marlier|
| Team | Team 6 |
| Reviewer(s) | Rémy CHARLES, Manech LAGUNES |
| Created on | 11/06/2023 |
| Last updated | 11/10/2023 |

### Table of content :
<details><summary> Click to expand </summary>

- [Functional Specification Team-6](#functional-specification-team-6)
    - [Table of content :](#table-of-content-)
  - [1 - Introduction](#1---introduction)
    - [1.1 - Pac-Man®](#11---pac-man)
    - [1.2 - Assembly language](#12---assembly-language)
    - [1.3 - Our passion](#13---our-passion)
  - [2 - Project Scope and Obectives](#2---project-scope-and-obectives)
    - [2.1 - Scope](#21---scope)
    - [2.2 - Objectives](#22---objectives)
    - [2-3 - Project Schedule and Deadlines](#2-3---project-schedule-and-deadlines)
  - [3 - Goals and Non-goals](#3---goals-and-non-goals)
    - [3.1 - Goals](#31---goals)
    - [3.2 - Non-goals](#32---non-goals)
  - [3 - Functional Requirements](#3---functional-requirements)
    - [3.1 - Basic Game Mechanics:](#31---basic-game-mechanics)
    - [3.2 - New Game Mechanics](#32---new-game-mechanics)
      - [3.2.1 - Essential new game mechanics](#321---essential-new-game-mechanics)
      - [3.2.2 - Potential new game mechanics](#322---potential-new-game-mechanics)
  - [4 - Non-Functional Requirements](#4---non-functional-requirements)
  - [5 - Acceptance \& Testing Requirements](#5---acceptance--testing-requirements)
    - [5.1 - Acceptance:](#51---acceptance)
    - [5.2 - Testing requirements:](#52---testing-requirements)
  - [6 - Constraints](#6---constraints)
    - [6.1 - Technical Constraints](#61---technical-constraints)
    - [6.2 - Resource constraints](#62---resource-constraints)
    - [6.3 - Time Constaints](#63---time-constaints)
    - [6.4 - Learning Assembly](#64---learning-assembly)
    - [6.5 - Testing constraints](#65---testing-constraints)
    - [6.6 - Legal constraints](#66---legal-constraints)
  - [7 - Risks](#7---risks)
    - [7.1 - Technical Risks](#71---technical-risks)
    - [7.2 - Resource Risks](#72---resource-risks)
    - [7.3 - Testing Challenges](#73---testing-challenges)
  - [8 - Dependencies](#8---dependencies)
  - [9 - Appendix](#9---appendix)
  - [10 - Glossary](#10---glossary)
   
</details>

## 1 - Introduction

### 1.1 - [Pac-Man®](#11---pac-man®)
The Pac-Man video game was released in 1980. It is a maze action game developed by Namco, originally for arcades. The player controls Pac-Man, who is chased by four different ghosts in a maze. The player's goal is to eat every dot in the maze to complete the level and move on to the next one.
But there's a twist: large flashing dots, named "Power Pellets", turn the ghosts blue, making them vulnerable to the player and gives bonus points to him/her.  
This is a simple arcade game originally designed for childrens and teenagers.  
The player has to accumulate as many points as possible until he runs out of lives.

![Alt text](https://www.capitalkoala.com/project/public/media//pac-man-jeu-video.jpg)

### 1.2 - [Assembly](#10---glossary) language
[Assembly](#10---glossary) is a low-level programming language, created in 1947, closely related to the architecture of a CPU. Each [Assembly](#10---glossary) language instruction corresponds to a specific operation that the CPU can perform, such as arithmetic calculations, data movement, and control flow. [Assembly](#10---glossary) is used to write programs that interact directly with a computer's hardware and control its operations. [Assembly](#10---glossary) is specific to a particular CPU architecture, and code written for one type of CPU may not be compatible with another.

### 1.3 - Our passion
We have a deep appreciation for the history of video games and we are  particularly fascinated by the arcade era. We discovered Pac-Man in our childhood and became captivated by its simplicity and challenging gameplay. We are computer science students who are intrigued by the technical aspects of classic arcade games.        
We are willing to recreate the game in a challenging way, with [Assembly](#10---glossary).          
We are willing to push ourselves and make the version of Pac-Man® we always dreamed of.        
We are willing to give our best while keeping the original and timeless format of Pac-Man®


## 2 - Project Scope and Obectives

### 2.1 - Scope
The scope of this project is to recreate the classic [Pac-Man®](#11---pac-man®) , using [Assembly](#10---glossary) language on [x86](#10---glossary) on [DOSbox](#10---glossary).

### 2.2 - Objectives
The objectives of this project are simple; we must recreate Pac-Man® using [Assembly](#10---glossary) language on an [emulator](#10---glossary).
The game must be as enjoyable as the original, reusing the concept of the maze action game, while adding a new and original twists to it.
The objectives of this document are to provide an overview of the project and what needs to be accomplished in the next few weeks. It will be used as a 'placeholder' for our ideas, as well as for the client to understand and gain insight into what the game will resemble by the end of the project.

### 2-3 - Project Schedule and Deadlines
| Deadlines|          | Details  |
|----------|----------|----------|
| 13/11/2023 | 1:30pm | Functional specification
| 27/11/2023 | 1.30pm | Technical specification
| 08/12/2023 | 5.pm   | Test plan
| 11/12/2023 | 5.pm   | Working prototype
| 21/12/2023 | 5.pm   | Final product


## 3 - Goals and Non-goals
### 3.1 - Goals
- Recreate Pac-Man using Assembly language.
- Create an enjoyable game for the user, while retaining the original concept of the game while addidng new and original twists.
- Implement basic mechanics of the original game.
- Add new mechanics to the game.
- Ensure nostalagia of old gamers that used to play to the game.
- Create a passion to new players.
- Ensure that the game isn't boring by adding fun and modern features.
- Ensure a stable performance of the game.
- Create a great experience for the player.


### 3.2 - Non-goals
- Multiplayer: isn't in our project, a 2 player mode won't be on the final game.
- Sales: The game will not be developed for commercial purposes; it will be created solely for enjoyment and entertainment.
- Additional game modes: except from the other maze design, there won't be other gamemodes added to the game as we don't want to get too far of the maze action game genre.
- Unentertainment: the game must be entertaining and not boring.
- Implement new physics: too time consuming and won't fit the x86 architecture.

## 3 - Functional Requirements
In this section, we will go down the functional requirements of this project, it will include the basic game mechanics that are already into the original Pac-Man game, the features that we will implement first, and those that we will add if we have time to do so.
### 3.1 - Basic Game Mechanics:

| **Mechanic** | **Description** |
| --- | --- |
| Level progression | Once the player has collected all the pellets available in the maze, a new level will appear, and bonus points will be awarded to the player. |
| Player movement | The player must be able to control its character |
| Ghost AI | Ghosts have to follow a specific pattern that will be created by the developers. |
| Pellet collection | The character has to collect pellet in order to win the game, and not forget the "Power Pellets" that gives the ability to eat the Ghosts to the player. |
| Maze Design | The layout will be based on the original Pac-Man® game. The maze dimension will be the same as the original one from Pac-Man® |
| Scoring System | Points will be determined based on the original Pac-Man® game point system  |
| Game States | The game will include a start menu with "Start Game," "Rules," "Options," and "Credits" buttons.  |
| User Interface | We will recreate the original User Interface of Pac-Man®.  
| Audio | The famous "wakka-wakka" sound that plays when the character eats a pellet will be added to the game.The song playing when you get caught by a ghost will be implemented. We will add the game-over and the level up sounds. |
| Input Controls | The player will be able to move the character using a  QWERTY keyboard (WASD) and the directional arrows |
| Collision Detection | We will implement collision detection between Pac-Man, ghosts, and other game objects.|
| Win and Lose Conditions | The player wins when every pellets have been eaten, the player loses a life whenever he gets caught by a ghost. |
| High Scores | We will include the original leaderboard, that stores the high scores of the player. |
| Game Settings | Audio settings could be tweaked by the player in the setting section. |
| Pause button | Player should be able to pause the game. |
| Life system | The player starts the game with 3 lives, each 10 000  points, the player earns an additional life. |      

### 3.2 - New Game Mechanics
#### 3.2.1 - Essential new game mechanics
These new mechanics are those that we will try to prioritize the implementation into the game.

| **New Mechanic** | **Description** |
| --- | --- |
| UI modification |Adding some modification to the original UI in order to make it our own way, and add something original to the game.  |
| New maze design | Implementation of a new maze that will be into a different section of the original maze design (like a second gamemode). |
| Character's color | Adding new color customization to the main character of the game, the player must be able to choose it. |
| Game state | Changing the UI and the maze design, obligates us to create whole new game states |
| New Bonuses | Implementing the concept of the original bonuses that appears each level (cherry, peach...), but we will add our own spice to it |
| Leaderboard | Providing the ability to the player to score his high scores into a leaderboard|
| Rule section  | Adding a rule section in the menu to explain new players what the rules of the game are. |

#### 3.2.2 - Potential new game mechanics

These features will be added once every other features have been added to the game, they could be implemented later, in future updates.

| **Potential New Mechanic** | **Description** |
| --- | --- |
| New powers | Power pellets will be giving new powers, such as invicibility (transparency), killing all Ghost direclty (send them back to their base), for instance |
| skins | Adding the possibility for the player to add even more customization to the character |
| Point milestones | Once the player reaches a certain amount of point in game, he could receive some gift, such as cosmetics, new colors for the character... |

Our goal is to add as much of these features as possible, we will try and put them all into the game.

## 4 - Non-Functional Requirements

| **Requirement** | **Description** |
| --- | --- |
| **Performance** | The game must run smoothly on a variety of [x86](#10---glossary)-based systems and configurations.|
| **Hardware Compatibility** | Specifically designed for compatibility with the intended hardware, the game must be compatible with the specific hardware (16-bit [x86](#10---glossary) CPU from 1982).|
| **Memory Usage** | Efficient memory usage is crucial, especially for systems with limited memory capacity. <br> Aim for optimized memory utilization to avoid leaks and overloads.|
| **Control Responsiveness** | Game controls must be responsive and precise, offering a good user experience.|
| **Durability** | The game should be robust, not prone to crashes or major bugs during execution.|

## 5 - Acceptance & Testing Requirements
### 5.1 - Acceptance:
The product will be considered done when:
- all the main pacmans features will be there.
- no major bugs will be encountered by the player.
- the main menu will be usable.
- the gameplay will be balanced (not too hard, but not too easy).
- the player will be able to go from a level to another by finishing the game.

### 5.2 - Testing requirements:
Test cases: unit tests, integration tests and system tests.
Success criteria: clearly state the criteria that will indicate whether or not a test is successful or not.
Backups and recovery test: must ensure that backups and recovery tests are working correctly to prevent data loss.
## 6 - Constraints
### 6.1 - Technical Constraints
Assembler comptability: code must be compatible with the [x86](#10---glossary) architecture and the [NASM](#10---glossary) assembler

[DOSbox](#10---glossary) [emulator](#10---glossary): The game must run as smooth as possible on the [emulator](#10---glossary), this pushes data limitations, framerate limitations...

### 6.2 - Resource constraints
Memory limitations: [Assembly](#10---glossary) language is memory intensive and time-consuming, moreover [DOSbox](#10---glossary) limitations must be taken into account to avoid crashed and performance issues.

### 6.3 - Time Constaints
Schedule : Deadlines are tight and we must comply to the contractor needs within these time limits, adding new mechanics will be challenging.

### 6.4 - Learning [Assembly](#10---glossary)
[Assembly](#10---glossary) requires deep understanding of how a machine works, learning to code is time consuming and is a real challenge, it will impact the speed of the development.

### 6.5 - Testing constraints
Debugging the code and testing the game will be necessary but are both time consuming, however it is a necessary step of the development phase.

### 6.6 - Legal constraints
Copyrights: Pac-Man® is under copyright, therefore, our version will not be legally able to be release online to make a profit out of it. It will stay an internal project that won't be release on the internet for legal purposes.  

## 7 - Risks
### 7.1 - Technical Risks
[Assembly](#10---glossary) language is low-level and complex, which increases the risk of errors and bugs. This complexity can lead to longer development times and difficulties in debugging and maintenance.

### 7.2 - Resource Risks
[Assembly](#10---glossary) programming often requires careful management of resources like memory and processing power, especially if the game is intended for older or limited-capability hardware.

### 7.3 - Testing Challenges
Testing an [Assembly](#10---glossary) language program can be more difficult than testing higher-level languages, due to the lack of advanced debugging tools and the intricacies of low-level code.
## 8 - Dependencies

* [NASM](#10---glossary) Assembler: The project depends on the [NASM](#10---glossary) assembler for [x86](#10---glossary) architecture to run and debug the code.
* [DOSbox](#10---glossary) [emulator](#10---glossary): The game's testing relies on the [emulator](#10---glossary), comptability is crucial.

* [Assembly](#10---glossary): The project relies on [Assembly](#10---glossary) language capabilities and complexity, it must be taken into account when developing.

* Documentation: This project relies on the documentation that can be found online about all those elements, such as Assembly documentation, DOSBox documentation, etc...

* Pac-Man® : This project relies on the original Pac-Man®  game.



## 9 - Appendix
Gantt diagram breaking down the deadlines of the project.
![Alt text][def]


## 10 - Glossary
**Pac-Man®**: a 1980's video game created by Namco for Arcades, it is a maze action game, where the player must eat every pellets without getting hit by ghosts in order to win the game.  

**maze action game**: genre of video game that involves navigating into a maze or labyrinth like environment while doing action oriented tasks.    

**DOSbox**: Using DOSbox emulator is mandatory for this project, we have to comply to the emulator requirement in order to run the game.  
This means data consumption analysis in order for the game not to crash, code optimization...  
Understanding how the emulator works and pre-planning.

**Emulator**: software that replicates the behavior of a specific machine, into another machine.

**NASM**: Assembler for x86 architecture, using it to run our code in the future will be necessary.

**Assembly**: Language that we will be using, low-level and time consuming, these parameters are to take into account.

**x86**: x86 architecture refer to a family of Intel processors architecture that appeared in the 1980's    

[def]: image/gantteam6.png