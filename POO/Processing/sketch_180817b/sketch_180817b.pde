color ref = color(150, 152, 154);

void setup() {

  size(600, 600);  // Tamaño del lienzo
}

int player = 1;

boolean validador = false;

boolean p1 = false;
boolean p2 = false;
boolean p3 = false;
boolean p4 = false;

color cp1;
color cp2;

void draw() {
  background(247, 191, 190);
  strokeWeight(0);

  validar();
  if(mousePressed && (mouseX > 300 && mouseX < 400) && (mouseY > 50 && mouseY < 54)){
    p1 = true;
    validador = true;
  }
  if(mousePressed && (mouseX > 300 && mouseX < 400) && (mouseY > 150 && mouseY < 154)){
    p2 = true;
    validador = true;
  }
  //rect(300,50,4,100);
  if(validador){
    if (player == 1)player = 2;
    else player = 1;
    validador = false;
  }


}



void validar() {

    if(p1){
      if(player == 1 &&  cp1 != ref){
        fill(0, 256, 0);
        rect(300, 50, 100, 4);
        cp1 = get(300,50 );
      }
      if(player == 2  && cp1 != ref){
        fill(256, 0, 0);
        rect(300, 50, 100, 4);
        cp1 = get(300,50 );
      }

    }else{
      fill(150, 152, 154);
      rect(300, 50, 100, 4);
    }
    if(p2){
      if(player == 1  && cp2 != ref){
        fill(0, 256, 0);
        rect(300, 150, 100, 4);
        cp2 = get(300,50 );
      }
      if(player == 2  && cp2 != ref){
        fill(256, 0, 0);
        rect(300, 150, 100, 4);
        cp2 = get(300,50 );
      }
    }else{
      fill(150, 152, 154);
      rect(300, 150, 100, 4);
    }
}
