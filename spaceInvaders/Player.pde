class Player {
  int x,y;
  int lives;
  Bullet[] bullet;
  int score;
  int size = 20;
  int Velocity;
  Player(int xs, int ys, int livess) {
   this.x = xs;
   this.y = ys;
   this.lives = livess;
  }//constructor
  void display() {
    if (lives > 0) {
      circle(x,y,size);
    }
  }//display
  void move(char input) {
    if(input == 'a'|| input == 'A'){
     x -= size/2;
    }else if (input == 'd'|| input == 'D') {
     x += size/2; 
    }
    bullet = new Bullet[10];
  }//move
  void shoot() {
    boolean hasShot = false;
    int i = 0;
    while(!hasShot)
    {
      if(bullet[i] == null)
      {
        bullet[i] = new Bullet(x, y + 20, 10);
        hasShot = true;
      }
      else
      {
        i++;
      }
    }
  }//shoot
  void loseLife() {
   lives -= 1; 
  }
}//class
