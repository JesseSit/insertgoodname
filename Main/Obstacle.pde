class Obstacle {
  
  float x, y;
  
  Obstacle() {
    x = random(1,800);
    y = random(1,400); 
  }
  
  void display() {
     rect(x, y, random(40), random(40));
     fill(137, 137, 137);
  }
  
}