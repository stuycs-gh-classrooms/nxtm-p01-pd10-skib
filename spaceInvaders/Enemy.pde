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
    if(x >= 0 && x <= width )
    {
      x += direction * 20;
    }
    else
    {
      y += 20;
      direction = -1*direction;
      x += direction * 20;
      
    }
  }
  void shoot()
  {
   for(int i = 0; i < bullets.length; i++) {
    if (bullets[i] == null) {
      bullets[i] = new Bullet(x, y - size/2 - 6, -8);
      return;
    }
   }
  }
  void display()
  {
     if(alive)
     {
       fill(255);
       triangle(x-type*size, y + type*size, x + type*size, y + type*size, x, y - type*size);
     }
  }
  boolean checkCollision(Bullet b)
  {
    if(alive && abs(this.x - b.x) <= type*size && abs(this.y - b.y) <= type*size)
    
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  void destroy()
  {
    alive = false;
    
  }
}
  
  
