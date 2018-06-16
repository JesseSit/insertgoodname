class Player {
  int x; //x-pos when initiated
  int y; //y-pos when initiated
  char w, a, s, d; // initiate commands
  Player(){
    x = 25;
    y = 160;
    w = 'w';
    a = 'a';
    s = 's';
    d = 'd';
  }
  Player(int xcor, int ycor, char w1, char a1, char s1, char d1){
    x = xcor;
    y = ycor;
    w = w1;
    a = a1;
    s = s1;
    d = d1;
  }
  void move(){
    if (keyPressed){
      if (key == s){
        y = y + 2;
      }
      if (key == w){
        y = y - 2;
      }
      if (key == a){
        x = x - 2;
      }
      if (key == d){
        x = x + 2;
      }
    }
  }
  void display(){
  fill(255, 255, 255);
  rect(x, y, 10, 80);

  }
}
