// Modificado por Andres Viquez

class Rama {
  Rama izquierda;
  Rama derecha;
  float x, y;
  
  public Rama(float x, float y) {
    this.x = x;
    this.y = y;
    this.izquierda = null;
    this.derecha = null;
  }
}

void setup() {
  size(700, 580); 
}

void draw() {
  //translate(width/2, height);
  Rama rama = new Rama(width/2, height);
  branch(rama, 180, 15);
  smooth();
}

void branch(Rama rama, float len, float stroke) {
  strokeWeight(stroke);

  line(rama.x, rama.y, rama.x, rama.y - len);
   
  if (len > 10) {
    
    pushMatrix();
    //translate(0, -len);
    //rotate(HALF_PI/3);
    rama.derecha = new Rama(rama.x + len / 2, rama.y - len * sqrt(3));
    branch(rama.derecha, len*0.7, stroke*0.8);
    popMatrix();
 
    pushMatrix();
    //translate(0, -len);
    //rotate(-HALF_PI/3);
    rama.izquierda = new Rama(rama.x + len / 2, rama.y - len * sqrt(3));
    branch(rama.izquierda, len*0.7, stroke*0.8);
    popMatrix();
  }
}