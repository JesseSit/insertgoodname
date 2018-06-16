Player p1;
Player p2;
int time = 0;
int spawner = 0;
Powerup omega;

void setup() {
  size(800, 400); //generate board
  background(0, 0, 0); // set board color
  frameRate(60); // sets basic parameters
  p1 = new Player(25, 160, 'w', 'a', 's', 'd');
  p2 = new Player(765, 160, 'i', 'j', 'k', 'l');
  omega = new Powerup();
}

void draw() {
  background(0, 0, 0); // set board color
  stroke(255, 255, 255);
  line(400, 0, 400, 400);
  p1.move();
  p1.display();
  p2.move();
  p2.display();
  omega.display();
  
  time = millis()/1000;
  String Time = str(time);
  textSize(60);
  text(Time, 340, 70);
  
  spawner = int(random(2));
  if (spawner == 1) {
    //make spawn a powerup
    //not sure how to do this
  }
  
  if (time > 20) {
    //spawn a new obstacle for every 10 seconds 
    //don't know how to do this either
  }
}

void display() {
  
}