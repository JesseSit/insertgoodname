class Powerup {
  
  float x, y;  //coords
  int type;  //1,2, or 3 depending on which powerup
  int col;  //color
  float diam;  //size
  
  Powerup() {
    x = random(1,800);
    y = random(1,400);
    type = int(random(3));
    col = type;
    diam = (type + 1) * 10;
  }
  
  void display() {
     ellipse(x, y, diam, diam);
     if (type == 0) {
       fill(255, 0, 0); 
     }
     if (type == 1) {
       fill(0, 255, 0);
     }
     if (type == 2) {
       fill(0, 0, 255);
     }
  }
  
  void power(Player p) {
    if (((x - p.x) < 20) && ((x - p.x) < 20)) {
      if (type == 0) { //increase health or reduce damage taken
        
      }
      if (type == 1) { //increase movement speed
        p.speed += 1;
      }
      if (type == 2) { //increase power or damage that opponent takes
        
      }
    }
  //insert player.statchange() or something
  }
  
  void move() {
    //optional
  }
}