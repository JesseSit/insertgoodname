class Powerup {
  
  // ======================== VARIABLES ================================================
  float x, y;  //coords
  int type;  //1,2, or 3 depending on which powerup
  float rad;  //size
  
  // ======================= CONSTRUCTORS ================================================
  Powerup() {
    x = random(1,800);
    y = random(1,400);
    type = int(random(3));
    rad = (type + 1) * 5;
  }
  
  // ========================== DISPLAY ================================================
  void display() {
     if (type == 0) {
       fill(255, 0, 0);
       stroke(255, 0, 0);
     }
     if (type == 1) {
       fill(0, 255, 0);
       stroke(0, 255, 0);
     }
     if (type == 2) {
       fill(0, 0, 255);
       stroke(0, 0, 255);
     }
     ellipse(x, y, 2*rad, 2*rad);
  }
  
  // =========================== MOVE ================================================
  void move() {
    //optional
  }
  
} // ==================================================================================================================================================