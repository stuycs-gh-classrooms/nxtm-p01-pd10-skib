Player player;
ArrayList<Enemy> enemies;//they stol  my work suing processing
int enemyCols = 8;
int enemyRows = 3;
int moveTimer = 0;
int moveInterval = 50;
boolean playing = false;
boolean spaceDown = false;
boolean firstWave = true;
void setup() {//sets up everything on program start
  size(1000, 800);
  frameRate(60);
  init();S
}
void init() {//creates player and every enemy in the array
  if (firstWave) {
    player = new Player(width/2, height - 40, 3);
  }
  enemies = new ArrayList<Enemy>();
  for (int r = 0; r < enemyRows; r++) {
    for ( int c = 0; c < enemyCols; c++) {
      int type = 1 + (r %3);
      int x = 20 + c*90;
      int y = 60 + r * 60;
      println(type);
      enemies.add(new Enemy(type, x, y, 1));//creates the grid of enemies
    }
  }
}
void draw() {
  background(0, 0, 0);//refreshes screen
  player.display();
  if (playing) {
    if (player.bullet != null) {//if there is a player's bullet, moves it and then displays
      for (int i = 0; i < player.bullet.length; i++) {
        Bullet b = player.bullet[i];
        if (b != null) {
          b.move();
          b.display();
          if (b.offScreen()) {
            player.bullet[i] = null;//destroys the bullet if it is offscreen
            continue;
          }
          for (int j = 0; j < enemies.size(); j++) {
            Enemy e = enemies.get(j);
            int value = 100;
            if (e.alive && e.checkCollision(b)) {//checks if an enemy gets hit by player bullet
              if (e.type == 1) {
                value = 300;
              } else if (e.type == 2) {
                value = 200;//determines points given based on type
              }
              e.destroy();
              player.score += value;
              player.bullet[i] = null;
              break;
            }
          }
        }
      }
    }
    moveTimer++;
    if (moveTimer >= moveInterval) {//cooldown for enemy movement
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
      for (int i = 0; i < enemies.size(); i++) {//finds living enemies
        Enemy e = enemies.get(i);
        if (e.alive) alive.add(e);
      }
      if (alive.size() > 0) {
        int idx = int(random(alive.size()));
        Enemy shooter = alive.get(idx);
        shooter.shoot();//random living enemy shoots
      }
    }
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      if (e.bullets == null) continue;
      if (e.bullets != null) {
        for (int k = 0; k < e.bullets.length; k++) {
          Bullet eb = e.bullets[k];
          if (eb != null) {//if there are enemy bullets, they move and are displayed
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
    fill(255);
    textSize(14);
    text("Score " + player.score, 10, 20);//score tracker
    text("Lives " + player.lives, width - 80, 20);//live tracker

    boolean anyAlive = false;
    for (int i = 0; i < enemies.size(); i++) {//checks for any living enemiess
      Enemy e = enemies.get(i);
      if (e.alive) {
        anyAlive = true;
        break;
      }
    }
    if (!anyAlive) {
      player.lives += 1;
      enemyRows += 1;
      firstWave = false;
      init();//go to second wave if all dead and give player a life
    }
    if (player.lives <= 0) {
      fill(200, 0, 0);
      textSize(32);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      playing = false;
    }
  }
  for (int i = 0; i < enemies.size(); i++) {
    Enemy e = enemies.get(i);
    e.display();
  }
}
void keyPressed() {
  if (playing) {
    player.move(key);
  }
  if (key == ' ') {
    if ( !spaceDown && playing) {
      player.shoot();
      spaceDown = true;//makes sure player cannot hold down space
    }
  } else if (key == 'p' || key == 'P') {
    playing = !playing;
  } else if (key == 'r' || key == 'R') {
    playing = false;
    init();
  }
}
void keyReleased() {
  if (key == ' ') {
    spaceDown = false;
  }
}
