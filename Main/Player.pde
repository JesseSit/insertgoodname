class Player {
  int x; //x-pos when initiated
  int y; //y-pos when initiated
  Player(){
    x = 25;
    y = 160;
  }
  Player(int xcor, int ycor){
    x = xcor;
    y = ycor;
  }
  void display(){
  PShape rectangle;
  rectangle = createShape(RECT, x, y, 10, 80);
  rectangle.setFill(color(255, 255, 255));
  }
}
