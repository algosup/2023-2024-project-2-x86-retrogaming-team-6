# Technical Specification: Team 6's Pac-Man® Project

| | |
| ----- | ----- |
| Author | Rémy CHARLES|
| Team | Team 6 |
| Reviewer(s) |  |
| Created on | 11/13/2023 |
| Last updated | 11/13/2023 |

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
Detail the necessary hardware and software specifications for the project. Include minimum and recommended requirements.

### 2.2 Programming Language and Tools
Discuss the rationale behind choosing Assembly language, NASM, and DOSBox. Include a diagram to illustrate how these tools interact. `[ToolsInteractionDiagram]`

## 3. System Architecture
### 3.1 High-Level Architecture
Provide an overview of the system's architecture. A block diagram showing the main components would be helpful. `[SystemArchitectureDiagram]`

### 3.2 Component Interaction
Describe how different components of the system will communicate and interact with each other. Include a flowchart if necessary. `[ComponentInteractionFlowchart]`

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

