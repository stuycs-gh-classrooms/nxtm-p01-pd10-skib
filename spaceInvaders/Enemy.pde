class Enemy{
  int x, y;
  int type;
  boolean alive;
  int direction;
  Bullet[] bullets;
  int size = 20;
  public Enemy(int type, int x, int y, int direction)
  {
    this.type = type;
    this.x = x;
    this.y = y;
    bullets = new Bullet[100];
    this.direction = direction;
    alive = true;
  }
  void move()
  {
    if(x >= 20 && x <= width - 20)
    {
      x += direction * 20;
    }
    else
    {
      y += 20;
      direction *= -1;
    }
  }
  void shoot()
  {
    boolean hasShot = false;
    int i = 0;
    while(!hasShot)
    {
      if(bullets[i] == null)
      {
        bullets[i] = new Bullet(x, y + 20, 10);
        hasShot = true;
      }
      else
      {
        i++;
      }
    }
  }
  void display()
  {
     if(alive)
     {
       triangle(x-type*size, y + type*size, x + type*size, y + type*size, x, y - type*size);
     }
  }
  boolean checkCollision(Bullet b)
  {
    if(abs(this.x - b.x) <= type*size && abs(this.y - b.y) <= type*size)
    
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
