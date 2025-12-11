class Bullet {
  int x, y;
  int speed;
  boolean active;
  Bullet(int x, int y, int speed)
  {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.active = true;
  }
  void move()
  {
    y -= speed;
  }
  void display()
  {
    fill(200,0,0);
    ellipse(float(x), float(y), 2.0, 5.0);
  }
  boolean offScreen()
  {
    if (y >= height - 5 || y <= -5)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
}
