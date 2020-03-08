
boolean p1 = false;
boolean p2 = false;

void tablero(int x, int y){
  if(mousePressed && (x > 300 && x < 400) && (y > 50 && y < 54)){
    p1 = true;
  }
  if(mousePressed && (x > 300 && x < 400) && (y > 150 && y < 154)){
    p2 = true;
  }
  println(x,y);
}



void setup() {
  size(1080, 720);  // Tamaño del lienzo

}

void draw() {
  if (mousePressed) tablero(mouseX, mouseY);
}
