class Player {
  
  int x; //x-pos when initiated
  int y; //y-pos when initiated
  char w, a, s, d; // initiate commands
  int speed; //movement speed
  
  Player() {
    x = 25;
    y = 160;
    w = 'w';
    a = 'a';
    s = 's';
    d = 'd';
    speed = 2;
  }
  
  Player(int xcor, int ycor, char w1, char a1, char s1, char d1){
    x = xcor;
    y = ycor;
    w = w1;
    a = a1;
    s = s1;
    d = d1;
    speed = 2;
  }
  
  void move() { 
    if (keyPressed) {
      if (key == s) {
        y = y + speed;
      }
      if (key == w){
        y = y - speed;
      }
      if (key == a){
        x = x - speed;
      }
      if (key == d){
        x = x + speed;
      }
    }
  }
  
  void display() {
    fill(255, 255, 255);
    rect(x, y, 10, 80);
  }
  
}