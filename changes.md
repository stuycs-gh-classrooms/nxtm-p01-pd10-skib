## Array Usage 
1D Arrays - Bullets[] will store Bullet class objects, which will primarily be used to check the positions of the bullets
## Methods
### Player
void move(char key) //if the key is a,A, or left key, the player ship will move left, if key is d,D, or right key, move the ship right, keyPressed will store key in a variable called input
boolean checkCollision(Bullet b) Returns true if a bullet hits the player
### Enemy
boolean checkCollision(Enemy e) Returns true if a bullet hits the enemy
### Bullet
void updateBullets(Bullet[] b) If bullet collides with an enemy or the player or off screen, the bullet will die, if not it will move and then display
