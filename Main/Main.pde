Player p1;
Player p2;
int time = 0;
int spawner = 0;
Powerup omega, alpha, delta;

void setup() {
  size(800, 400); //generate board
  background(0, 0, 0); // set board color
  frameRate(60); // sets basic parameters
  p1 = new Player(25, 160, 'w', 'a', 's', 'd');
  p2 = new Player(765, 160, 'i', 'j', 'k', 'l');
  omega = new Powerup();
  alpha = new Powerup();
  delta = new Powerup();
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
  
 // p1.power(omega);
 // p1.power(alpha);
 // p1.power(delta);       something went wrong when i tested these
 // p2.power(omega);       so fix the power function in Player class
 // p2.power(alpha);
 // p2.power(delta);
  
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
    //don't know how to do this either
  }
}

void display() {
  
}