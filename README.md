# 🌈 Bolado — Colorful World Game

[🎥 Watch the gameplay!](https://youtu.be/ZPTJcxwiSbo)

**Bolado** is a colorful world game where you play as a character tasked with bringing colors to a black and white world. Beware of the self-proclaimed **"whities"** who dislike the colorful transformation! Use your mouse to avoid them and bring life to the world.

---

## 🗂️ Files and Components

📂 Bolado/
├── main.lua
├── 📂 components/
│ ├── Enemy.lua
│ └── Button.lua
├── 📂 sounds/
│ ├── menu.ogg
│ ├── game.ogg
│ ├── win.ogg
│ └── lost.ogg

markdown
Copiar
Editar


- **`main.lua`**  
  The main entry point of the game. It manages game states, player interactions, and updates. Responsible for the core gameplay loop and managing states: menu, settings, running, ended, win, and credits.

- **`components/Enemy.lua`**  
  Defines the *Enemy* class, which represents the antagonists in the game. Contains methods for movement, collision detection, and rendering.

- **`components/Button.lua`**  
  Defines the *Button* class, responsible for creating interactive buttons. Includes methods for detecting clicks and executing associated functions.

- **`sounds/`**  
  Contains sound files for various states: menu, gameplay, win, and lose. These sound effects enhance the experience and atmosphere.

---

## 🎨 Design Choices

- **📦 Modular Structure**  
  The code is organized into separate files and folders for better readability and maintainability.

- **🎮 Game States**  
  The game flow is controlled through different states (menu, settings, running, etc.) using the `changeGameState` function for smooth transitions.

- **🖱️ Button Interaction**  
  The *Button* class allows reusable button creation and management, improving the user experience.

- **🎵 Music and Sound**  
  Background music and sound effects immerse players in the game world, with different tracks for each state.

---

## ▶️ How to Play

1. **Run the game using the Love2D framework.**
2. **From the main menu**, you can:
   - Start the game
   - Access settings
   - View credits
   - Exit the game
3. **Use your mouse** to control the character and avoid the *whities*.
4. **Collect points** as you progress and face increasing challenges.
5. **Win the game** by reaching the target score or **lose** if you get caught.
6. **In the settings menu**, adjust volume, change the character's skin color, toggle fullscreen mode, or return to the main menu.

---

## 👨‍💻 Credits

This game was created by **Gabriel Seixas**.  
Thank you for playing and helping bring color to the world! ✨
