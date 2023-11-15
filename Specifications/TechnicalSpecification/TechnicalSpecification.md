# Technical Specification: Team 6's Pac-Man® Project

| | |
| ----- | ----- |
| Author | Rémy CHARLES|
| Team | Team 6 |
| Reviewer(s) |  |
| Created on | 11/13/2023 |
| Last updated | 11/15/2023 |

## Table of Contents

<details><summary> Click to expand </summary>

- [Technical Specification: Team 6's Pac-Man® Project](#technical-specification-team-6s-pac-man-project)
  - [Table of Contents](#table-of-contents)
  - [1. Introduction](#1-introduction)
    - [1.1 Project Background](#11-project-background)
    - [1.2 Document Purpose](#12-document-purpose)
  - [2. Technical Overview](#2-technical-overview)
    - [2.1 System Requirements](#21-system-requirements)
    - [2.2 Programming Language and Tools](#22-programming-language-and-tools)
  - [3. System Architecture](#3-system-architecture)
    - [3.1 High-Level Architecture](#31-high-level-architecture)
    - [3.2 Component Interaction](#32-component-interaction)
  - [4. Detailed Component Design](#4-detailed-component-design)
    - [4.1 Game Engine](#41-game-engine)
    - [4.2 User Interface](#42-user-interface)
  - [5. Data Management](#5-data-management)
    - [5.1 Data Storage](#51-data-storage)
    - [5.2 Memory Optimization](#52-memory-optimization)
  - [6. Interface Design](#6-interface-design)
    - [6.1 Input Controls](#61-input-controls)
    - [6.2 Audio and Visual Elements](#62-audio-and-visual-elements)
  - [7. Security and Privacy Considerations](#7-security-and-privacy-considerations)
  - [8. Testing Strategy](#8-testing-strategy)
    - [8.1 Testing Phases](#81-testing-phases)
    - [8.2 Success Criteria](#82-success-criteria)
  - [9. Maintenance and Support](#9-maintenance-and-support)
  - [10. Appendix](#10-appendix)
  - [11. Glossary](#11-glossary)

</details>

## 1. Introduction
### 1.1 Project Background
The Pac-Man® Project is an ambitious endeavor to recreate the iconic arcade game Pac-Man® using Assembly language on an x86 architecture. Inspired by the classic game first released in 1980 by Namco, our project aims not only to replicate the original gameplay experience but also to introduce new features and mechanics that enhance the game while respecting its nostalgic essence.

This project emerged from our team's passion for retro gaming and the technical challenges it presents. The choice of Assembly language, although complex, allows us to delve deep into low-level programming and understand the inner workings of classic arcade games. Our goal is to recreate Pac-Man® in a way that stays true to its original form while pushing our technical abilities and providing a fresh perspective on a beloved classic.

We aim to create a version of Pac-Man® that is both familiar to those who cherished the original and intriguing to new players. This involves maintaining the core mechanics of the original game, such as the maze navigation and ghost-chasing dynamics, while integrating new elements like updated graphics, additional levels, and enhanced user interfaces.

The project's development is supported by the use of the NASM assembler and the DOSBox emulator, ensuring compatibility with modern systems while maintaining the feel of playing on a vintage machine. Through this project, we not only pay homage to a cornerstone of video game history but also sharpen our skills in a challenging and rewarding programming environment.

<img src="img/EvolutionProjectDiagram.png">

### 1.2 Document Purpose

This document serves as the Technical Specification for Team 6's Pac-Man® project. Its primary purpose is to provide a comprehensive technical roadmap that outlines the project's software design and architecture. This document is intended to guide the development team through the detailed phases of coding, testing, and deployment, ensuring that all technical aspects of the project align with the predefined objectives and requirements.

Key functions of this document include:

- **Detailing Technical Requirements**: It specifies the technical requirements for the project, including programming languages, tools, and hardware compatibility. This ensures that all team members are aware of the technical environment and constraints.

- **Guiding Development Process**: By outlining the architecture, component design, and data management strategies, this document serves as a reference for developers during the implementation phase, ensuring consistency and adherence to best practices.

- **Facilitating Communication**: The document acts as a communication tool among team members, stakeholders, and reviewers, providing clarity and uniform understanding of the project's technical approach.

- **Enabling Scalability and Maintenance**: By presenting a clear view of the system architecture and component interactions, it supports future scalability and maintenance efforts. This foresight is crucial for accommodating potential expansions or modifications.

- **Assisting in Testing and Validation**: The document outlines the testing strategy and deployment plan, guiding the quality assurance process and ensuring that the final product meets the desired performance and functionality standards.

This document is intended for use by the software development team, project managers, and any stakeholders involved in the project. It is a dynamic document and will be updated as the project progresses to reflect any changes in the technical approach or project scope.

## 2. Technical Overview
### 2.1 System Requirements

The system requirements for Team 6's Pac-Man® project are specifically tailored to ensure compatibility and optimal performance for the game's development and execution. These requirements are fundamental to achieving the technical objectives of the project while working within the constraints of our chosen development environment.

Hardware requirements:
- **Processor**: Must support x86 architecture, with a preference for a 16-bit processor to closely emulate the original game's environment.
- **Memory**: Minimum of 512 KB RAM, with 1 MB or higher recommended for better performance.
- **Storage**: A minimum of 10 MB of free disk space for installing the game and storing saved game data.
- **Input Devices**: Keyboard interfacing is essential for gameplay control. Optional support for additional input devices like gamepads or joysticks can be considered for enhanced player experience.

Software Requirements:
- **Operating System**: DOSBox emulator is a mandatory requirement to provide a DOS environment on modern operating systems. This allows for accurate emulation of the game's intended runtime environment.
- **Programming Language**: NASM (Netwide Assembler) is required for Assembly language development, chosen for its direct compatibility with x86 architecture and efficiency in handling low-level operations.
- **Development Tools**: A robust text editor (such as VSCode) for coding, integrated with version control systems like Git for source code management. Compatibility with debugging tools that support Assembly language, NASM, and DOSBox integration is crucial for efficient development and troubleshooting.

Compatibility:
- The game should be executable on both modern and legacy systems meeting the above hardware specifications. Emphasis on backward compatibility is essential to maintain the authenticity of the gameplay experience.
- Ensuring robustness and performance consistency within the DOSBox emulator is critical, as it forms the backbone of our development and testing environment.

These system requirements are designed with a focus on the technical nuances and constraints specific to low-level programming in Assembly language and the emulation of a classic gaming environment. Compliance with these requirements will ensure that the Pac-Man® project is developed with precision, catering to both the nostalgic appeal of the original game and the technical prowess expected in modern software engineering.

### 2.2 Programming Language and Tools
For the development of Team 6's Pac-Man® project, we have selected a set of programming tools and a language that align with our project's technical goals and the necessity for precise low-level programming control.

NASM (Netwide Assembler):
- **Role**: Chosen for its direct compatibility with x86 architecture, NASM is our assembler for writing Assembly language code. It is pivotal for developing the intricate low-level functionalities of the game.
- **Advantages**: NASM is renowned for its efficiency and flexibility, essential in executing complex programming tasks inherent in game development, such as memory management and hardware interaction.
- **Application**: NASM will be utilized for the entire coding process, encompassing the implementation of game mechanics, graphics rendering, and user input handling.

DOSbox Emulator:
- **Role**: DOSBox is essential for emulating a DOS environment, allowing us to test and run the game in a setting that mirrors the original hardware conditions.
- **Advantages**: By using DOSBox, we can ensure compatibility with modern operating systems while maintaining the authentic feel and constraints of the DOS-based gameplay experience.
- **Application**: It serves as the primary platform for testing, debugging, and demonstrating the game, providing a consistent and accurate emulation of the game's performance.

Development Environment - Visual Studio Code (VSCode):
- **Primary Tool**: VSCode will be the main development environment for the project, offering a comprehensive and integrated platform for code writing, editing, and debugging.
- **Features**: VSCode is selected for its extensive feature set, including advanced syntax highlighting, intelligent code completion, integrated version control with Git, and debugging support. These features enhance development efficiency and collaboration.
- **Extensions**: VSCode’s support for extensions allows us to customize the environment to our specific needs, including NASM syntax support and direct integration with DOSBox for seamless testing and debugging.

Additional Tools:
- **Build and Automation Scripts**: We will utilize custom scripts to automate repetitive tasks like building and deploying the game, enhancing development efficiency.
- **Performance Profiling**: Tools integrated into VSCode will be used to monitor and optimize the game's performance, particularly focusing on CPU and memory usage to ensure smooth gameplay.

`[ToolsInteractionDiagram]`

## 3. System Architecture
### 3.1 High-Level Architecture

The high-level architecture of Team 6's Pac-Man® project is designed to efficiently handle the complexities of a game developed in Assembly language while ensuring fidelity to the original Pac-Man® experience. The architecture is structured to promote modularity, scalability, and maintainability.

Core Components:
- **Game Engine**: The central component responsible for managing game mechanics, physics, and interactions. It processes input commands, updates game state, and renders the game screen.
- **Rendering Module**: Dedicated to graphics processing, this module handles the rendering of game elements including the maze, Pac-Man®, ghosts, and score display, ensuring adherence to the classic visual style.
- **Input Control System**: Manages player inputs using keyboard or other supported devices. It translates these inputs into actions within the game.
- **Sound Engine**: Responsible for audio processing, including the iconic "wakka-wakka" sound effects and background music, contributing to the game's immersive experience.
- **Memory Management**: Critical for optimizing the game’s performance on the x86 architecture, especially given the constraints of Assembly language programming.

Data Flow:
- **Input to Action**: Player inputs are captured by the Input Control System and relayed to the Game Engine where they influence game dynamics and character movements.
- **Game State Management**: The Game Engine continuously updates the game state based on player actions, game rules, and AI behaviors.
- **Rendering Cycle**: The Rendering Module receives updates from the Game Engine and translates them into visual elements on the screen, ensuring a seamless gaming experience.
- **Audio Feedback**: Sound cues corresponding to game events (like eating pellets or ghost encounters) are triggered by the Sound Engine in sync with the game state.

Integration Points:
- **DOSBox Interface**: The game interfaces with the DOSBox emulator for execution and testing, ensuring compatibility with a wide range of systems.
- **Development and Debugging Tools**: Integration with tools in VSCode, including the debugger and performance profiler, facilitates efficient development and maintenance.

This architecture is designed with a clear separation of concerns, ensuring that each module can be developed, tested, and maintained independently while functioning cohesively as part of the larger system. The modular approach also allows for future enhancements and adaptations with minimal impact on the overall system.

`[SystemArchitectureDiagram]`

### 3.2 Component Interaction

Understanding the interaction between various components of the Pac-Man® game is essential for effective development and integration. This section details how each key component of the system architecture communicates and collaborates to deliver a cohesive gaming experience.

Game Engine and Input Control System:
- **Input Processing**: The Input Control System captures player commands (keyboard or optional gamepad inputs) and sends these inputs to the Game Engine.
- **Action Translation**: The Game Engine interprets these inputs and translates them into corresponding actions for Pac-Man® or game settings (like pause or exit).

Game Engine and Rendering Module:
- **State Rendering**: The Game Engine sends information about the current game state (Pac-Man®'s position, ghost movements, score, etc.) to the Rendering Module.
- **Visual Feedback**: The Rendering Module, in turn, generates the visual representation of the current game state, updating the screen with real-time changes.

Game Engine and Sound Engine:
- **Audio Triggers**: Specific game events handled by the Game Engine (like eating a pellet or a ghost encounter) trigger audio responses.
- **Sound Playback**: The Sound Engine plays the appropriate sound effects and background music, enhancing the game's immersive experience.

Game Engine and Memory Management:
- **Resource Allocation**: The Game Engine works closely with the Memory Management component to efficiently allocate and utilize memory resources, crucial in Assembly language development.
- **Performance Optimization**: Memory Management ensures optimal game performance by preventing memory leaks and managing data storage effectively.

Integration with DOSBox:
- **Execution Environment**: DOSBox provides the necessary DOS environment for running the game, with the Game Engine and other modules operating within this framework.
- **Compatibility Assurance**: The seamless integration with DOSBox ensures that the game is compatible and performs consistently across different hardware and operating systems.

Development and Debugging Tools Integration:
- **Code Development**: The integration with VSCode allows developers to write, edit, and manage Assembly code efficiently.
- **Debugging and Testing**: Tools within VSCode facilitate debugging and performance profiling, allowing developers to identify and resolve issues during development.

This interplay between components ensures that the game operates smoothly, reflecting player interactions in real-time gameplay while maintaining the look and feel of the classic Pac-Man®. The modular design also aids in isolating and addressing issues in specific areas without impacting the entire system.

`[ComponentInteractionFlowchart]`

## 4. Detailed Component Design
### 4.1 Game Engine
Delve into the specifics of the game engine, including algorithms and game mechanics. Diagrams illustrating game logic can be included. `[GameLogicDiagram]`

### 4.2 User Interface
Detail the UI design, including screens and navigation flow. Mockups of the UI screens would be beneficial. `[UIScreenMockups]`

## 5. Data Management
### 5.1 Data Storage
Discuss how game data (like high scores) will be stored and managed.

### 5.2 Memory Optimization
Outline strategies for efficient memory usage, particularly important for Assembly programming.

## 6. Interface Design
### 6.1 Input Controls
Detail the design and implementation of input controls, including keyboard and possible gamepad support.

### 6.2 Audio and Visual Elements
Describe the implementation of audio-visual elements, adhering to the classic feel of Pac-Man®.

## 7. Security and Privacy Considerations
Discuss any potential security or privacy issues, particularly if networked features are planned.

## 8. Testing Strategy
### 8.1 Testing Phases
Outline the different phases of testing, including unit, integration, and system tests.

### 8.2 Success Criteria
Define the criteria for successful testing at each phase.

## 9. Maintenance and Support
Discuss plans for post-launch support, bug fixes, and updates.

## 10. Appendix
Include any additional documentation, code snippets, or resources referenced in the document.

## 11. Glossary
Provide definitions for technical terms used throughout the document to ensure clarity.

