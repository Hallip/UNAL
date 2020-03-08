PImage Screentitle;
PImage Startbutton;
PImage StartbuttonP;
PImage CharacterRed;
PImage CharacterBlue;
PImage ScoreTitle;

PImage Ba;
PImage Bb;
PImage Bc;
PImage Bd;
PImage Be;
PImage Bf;
PImage Bg;
PImage Bh;
PImage Bi;
PImage Bj;

PImage Ra;
PImage Rb;
PImage Rc;
PImage Rd;
PImage Re;
PImage Rf;
PImage Rg;
PImage Rh;
PImage Ri;
PImage Rj;


int temporal;
int time;
int turno = 0;
int puntaje = 0;


float x = 363;
float y = 450;
float w = 560;
float h = 180;

boolean str = false;


int[][] ha = new int[9][4];
int[][] pha = new int[9][4];

int[][] va = new int[10][3];
int[][] pva = new int[10][3];

int[][] cuadros = new int[9][3];
int[][] pcuadros = new int[9][3];


void setup() {

  size(1280, 720);  // Tamaño del lienzo
  strokeWeight(0);
  Screentitle = loadImage("Screentitle.png");
  Startbutton = loadImage("Strartbutton.png");
  StartbuttonP = loadImage("StrartbuttonP.png");
  CharacterRed = loadImage("CharacterRed.png");
  CharacterBlue = loadImage("CharacterBlue.png");
  ScoreTitle = loadImage("ScoreTitle.png");

  Ba = loadImage("0B.png");
  Bb = loadImage("1B.png");
  Bc = loadImage("2B.png");
  Bd = loadImage("3B.png");
  Be = loadImage("4B.png");
  Bf = loadImage("5B.png");
  Bg = loadImage("6B.png");
  Bh = loadImage("7B.png");
  Bi = loadImage("8B.png");
  Bj = loadImage("9B.png");

  Ra = loadImage("0R.png");
  Rb = loadImage("1R.png");
  Rc = loadImage("2R.png");
  Rd = loadImage("3R.png");
  Re = loadImage("4R.png");
  Rf = loadImage("5R.png");
  Rg = loadImage("6R.png");
  Rh = loadImage("7R.png");
  Ri = loadImage("8R.png");
  Rj = loadImage("9R.png");


  background(232, 195, 158);
  for(int o = 0; o < 4; o++){
    for(int i = 0; i < 9; i++){
      ha[i][o] = 0;
      pha[i][o] = 0;
    }
  }
  for(int o = 0; o < 3; o++){
    for(int i = 0; i < 10; i++){
      va[i][o] = 0;
      pva[i][o] = 0;
    }
  }

  for(int o = 0; o < 3; o++){
    for(int i = 0; i < 9; i++){
      cuadros[i][o] = 0;
      pcuadros[i][o] = 0;
    }
  }
}

void menu() {


  image(Screentitle, 190, 100);
  image(Startbutton, 363, 450);

  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {

      image(StartbuttonP, 363, 450);
      str= true;
    }
  }
}

boolean dentro = false;


void mouseClicked() {
  if(dentro){
    turno = turno+1;
    if (turno > 1){
      turno = 0;
    }
    if(turno == 0 && time > 15){
      background(232, 195 , 158);
      image(CharacterBlue, 200, 30);
    }
    if(turno == 1 && time > 15){
      background(232, 195, 158);
      image(CharacterRed, 200, 30);
    }
    dentro = false;
  }
}



void board(){
  int b = 0;
  for(int j = 350; j <= 650; j = j+100){
    int a = 0;
    for(int i = 200; i <= 1000; i = i + 100){
      if(ha[a][b] == 0){
        fill(#000000);
        rect(i, j, 100, 10);
      }
      if(ha[a][b] == 1 && pha[a][b] == 1){
        fill(#a70000);
        rect(i, j, 100, 10);
      }
      if(ha[a][b] == 1 && pha[a][b] == 0){
        fill(#261dd5);
        rect(i, j, 100, 10);
      }
      a++;
    }
    b++;
  }
  int c = 0;
  for(int j = 350; j < 650; j = j+100){
    int d = 0;
    for(int i = 200; i <= 1100; i = i + 100){
      if(va[d][c] == 0){
        fill(#000000);
        rect(i, j, 10, 100);
      }
      if(va[d][c] == 1 && pva[d][c] == 1){
        fill(#a70000);
        rect(i, j, 10, 100);
      }
      if(va[d][c] == 1 && pva[d][c] == 0){
        fill(#261dd5);
        rect(i, j, 10, 100);
      }
      d++;
    }
    c++;
  }
}

void pintarcuadros(){
  for(int j = 360; j < 660; j = j+100){
    for(int i = 210; i < 1110; i = i + 100){
      if(cuadros[((i-210)/100)][((j-360)/100)] == 2 && pcuadros[((i-210)/100)][((j-360)/100)] == 2){
        fill(#7a0303);
        rect(i, j, 90, 90);
      }
      if(cuadros[((i-210)/100)][((j-360)/100)] == 2 && pcuadros[((i-210)/100)][((j-360)/100)] == 1){
        fill(#080370);
        rect(i, j, 90, 90);
      }
    }
  }
}


void validador(){
    int b = 0;
    for(int j = 350; j <= 650; j = j +100){
      int a = 0;
      for(int i = 200; i <= 1000; i = i + 100){
        if(mousePressed &&(mouseX >= i && mouseX <= i+100) && (mouseY >= j && mouseY <= j+10) && ha[a][b] == 0){
          ha[a][b] = 1;
          pha[a][b] = turno;
          dentro = true;
         println("Horizontal X: ",a," Y: ",b);
         if(b == 0){
           cuadros[a][b]++;
         }
         else if(b == 3){
           cuadros[a][b-1]++;
         }
         else{
           cuadros[a][b-1]++;
           cuadros[a][b]++;
         }
         if(cuadros[a][b] == 1){
           pcuadros[a][b] = turno + 1;
         }
        }
        a++;
      }
      b++;
    }
    int c = 0;
    for(int j = 360; j <= 660; j = j +100){
      int d = 0;
      for(int i = 200; i <= 1100; i = i + 100){
        if(mousePressed &&(mouseX >= i && mouseX <= i+10) && (mouseY >= j && mouseY <= j+100) && va[d][c] == 0){
          va[d][c] = 1;
          pva[d][c] = turno;
          dentro = true;
          println("Vertical X: ",d," Y: ",c);
          cuadros[d][c] = 1;
          pcuadros[d][c] = turno;
        }
        d++;
      }
      c++;
    }
}

int unidadesR = 0;
int decenasR = 0;
int centenasR = 0;

int unidadesB = 0;
int decenasB = 0;
int centenasB = 0;

void impri0(int xa, int ya, int pl){
    if(unidadesB == 0 )image(Ba, 800, 125);
}

void score(){
  image(ScoreTitle, 400, 140);
}



void draw() {

  if (mousePressed) {
  //  println("X: ", mouseX, "Y: ", mouseY);
  }
  if (!str) {
    menu();
  }
  if (str) {
    time++;
  }
  if (str && time < 15) {
    image(Screentitle, 190, 100);
    image(StartbuttonP, 363, 450);
  }
  if( str && time == 16) background(232, 195, 158);
  if (time == 20)image(CharacterBlue, 200, 30);
  if(time > 20){
    board();
    validador();
    pintarcuadros();
    score();
    }

}
