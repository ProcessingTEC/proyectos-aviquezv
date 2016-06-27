//Tomas de Camino Beck

import processing.serial.*;
Serial port;
String data;
float[] val = new float[2];
int posX = 0;

void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista
  port = new Serial(this, "COM6", 9600);
  port.bufferUntil('\n');  //clear the buffer
  size(600, 600);
  background(255);
}

void draw() {
  
  stroke(random(val[0] % 256), random(val[0] % 256), random(val[0] % 256));
  line(posX, 300, posX, val[1]);
  text(val[1], 10, 30);
  if (posX < 600) {
    posX++;
  }
  else {
    posX = 0;
    background(255);
  }
}

void serialEvent(Serial port) {
  data = port.readString();
  String[] list = split(data, ',');
  val[0]=float(list[0]);
  val[1]=float(list[1]); 
}