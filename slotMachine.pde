//initialize
object[] objects = new object[3];
int counter = 0;
int money;

void setup() {
  money = 10000;
  size(450, 400);
  for (int i = 0; i < objects.length; i++) {
    //objects
    objects[0] = new object(width/2 - 135, 50, int(random(1, 4)));
    objects[1] = new object(width/2-35, 50, int(random(1, 4)));
    objects[2] = new object(width/2 + 65, 50, int(random(1, 4)));
    //objects[3] = new object(width/2 - 100, -60);
    //objects[4] = new object(width/2, -60);
    //objects[5] = new object(width/2 + 100, -60);
  }
  //images
  orange = loadImage("orange.jpg");
  berry = loadImage("berry.jpg");
  seven = loadImage("seven.jpg");
  cherry = loadImage("cherry.jpg");
}

void draw() {
  println(finalWin);
  background(255);
  rectMode(CENTER);
  for (int i = 0; i < objects.length; i++) {
    objects[i].spawn();
    objects[i].reset();
  }
  //Move
  if (counter == 1) {
    for (int i = 0; i < objects.length; i++) {
      objects[i].move();
    }
    win = 0; //reset win
  }
  //Stop
  if (counter == 2) {
    for (int i = 0; i < objects.length; i++) {
      objects[i].moveReset();
    }
    money -= 10;
    counter = 0;
    yspeed = 0;
    for (int i = 0; i < objects.length; i++) {
      objects[i].checkForWin();
    }
  }
  //border
  fill(0);
  rect(0, height, 10000, 300);
  rect(0, 15, 10000, 300);

  //texts
  textSize(40);
  fill(52, 113, 235);
  text("Jawei Casino", width/2 - 110, 50);

  textSize(20);
  fill(255);
  text("Money: " +money, 35, 370);

  textSize(30);
  text("Win: " + finalWin, 179, 274);

  textSize(12);
  text("Press SPACE to spin", 320, 370);
}
void keyPressed() {
  if (keyCode == ' ') {
    counter++;
  }
}
void mousePressed() {
  if (mousePressed) {
    println(mouseX, mouseY);
  }
}
