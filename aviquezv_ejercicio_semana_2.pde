/*Modificado por Andres Viquez
 */
int nBolas =5;
float [][] bolas = new float[nBolas][2];
float x, y;

void setup() {
  size(600, 600);
  noCursor();
  smooth();
  colorMode(RGB, 255, 255, 255);
  for (int i=0;i<nBolas;i++) {
    bolas[i][0]=random(width);
    bolas[i][1]=random(width);
  }
  x= width/2;
  y= width/2;
}
 
void draw() {
  noStroke();
  background(255);
  fill(116, 255, 255);
  ellipse(mouseX, mouseY, 40, 40);//dibuja la elipse del mouse
  fill(100, 200, 255, 100);
  for (int i=0;i<nBolas;i++) {
    float distancia = sqrt(sq(mouseX-bolas[i][0])+sq(mouseY-bolas[i][1]));
    fill(bolas[i][0] % 256,bolas[i][1] % 256,(bolas[i][0] + bolas[i][1]) % 256);
    noStroke();
    ellipse(bolas[i][0], bolas[i][1], 40-(mouseX-x),40-(mouseY-y));   
    if(distancia<200){
     strokeWeight(2);
     stroke(131,200,255,100);
     line(mouseX,mouseY,bolas[i][0],bolas[i][1]);
     bolas[i][1]+=(mouseY-bolas[i][1])/(i*50);
    }
    bolas[i][0]+=(mouseX-bolas[i][0])/(i*50);
    x+=(mouseX-x)/250;
    y+=(mouseY-y)/250;
  }
}