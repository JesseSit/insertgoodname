class Player {
  
  int x; //x-pos when initiated
  int y; //y-pos when initiated
  char w, a, s, d; // initiate commands
  int health;  //length of screen to move around
  int damage;  //amount screen that oppoment loses during damage
  int speed; //movement speed
  
  Player() {
    x = 25;
    y = 160;
    w = 'w';
    a = 'a';
    s = 's';
    d = 'd';
    health = 390;
    damage = 10;
    speed = 2;
  }
  
  Player(int xcor, int ycor, char w1, char a1, char s1, char d1){
    x = xcor;
    y = ycor;
    w = w1;
    a = a1;
    s = s1;
    d = d1;
    health = 390;
    damage = 10;
    speed = 2;
  }
  
  void move() { 
    if (keyPressed) {
      if ((x <= 385) || (x >= 405)) {
        if (key == s) {
          y += speed;
        }
        if (key == w){
          y -= speed;
        }
        if (key == a){
          x -= speed;
        }
        if (key == d){
          x += speed;
        }
      }
      if ((x > 385) && (x < 390)){
        if (key == a){
          x -= speed;
        }
      }
      if ((x > 400) && (x < 405)){
        if (key == d){
          x += speed;
        }
      }
    } 
  }
  
  boolean power(Powerup pow) {
    if (((x - pow.x) < (pow.rad+10)) && ((y - pow.y) < (pow.rad+10))) {
      if (pow.type == 0) { //increase health or reduce damage taken
        health += 5;
        return true;
      }
      if (pow.type == 1) { //increase movement speed
        speed += 1;
        return true;
      }
      if (pow.type == 2) { //increase power or damage that opponent takes
        damage += 10;
        return true;
      }
    }
    return false;
  }
  
  void damage(int dmg) {
    health -= dmg;
  }
  
  // boolean collide(Obstacle ob) {
  //   return true;
  // }
  
  void display() {
    fill(255, 255, 255);
    rect(x, y, 10, 80);
  }
  
}