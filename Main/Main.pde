Player p1;
Player p2;
Powerup omega;
int time = 0;
int spawnPU = 0;
int spawner = 0;
ArrayList<Powerup> Power = new ArrayList<Powerup>();
int powerLength = 0;
Ball b;

void setup() {
  size(800, 400); //generate board
  background(0, 0, 0); // set board color
  frameRate(60); // sets basic parameters
  p1 = new Player(25, 160, 'w', 'a', 's', 'd');
  p2 = new Player(765, 160, 'i', 'j', 'k', 'l');
  b = new Ball(random(350, 450), random(150, 250), 5);
  omega = new Powerup();
  Power.add(omega);
}

void draw() {
  background(0, 0, 0); // set board color
  fill(255, 255, 255);
  stroke(255, 255, 255);
  line(400, 0, 400, 400);

  time = millis()/1000;
  String Time = str(time);
  textSize(60);
  text(Time, 340, 70);
  
  spawnPU = int(random(0, 250));
  if (spawnPU == 5){
    omega = new Powerup();
    Power.add(omega);
    powerLength += 1;
  }
  
  p1.move();
  p1.display();
  p2.move();
  p2.display();
  
  b.move();
  b.display();
  b.checkBoundaryCollision();
  checkCollision();
  
  powerLength = Power.size() - 1;
  while (powerLength >= 0){
    Power.get(powerLength).display();
    powerLength -= 1;
  }
  powerLength = Power.size() - 1;
  while (powerLength >= 0){
    if (((p1.x + 10) >= (Power.get(powerLength).x - Power.get(powerLength).rad)) && ((p1.x) <= ((Power.get(powerLength).x - Power.get(powerLength).rad))) && (Power.get(powerLength).y >= p1.y) && (Power.get(powerLength).y <= (p1.y + 80))){
      if (Power.get(powerLength).type == 0) { //increase health or reduce damage taken
        p1.health += 5;
        Power.remove(powerLength);
        powerLength = Power.size() - 1;
      }
      if (Power.get(powerLength).type == 1) { //increase movement speed
        p1.speed += 1;
        Power.remove(powerLength);
        powerLength = Power.size() - 1;
      }
      if (Power.get(powerLength).type == 2) { //increase power or damage that opponent takes
        p1.damage += 10;
        Power.remove(powerLength);
        powerLength = Power.size() - 1;
      }
    }
    powerLength -= 1;
  }
    
  
  spawner = int(random(500));
  if (spawner == 1) {
    //omega = new Powerup();
  }
  if (spawner == 2) {
    //alpha = new Powerup();
  }
  if (spawner == 3) {
    //delta = new Powerup(); 
  }
  
  if (time > 20) {
    //spawn a new obstacle for every 10 seconds 
    //
    //
    //
    //
    //
    //don't know how to do this either
  }
}

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
  
}
void display() {
  
}
