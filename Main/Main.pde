Player p1;
Player p2;
int time = 0;
int spawner = 0;
Powerup omega, alpha, delta;
Ball b;

void setup() {
  size(800, 400); //generate board
  background(0, 0, 0); // set board color
  frameRate(60); // sets basic parameters
  p1 = new Player(25, 160, 'w', 'a', 's', 'd');
  p2 = new Player(765, 160, 'i', 'j', 'k', 'l');
  omega = new Powerup();
  alpha = new Powerup();
  delta = new Powerup();
  b = new Ball(random(350, 450), random(150, 250), 5);
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
  
  p1.move();
  p1.display();
  p2.move();
  p2.display();
  omega.display();
  alpha.display();
  delta.display();
  
  b.move();
  b.display();
  b.checkBoundaryCollision();
  checkCollusion();
  
  //if(p1.power(omega)){omega = null;}
  //if(p1.power(alpha)){alpha = null;}
  //if(p1.power(delta)){delta = null;}       
  //if(p2.power(omega)){omega = null;}       
  //if(p2.power(alpha)){alpha = null;}
  //if(p2.power(delta)){delta = null;}
  
  if (((p1.x - omega.x) < (omega.rad+10)) && ((p1.y - omega.y) < (omega.rad+10))) {
    if (omega.type == 0) { //increase health or reduce damage taken
      p1.health += 5;
      omega = null;
    }
    if (omega.type == 1) { //increase movement speed
      p1.speed += 1;
      omega = null;
    }
    if (omega.type == 2) { //increase power or damage that opponent takes
      p1.damage += 10;
      omega = null;
    }
  }
  
  spawner = int(random(500));
  if (spawner == 1) {
    omega = new Powerup();
  }
  if (spawner == 2) {
    alpha = new Powerup();
  }
  if (spawner == 3) {
    delta = new Powerup(); 
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