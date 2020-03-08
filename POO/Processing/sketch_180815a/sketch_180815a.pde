void setup() {

  size(300, 600);  // Tamaño del lienzo
}

int i = 1;

void draw() {
  background(247, 191, 190);
  println(i++ );


  ellipseMode(RADIUS); // modo de los atributos
  fill(0, 255, 255);
  ellipse(60, 60, 55, 55);


  stroke(255, 255, 0); // color linea
  strokeWeight(5);  //grosor linea

  ellipseMode(CENTER);
  fill(0, 255, 0); // rellenar
  ellipse(56, 46, 55, 55);

  fill(255, 0, 0); // rellenar
  rect(mouseX, mouseY, 55, 100);
}
