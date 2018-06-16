Player p1;
Player p2;
void setup(){
  size(800, 400); //generate board
  background(0, 0, 0); // set board color
  frameRate(60); // sets basic parameters
  p1 = new Player(25, 160, 'w', 'a', 's', 'd');
  p2 = new Player(765, 160, 'i', 'j', 'k', 'l');
}
void draw(){
  background(0, 0, 0); // set board color
  stroke(255, 255, 255);
  line(400, 0, 400, 400);
  p1.move();
  p1.display();
  p2.move();
  p2.display();
}
void display(){
  
}
