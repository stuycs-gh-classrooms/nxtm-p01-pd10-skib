class Bullet{
  int x, y;
  int speed;
  boolean active;
  public Bullet(int x, int y, int speed)
  {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  void move()
  {
    y -= speed;
  }
  void display()
  {
    ellipse(float(x), float(y), 2.0, 5.0);
  }
  boolean offScreen()
  {
    if (y >= height - 5)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
}
