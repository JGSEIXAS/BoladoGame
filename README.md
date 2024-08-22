Bolado - Colorful World Game

https://youtu.be/ZPTJcxwiSbo

Bolado is a colorful world game where you play as a character tasked with bringing colors to a black and white world. Beware of the self-proclaimed "whities" who don't like the colorful transformation! Use your mouse to avoid them and bring life to the world.

Files and Components
main.lua
The main entry point of the game. It handles game states, player interactions, and updates. This file contains the core gameplay loop and is responsible for managing the game's various states, such as the menu, settings, running, ended, win, and credits states.

components/Enemy.lua
This file defines the Enemy class, which represents the antagonistic characters in the game. The class includes methods for enemy movement, collision detection, and rendering.

components/Button.lua
The Button class is defined in this file and is responsible for creating interactive buttons in the game. It includes methods to handle button presses, such as checking if a button was clicked and executing associated functions.

Bolado/sounds
This folder contains the game's sound files in various states, including menu, game, win, and lost. These sound effects enhance the game experience and add to the ambiance of different game states.

Bolado/components
This folder houses various components used in the game, such as the Enemy and Button classes. These components help modularize the code and promote better code organization.

Design Choices
Modular Structure
The game's code is organized into separate files and folders for better readability and maintainability. Each component is defined in its own file, making it easier to manage and understand the different aspects of the game.

Game States
The game employs different states (menu, settings, running, etc.) to control the flow of gameplay. These states are managed through the changeGameState function, allowing for smooth transitions between different parts of the game.

Button Interaction
Buttons play a significant role in the game's interaction. The Button class provides a reusable way to create and handle interactive buttons in various game states, enhancing the user experience.

Music and Sound
The game utilizes background music and sound effects to immerse players in the game world. Different music tracks are played in different states, contributing to the atmosphere and enhancing the overall gameplay.

How to Play
Launch the game using the Love2D framework.
In the game's menu, you can choose to start the game, access settings, view credits, or exit the game.
Use your mouse to control the character and avoid the "whities" that try to stop you from bringing color to the world.
Collect points as you progress, and watch out for level thresholds that introduce more challenges.
Reach a certain point threshold to win the game or lose if you're caught by the "whities."
Explore the settings to adjust the game's volume, change your character's skin color, toggle fullscreen mode, or return to the main menu.
The credits section acknowledges the creator of the game, Gabriel Seixas.
Credits
This game was created by Gabriel Seixas. Thank you for playing and bringing color to the world!
