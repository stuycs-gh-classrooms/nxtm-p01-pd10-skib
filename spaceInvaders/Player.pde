class Player {
  int x,y;
  int lives;
  Bullet[] bullet;
  int score;
  int size = 30;
  Player(int xs, int ys, int livess) {
   this.x = xs;
   this.y = ys;
   this.lives = livess;
   this.bullet = new Bullet[30];
   this.score = 0;
  }//constructor
  void display() {
    if (lives > 0) {
      fill(0,0,255);
      circle(x,y,size);
    }
  }//display
  void move(char input) {
    if((input == 'a'|| input == 'A')&& width-20 >x && x > 20){
     x -= size/2;
    }else if ((input == 'd'|| input == 'D')&& width-20 >x && x > 20) {
     x += size/2; 
    }
  }//move
  void shoot() {
   for(int i = 0; i < bullet.length; i++) {
    if (bullet[i] == null) {
      bullet[i] = new Bullet(x, y - size/2 - 6, 8);
      return;
    }
   }
  }//shoot
  void loseLife() {
   lives -= 1; 
  }
  boolean checkCollision(Bullet b) {
   if(abs(this.x - b.x) <= size && abs(this.y - b.y) <= size){
     return true;
   }else{return false;
 }
  }//check collision
  
}//class
