class Obstacle {
  
  float x, y;
  float v;
  
  Obstacle() {
    x = random(1,800);
    y = random(1,400);
    v = random(30) + 1;
  }
  
  void display() {
     rect(x, y, random(40), random(40));
     fill(137, 137, 137);
  }
  
  void move() {
    if (random(100) > 50) {
      y += v; 
    }
    else {
      y -= v; 
    }
  }
  
}