// ======================== VARIABLES ================================================
Player p1;
Player p2;
Powerup omega;
int time = 0;
int spawnPU = 0;
ArrayList<Powerup> Power = new ArrayList<Powerup>();
int powerLength = 0;
Ball b;
String finish;

// ============================ SETUP =====================================================================
void setup() {
  size(800, 400); //generate board
  background(0, 0, 0); // set board color
  frameRate(60); // sets basic parameters
  p1 = new Player(25, 160, 'w', 'a', 's', 'd');
  p2 = new Player(765, 160, 'i', 'j', 'k', 'l');
  b = new Ball(40, 200, 5);
  omega = new Powerup();
  Power.add(omega);
}  // end setup() =====================================================================

// ============================= DRAW =====================================================================
void draw() {
  // SET BOARD AND COLOR ------------------------------------------------------------------------
  background(0, 0, 0);
  fill(255, 255, 255);
  stroke(255, 255, 255);
  line(400, 0, 400, 400);

  // TEXT STUFF
  time = millis()/1000;
  String Time = str(time);
  textSize(60);
  text(Time, 340, 70);
  finish = null;
  
  // POWERUP SPAWN ---------------------------------------------------------------------------------------------------------
  spawnPU = int(random(0, 250));
  if (spawnPU == 5){
    omega = new Powerup();
    Power.add(omega);
    powerLength += 1;
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
  
  // POWERUP MECHANICS ----------------------------------------------------------------------
  powerLength = Power.size() - 1;
  while (powerLength >= 0){
    Power.get(powerLength).display();
    powerLength -= 1;
  }
  
  // POWERUP MECHANICS FOR PLAYER 1 --------------------------------------------------------------------------------
  powerLength = Power.size() - 1;
  while (powerLength >= 0){
    if (((p1.x + 10) >= (Power.get(powerLength).x - Power.get(powerLength).rad)) && ((p1.x) <= ((Power.get(powerLength).x - Power.get(powerLength).rad))) && (Power.get(powerLength).y >= p1.y) && (Power.get(powerLength).y <= (p1.y + 80))){
      if (Power.get(powerLength).type == 0) { //increase health or reduce damage taken
        p1.health += 5;
        Power.remove(powerLength);
        powerLength = Power.size() - 1;
      }
      else if (Power.get(powerLength).type == 1) { //increase movement speed
        p1.speed += 1;
        Power.remove(powerLength);
        powerLength = Power.size() - 1;
      }
      else if (Power.get(powerLength).type == 2) { //increase power or damage that opponent takes
        p1.damage += 10;
        Power.remove(powerLength);
        powerLength = Power.size() - 1;
      }
    }
    powerLength -= 1;
  }
  
  // POWERUP MECHANICS FOR PLAYER 2 ----------------------------------------------------------------------------
  powerLength = Power.size() - 1;
  while (powerLength >= 0){
    if (((p2.x) <= (Power.get(powerLength).x + Power.get(powerLength).rad)) && ((p2.x + 10) >= ((Power.get(powerLength).x + Power.get(powerLength).rad))) && (Power.get(powerLength).y >= p2.y) && (Power.get(powerLength).y <= (p2.y + 80))){
      if (Power.get(powerLength).type == 0) { //increase health or reduce damage taken
        p2.health += 5;
        Power.remove(powerLength);
        powerLength = Power.size() - 1;
      }
      else if (Power.get(powerLength).type == 1) { //increase movement speed
        p2.speed += 1;
        Power.remove(powerLength);
        powerLength = Power.size() - 1;
      }
      else if (Power.get(powerLength).type == 2) { //increase power or damage that opponent takes
        p2.damage += 10;
        Power.remove(powerLength);
        powerLength = Power.size() - 1;
      }
    }
    powerLength -= 1;
  }

  backCourt();

  // CHECK FOR WINNER ------------------------------------------------------------------------------
  if (p1.health <= 0) {
    finish = "Player 2 Wins";
    text(finish, 220, 200); 
    noLoop(); //stops draw()
  }
  else if (p2.health <= 0) {
    finish = "Player 1 Wins";
    text(finish, 220, 200);
    noLoop(); //stops draw()
  } 
} // end draw() =========================================================================================================

// ================== CHECK IF BALL HITS BACK COURT ====================================================================================
void backCourt() {
  if (b.x <= 0) {
    b.reset(40, 200);
    /*if (b.vx < 0) {
      b.vx *= -1;
      b.vy *= -1;
    }*/
    p1.damage(p2.damage);
  }
  else if (b.x >= 800) {
    b.reset(760, 200);
    /*if (b.vx > 0) {
      b.vx *= -1;
      b.vy *= -1;
    }*/
    p2.damage(p1.damage);
  }
} // end backCourt() =========================================================================================================
 
// ======================= CHECK IF PLAYER HITS BALL ========================================================================================================
void checkCollision(){
  if (((p1.x + 10) >= ((b.x - b.rad) - 1)) && ((p1.x + 10) <= ((b.x - b.rad) + 1)) && (b.y >= p1.y) && (b.y <= (p1.y + 80))){
    if (b.vx < 0){
      b.vx *= -1;
    }
  }
  if (((p2.x) <= ((b.x + b.rad) + 1)) && ((p2.x) >= ((b.x + b.rad) - 1)) && (b.y >= p2.y) && (b.y <= (p2.y + 80))){
    if (b.vx > 0){
      b.vx *= -1;
    }
  }
} // end checkCollision() ========================================================================================================

// ============================= DISPLAY ========================================================================================================
void display() {
  
} // end display() ========================================================================================================
