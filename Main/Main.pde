// ======================== VARIABLES ================================================
Player p1;
Player p2;
Powerup omega;
Obstacle delta;
int time = 0;
int spawnPU = 0;
int spawnOB = 0;
ArrayList<Powerup> Power = new ArrayList<Powerup>();
ArrayList<Obstacle> Obs = new ArrayList<Obstacle>();
int powerLength = 0;
int obslength = 1;
Ball b;
String finish;

// ============================ SETUP =====================================================================
void setup() {
  size(800, 450); //generate board
  background(0, 0, 0); // set board color
  frameRate(60); // sets basic parameters
  p1 = new Player(25, 160, 'w', 'a', 's', 'd');
  p2 = new Player(765, 160, 'i', 'j', 'k', 'l');
  b = new Ball(40, 200, 5);
  omega = new Powerup();
  delta = new Obstacle();
  Power.add(omega);
  Obs.add(delta);
}  // end setup() =====================================================================

// ============================= DRAW =====================================================================
void draw() {
  // SET BOARD AND COLOR ------------------------------------------------------------------------
  background(0, 0, 0);
  fill(255, 255, 255);
  stroke(255, 255, 255);
  line(400, 50, 400, 450);
  line(0, 50, 800, 50);

  // TEXT STUFF
  time = millis()/1000;
  String Time = str(time);
  textSize(40);
  text("Time: ", 590, 40);
  text(Time, 700, 40);
  textSize(15);
  text("Player One Health:", 220, 30);
  text(str(p1.health), 360, 30);
  text("Player Two Health:", 410, 30);
  text(str(p2.health), 550, 30);
  finish = null;

  // POWERUP SPAWN ---------------------------------------------------------------------------------------------------------
  spawnPU = int(random(0, 250));
  if (spawnPU == 5) {
    omega = new Powerup();
    Power.add(omega);
    powerLength += 1;
  }
  
  // OBSTACLE SPAWN -----------------------------------------------------------------------------------------
  spawnOB = int(random(0, 200));
  if (spawnOB == 5) {
    delta = new Obstacle();
    Obs.add(delta);
    obslength += 1;
  }

  // PLAYERS --------------------------------------------------------------------------------------------------------------
  p1.move();
  p1.display();
  p2.move();
  p2.display();

  // BALL --------------------------------------------------------------------------------------------------------------
  b.display();
  b.checkBoundaryCollision();
  checkCollision();

  if ((!b.start) && (b.turn == false)) {
    if (keyPressed) {
      if (key == p1.w) {
        b.y -= p1.speed;
      }
      if (key == p1.a) {
        b.x -= p1.speed;
      }
      if (key == p1.s) {
        b.y += p1.speed;
      }
      if (key == p1.d) {
        b.x += p1.speed;
      }
    }
  }
  if ((!b.start) && (b.turn == true)) {
    if (keyPressed) {
      if (key == p2.w) {
        b.y -= p2.speed;
      }
      if (key == p2.a) {
        b.x -= p2.speed;
      }
      if (key == p2.s) {
        b.y += p2.speed;
      }
      if (key == p2.d) {
        b.x += p2.speed;
      }
    }
  }
  
  // POWERUP MECHANICS ----------------------------------------------------------------------
  powerLength = Power.size() - 1;
  while (powerLength >= 0) {
    Power.get(powerLength).display();
    powerLength -= 1;
  }

  // POWERUP MECHANICS FOR PLAYER 1 --------------------------------------------------------------------------------
  powerLength = Power.size() - 1;
  while (powerLength >= 0) {
    if (((p1.x + 10) >= (Power.get(powerLength).x - Power.get(powerLength).rad)) && (p1.x <= (Power.get(powerLength).x + Power.get(powerLength).rad)) && (p1.y <= (Power.get(powerLength).y + Power.get(powerLength).rad)) && ((p1.y + 80) >= (Power.get(powerLength).y) - Power.get(powerLength).rad)){
      pop(p1);
    }
    powerLength -= 1;
  }

  // POWERUP MECHANICS FOR PLAYER 2 ----------------------------------------------------------------------------
  powerLength = Power.size() - 1;
  while (powerLength >= 0) {
    if (((p2.x + 10) >= (Power.get(powerLength).x - Power.get(powerLength).rad)) && (p2.x <= (Power.get(powerLength).x + Power.get(powerLength).rad)) && (p2.y <= (Power.get(powerLength).y + Power.get(powerLength).rad)) && ((p2.y + 80) >= (Power.get(powerLength).y) - Power.get(powerLength).rad)){
      pop(p2);
    }
    powerLength -= 1;
  }

  backCourt();
  
  // OBSTACLE -------------------------------------------------------------------------------------
  obslength = Obs.size() - 1;
  while (obslength > -1) {
    Obs.get(obslength).move();
    Obs.get(obslength).display();
    obslength -= 1;
  }
  
  obslength = Obs.size() - 1;
  while (obslength > -1) {
    if (((p1.x + 10) >= Obs.get(obslength).x) && (p1.x <= (Obs.get(obslength).x + Obs.get(obslength).w)) && (Obs.get(obslength).y <= (p1.y + 80)) && ((Obs.get(obslength).y + Obs.get(obslength).h) >= p1.y)){
      Obs.remove(obslength);
      obslength = Obs.size() - 1;
      p1.health -= 20;
    }
    if (((p2.x + 10) >= Obs.get(obslength).x) && (p2.x <= (Obs.get(obslength).x + Obs.get(obslength).w)) && (Obs.get(obslength).y <= (p2.y + 80)) && ((Obs.get(obslength).y + Obs.get(obslength).h) >= p2.y)){
      Obs.remove(obslength);
      obslength = Obs.size() - 1;
      p2.health -= 20;
    }
    obslength -= 1;
  }

  // CHECK FOR WINNER ------------------------------------------------------------------------------
  if (p1.health <= 0) {
    finish = "Player 2 Wins";
    text(finish, 220, 200); 
    noLoop(); //stops draw()
  } else if (p2.health <= 0) {
    finish = "Player 1 Wins";
    text(finish, 220, 200);
    noLoop(); //stops draw()
  }
} // end draw() =========================================================================================================

void pop(Player play) {
  if (Power.get(powerLength).type == 0) { //increase health or reduce damage taken
    play.health += 10;
    Power.remove(powerLength);
    powerLength = Power.size() - 1;
  } else if (Power.get(powerLength).type == 1) { //increase movement speed
    if (play.speed < 5) {
      play.speed += 0.5;
    }
    Power.remove(powerLength);
    powerLength = Power.size() - 1;
  } else if (Power.get(powerLength).type == 2) { //increase power or damage that opponent takes
    play.damage += 10;
    Power.remove(powerLength);
    powerLength = Power.size() - 1;
  }
}

// ================== CHECK IF BALL HITS BACK COURT ====================================================================================
void backCourt() {
  if (b.x <= 0) {
    b.reset(40, 200);
    b.turn = false;
    p1.reset(25, 160);
    p2.reset(765, 160);
    p1.damage(p2.damage);
    Power.clear();
    Power.add(omega);
  } else if (b.x >= 800) {
    b.reset(760, 200);
    b.turn = true;
    p1.reset(25, 160);
    p2.reset(765, 160);
    p2.damage(p1.damage);
    Power.clear();
    Power.add(omega);
  }
} // end backCourt() =========================================================================================================

// ======================= CHECK IF PLAYER COLLIDES ========================================================================================================
void checkCollision() {
  // BALL ---------------------------------------------------------------------------------------------- 
  if (((p1.x + 10) >= ((b.x - b.rad) - 1)) && ((p1.x + 10) <= ((b.x - b.rad) + 10)) && (b.y >= p1.y) && (b.y <= (p1.y + 80))) {
    if (b.vx < 0) {
      b.vx *= -1;
      if (int(random(10)) == 1) {
        if (b.vx > 0) {
          b.vx += 0.5; 
        }
        else {
          b.vx -= 0.5; 
        }
      }
    }
  }
  if (((p2.x) <= ((b.x + b.rad) + 1)) && ((p2.x) >= ((b.x + b.rad) - 10)) && (b.y >= p2.y) && (b.y <= (p2.y + 80))) {
    if (b.vx > 0) {
      b.vx *= -1;
      if (int(random(10)) == 1) {
        if (b.vx > 0) {
          b.vx += 0.5;
        }
        else {
          b.vx -= 0.5; 
        }
      }
    }
  }
  // OBSTACLE ---------------------------------------------------------------------------------------
  //
} // end checkCollision() ========================================================================================================

// ============================= DISPLAY ========================================================================================================
void display() {
} // end display() ========================================================================================================
