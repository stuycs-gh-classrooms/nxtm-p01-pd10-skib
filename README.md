[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/Mfyqb_T6)
# NeXtCS Project 01
### thinker0: Jed Sloan
### thinker1: Mohammed Ullah
---

### Overview
Your mission is create either:
- Life-like cellular automata [life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), [life-like](https://en.wikipedia.org/wiki/Life-like_cellular_automaton), [demo](https://www.netlogoweb.org/launch#https://www.netlogoweb.org/assets/modelslib/Sample%20Models/Computer%20Science/Cellular%20Automata/Life.nlogo).
- Breakout/Arkanoid [demo 0](https://elgoog.im/breakout/)  [demo 1](https://www.crazygames.com/game/atari-breakout)
- Space Invaders/Galaga

This project will be completed in phases.  
The first phase will be to work on this document. 
* Use markdown formatting.
* For more markdown help
  - [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or
  - [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)


---

## Phase 0: Selection, Analysis & Plan

#### Selected Project: Space Invaders

### Necessary Features
What are the core features that your program should have? These should be things that __must__ be implemented in order to make the program useable/playable, not extra features that could be added to make the program more interesting/fun.

- Player spaceship that can move horizontally and shoot
- Enemies, arranged in rows and columns that move horizontally and shoot down randomly.
- Collision detection for Enemies/Player and bullets
- Health system for the player
- Point system when enemies are destroyed

### Extra Features
What are some features that are not essential to the program, but you would like to see (provided you have time after completing the necessary features. Theses can be customizations that are not part of the core requirements.

- A pause feature
- Way to reset the game
- Powerups such as faster shooting or increased movement speed
- Different types of enemies, with varying speeds, health, and sometimes shooting patterns
  

### Array Usage
How will you be using arrays in this project?

1D Array:
- Store the positions and speeds of the bullets

2D Array:
- Grid of enemies in rows and columns, stores the position, status (alive/dead), and type.


### Controls
How will your program be controlled? List all keyboard commands and mouse interactions.

Keyboard Commands:
- Left arrow/A to move player left
- Right arrow/D to move player right
- Spacebar to fire bullets
- P to pause the game
- R to restart the game

Mouse Control:
- Mouse movement:
- Mouse pressed: Left click will also fire a bullet, right click will activate a power up


### Classes
What classes will you be creating for this project? Include the instance variables and methods that you believe you will need. You will be required to create at least 2 different classes. If you are going to use classes similar to those we've made for previous assignments, you will have to add new features to them.

CLASS Player
- Instance variables:
  - int x, y Position of player ship
  - int lives # of lives remaining
  - Bullet[] pBullets Array of bullets fired by player
  - int score Player's score
- METHODS
  - void moveLeft() move ship left
  - void moveRight() move ship right
  - void shoot() creates a new bullet and fires it
  - void display() draw the ship
  - void updateBullets(Bullet[] b) move and display bullets, and check for collision
  - void loseLife() Decrease lives when hit

CLASS Enemy
- Instance variables:
  - int x,y Position of enemy
  - int type Enemy type
  - boolean alive Stores if enemy is active
  - Bullet[] bullets Array of bullets fired by this enemy
- METHODS
  - void move() move horizontally, descend at edge, and reverse movement speed
  - void shoot() creates a new bullet and fires it
  - void display() draw the enemy
  - void updateBullets(Bullet[] b) move and display bullets, and check for collision
  - void destroy() mark enemy as dead and add to score
    
CLASS Bullet
- Instance variables:
  - int x, y Position of bullet
  - itn speed Speed of the bullet
  - boolean active Whether the bullet is still in play
- METHODS
  - void move() Update position of bullet
  - display() Draw the bullet
  - boolean offScreen() Checks if bullet is in screen
  - boolean checkCollision(Enemy e) Returns true if the bullet hits an enemy
  - boolean checkCollision(Player p) Returns true if the bullet hits the player
    
