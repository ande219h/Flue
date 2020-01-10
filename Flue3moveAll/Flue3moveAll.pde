//Arraylist der indeholder alle flue objekter
ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup() {
  size(500, 500);
}

void draw() {
  background(6, 174, 214);
  //enhanced for loop der kører igennem flueliste og tegner og flytter
  for (Flue i : flueListe) {
    i.tegnFlue();
    i.flyt();
  }
}

void keyPressed() {

  if (key=='e') {
    flueListe.add(new Flue(random(1.01, 3)));
  } else {
    flueListe.add(new Flue());
  }
}

void mousePressed() {
  flueListe.add(new Flue(mouseX, mouseY));
}

/////////////////////////////////////////////////////////
class Flue {

  float positionX, positionY;
  float distanceFlyttet;
  float vinkel = 0;
  float skalar=1;


  //Constructor der laver fluer med anden størrelse
  Flue(float skalar) {
    positionX  = random(0, height);
    positionY  = random(0, width);
    vinkel     = random(0, 2*PI);
    this.skalar=skalar;
  }

  //Constructor til at tegne flue ved klik på tast
  Flue() {
    positionX  = random(0, height);
    positionY  = random(0, width);
    vinkel     = random(0, 2*PI);
  }

  //Constructor til at tegne flue ved klik på skærmen
  Flue(float a, float b) {
    positionX = a;
    positionY = b;
    vinkel    = random(0, 2*PI);
  }

  //Metoden til at flytte
  void flyt() {
    if (cos(vinkel)*distanceFlyttet+positionX<0) {
      positionY+=sin(vinkel)*distanceFlyttet;
      positionX=0;
      
      //Finder den nye vinkel
      vinkel=PI-vinkel;
      distanceFlyttet=0;
    } else if (cos(vinkel)*distanceFlyttet+positionX>width) {
      positionY+=sin(vinkel)*distanceFlyttet;
      positionX=width;
      
      //Den nye vinkel
      vinkel=PI-vinkel;
      distanceFlyttet=0;
    } else if (sin(vinkel)*distanceFlyttet+positionY<0) {
      positionX+=cos(vinkel)*distanceFlyttet;
      positionY=0;
      
      //Den nye vinkel
      vinkel=2*PI-vinkel;
      distanceFlyttet=0;
    } else if (sin(vinkel)*distanceFlyttet+positionY>height) {
      positionX+=cos(vinkel)*distanceFlyttet;
      positionY=height;
      //Den nye vinkel
      
      vinkel=2*PI-vinkel;
      distanceFlyttet=0;
    }

    distanceFlyttet += 0.5;
  }

  //Metoden til at tegne fluer
  void tegnFlue() {
    pushMatrix();
    translate(positionX, positionY);
    rotate(vinkel);
    translate(distanceFlyttet, 0);
    scale(skalar);
    ellipse(0, 0, 20, 8);
    ellipse(0, 0-8, 15, 10);
    ellipse(0, 0+8, 15, 10);
    ellipse(0+6, 0, 8, 8);
    popMatrix();
  }
}
//////////////////////////////////////////////////////
