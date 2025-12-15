class Enemy {
  int x, y;
  int type;
  boolean alive;
  int direction;
  Bullet[] bullets;
  int size = 10;
  Enemy(int type, int x, int y, int direction)
  {
    this.type = type;
    this.x = x;
    this.y = y;
    bullets = new Bullet[30];
    this.direction = direction;
    alive = true;
  }
  void move()
  {
    int magnitude = 20;
    if (type == 1) {
      magnitude = 30;
    } else if (type == 2) {
      magnitude = 25;
    }
    if (x >= 0 && x <= width )
    {
      x += direction * magnitude; //moves horizontally if on screen

    } else
    {
      y += 20;
      direction = -1*direction;//moves down and switches horizontal direction when off screen
      x += direction * magnitude;
    }
  }
  void shoot()
  {
    for (int i = 0; i < bullets.length; i++) {
      int bSpeed = -8;
      if (bullets[i] == null) {
        if (type == 1) {
          bSpeed = -12;
        }
        bullets[i] = new Bullet(x, y - size/2 - 6, bSpeed);//finds space in array and creates bullet
        return;
      }
    }
  }
  void display()
  {
    if (alive)
    {//different colors and sizes of enemies depending on type.
      if (type == 1) {
        fill(255, 251, 0 );
      } else if (type == 2) {
        fill(222, 52, 52);
      } else if (type == 3) {
        fill(173, 58, 173);
      }
      triangle(x-type*size, y + type*size, x + type*size, y + type*size, x, y - type*size);
    }
  }
  boolean checkCollision(Bullet b)
  {
    if (alive && abs(this.x - b.x) <= type*size && abs(this.y - b.y) <= type*size)

    {
      return true;
    } else
    {
      return false;
    }
  }//checks if a bullet hit and enemy
  void destroy()
  {
    alive = false;
  }//kills enemy
}
