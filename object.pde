//symbols
PImage seven;
PImage berry;
PImage cherry;
PImage orange;
float yspeed = 0; //speed
int win; 
int finalWin; //win * 3
class object {
  PShape frame;
  float x;
  float y;
  int num;

  //constructor
  object(float xpos, float ypos, int number) {
    this.num = number;
    number = int(random(1, 4)); 
    this.x = xpos;
    this.y = ypos;
  }

  void spawn() {  
    frame =  createShape(RECT, x, y, 75, 75);

    //different textures
    if (num == 1) {
      this.frame.setTexture(seven);
    }
    if (num ==2) {
      this.frame.setTexture(berry);
    }
    if (num == 3) {
      this.frame.setTexture(cherry);
    }
    if (num == 4) {
      this.frame.setTexture(orange);
    }
    shape(frame);
  }

  void move() {
    y = y + yspeed;
    yspeed = 15;
  }

  //align symbols to center
  void moveReset() {
    y = y + yspeed;
    yspeed = 0;
    this.y = 170;
  }
  //reset position after symbols moved out of the border
  void reset() {
    if (this.y > 230) {
      this.y =  100;
      num = int(random(1, 5));
    }
  }
  //checkif you won something
  void checkForWin() {
    finalWin = win * 3;
    if (objects[0].num == objects[1].num && objects[1].num == objects[2].num) {
      //seven
      if (objects[0].num == 1) {
        win = 40;
        money = money + win;
      }
      //berry
      if (objects[0].num == 2) {
        win = 30;
        money = money + win;
      }
      //cherry
      if (objects[0].num == 3) {
        win = 20;
        money = money + win;
      }
      //orange
      if (objects[0].num == 4) {
        win = 10;
        money = money + win;
      }
    }
  }
}
