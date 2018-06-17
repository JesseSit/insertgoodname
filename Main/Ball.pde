class Ball {

  // ======================== VARIABLES ================================================
  float x, y;
  float rad;
  float vx = 0;
  float vy = 0;
  boolean start = false;
  boolean turn = false;
 
  // ======================== CONSTRUCTORS ================================================
  Ball(float xin, float yin, float d) {
    x = xin;
    y = yin;
    rad = d;
    vx = 5;
    vy = 3;
  } 
  
  // ============================ MOVE ================================================
  void move() {
    x += vx;
    y += vy;
  }
  void reset(int resetX, int resetY){
    x = resetX;
    y = resetY;
    start = false;
  }
  
  // =================== CHECK BOUNDARY COLLISION ================================================
  void checkBoundaryCollision() {
    /*if (x > width-rad) {
      x = width-rad;
      vx *= -1;
    } else if (x < rad) {
      x = rad;
      vx *= -1;
    } else*/ if (y > height-rad) {
      y = height-rad;
      vy *= -1;
    } else if (y < (rad + 50)) {
      y = rad + 50;
      vy *= -1;
    }
  }

  // ===================== CHECK PLAYER COLLISION ================================================
  void checkCollision(Player play) {
    //insert code xdddddd 
  }
  
  // ========================== DISPLAY ========================================================================
  void display() {
    fill(204);
    stroke(204);
    ellipse(x, y, rad*2, rad*2);
    if (mousePressed){
      start = true;
    }
    if (start){
      move();
    }
  }
  
} // ================================================================================================
