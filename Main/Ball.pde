class Ball {
  
  float x, y;
  float rad;
  float vx = 0;
  float vy = 0;
 
  Ball(float xin, float yin, float d) {
    x = xin;
    y = yin;
    rad = d;
    vx = 3;
    vy = 3;
  } 
  
  void move() {
    x += vx;
    y += vy;
  }
  
  void checkBoundaryCollision() {
    if (x > width-rad) {
      x = width-rad;
      vx *= -1;
    } else if (x < rad) {
      x = rad;
      vx *= -1;
    } else if (y > height-rad) {
      y = height-rad;
      vy *= -1;
    } else if (y < rad) {
      y = rad;
      vy *= -1;
    }
  }

  void checkCollision(Player play) {
    //insert code xdddddd 
  }
  
  void display() {
    fill(204);
    ellipse(x, y, rad*2, rad*2);
  }
}