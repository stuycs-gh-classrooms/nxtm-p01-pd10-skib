Player player;
ArrayList<Enemy> enemies;//they stol  my work suing processing
int enemyCols = 8;
int enemyRows = 3;
int moveTimer = 0;
int moveInterval = 30;
void setup() {
  size(1000, 800);
  player = new Player(width/2, height - 40, 3);
  enemies = new ArrayList<Enemy>();
  for (int r = 0; r < enemyRows; r++) {
   for ( int c = 0; c < enemyCols; c++) {
     int type = 1 + (r %3);
     int x = 20 + c*20;
     int y = 20 + r * 15;
     enemies.add(new Enemy(type, x, y, 1));
   }
  }
}
void draw() {
  background(0,0,0);
  player.display();
  if (player.bullet != null) {
    for (int i = 0; i < player.bullet.length; i++) {
      Bullet b = player.bullet[i];
      if (b == null) continue;
      if (b != null) {
        b.move();
        b.display();
        if (b.offScreen()) {
          player.bullet[i] = null;
          continue;
        }
        for(int j = 0; j < enemies.size(); j++){
          Enemy e = enemies.get(j);
          if (e.alive && e.checkCollision(b)) {
            e.destroy();
            player.score += 100;
            player.bullet[i] = null;
            break;
          }
        }
      }
    }
  }
  moveTimer++;
  if (moveTimer >= moveInterval) {
   for (int i = 0; i < enemies.size(); i++) {
     Enemy e = enemies.get(i);
     if (e.alive) {
       e.move();
     }
   }
   moveTimer = 0;
   }
   
   if (frameCount % 60 == 0) {
     ArrayList<Enemy> alive = new ArrayList<Enemy>();
     for (int i = 0; i < enemies.size(); i++) {
       Enemy e = enemies.get(i);
       if (e.alive) alive.add(e);
     }
     if (alive.size() > 0) {
       int idx = int(random(alive.size()));
       Enemy shooter = alive.get(idx);
       shooter.shoot();
     }
   }
   for (int i = 0; i < enemies.size(); i++) {
     Enemy e = enemies.get(i);
     if (e.bullets == null) continue;
     if (e.bullets != null) {
       for (int k = 0; k < e.bullets.length; k++) {
         Bullet eb = e.bullets[k];
         if (eb != null) {
           eb.move();
           eb.display();
           if (eb.offScreen()) {
             e.bullets[k] = null;
             continue;
           }
           if (player.lives > 0 && player.checkCollision(eb)) {
            player.loseLife();
            e.bullets[k] = null;
           }
         }
       }
     }
   }
   for (int i = 0; i < enemies.size(); i++) {
     Enemy e = enemies.get(i);
     e.display();
   }
   fill(255);
   textSize(14);
   text("Score " + player.score, 10, 20);
   text("Lives " + player.lives, width - 80, 20);
   
   boolean anyAlive = false;
   for (int i = 0; i < enemies.size(); i++) {
     Enemy e = enemies.get(i);
     if (e.alive) {
       anyAlive = true;
       break;
     }
   }
   if (!anyAlive) {
     fill(0, 200, 0);
     textSize(32);
     textAlign(CENTER);
     text("YOU WIN!", width/2, height/2);
     noLoop();
   }
   if (player.lives <= 0) {
     fill(200, 0, 0);
     textSize(32);
     textAlign(CENTER);
     text("GAME OVER", width/2, height/2);
     noLoop();
   }
}

void keyPressed() {
 player.move(key);
 if (key == ' ') {
   player.shoot();
 }
}
