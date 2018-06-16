class Powerup {
  
  float x, y;  //coords
  int type;  //1,2, or 3 depending on which powerup
  int col;  //color
  float diameter;  //size
  
  Powerup() {
    x = random(1,800);
    y = random(1,400);
    type = int(random(3));
    col = type;
    diameter = (type + 1) * 5;
  }
  
  void power() {
    if () {
      
    }
  //insert player.statchange() or something
  }
  
  void move() {
    
  }
}