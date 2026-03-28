void setup() {
  size(800, 600);
  background(180, 220, 255);
}

void draw() {

  if (mousePressed) {
    dibujarCasa(mouseX, mouseY, width*0.2, height*0.2);
  }
}

void dibujarCasa(float x, float y, float ancho, float alto) {

  fill(200, 150, 100);
  rect(x, y, ancho, alto);

  // techo
  line(x, y, x + ancho/2, y - alto/2);
  line(x + ancho, y, x + ancho/2, y - alto/2);

  // puerta
  fill(120, 70, 40);
  rect(x + ancho*0.4, y + alto*0.5, ancho*0.2, alto*0.5);

  // las ventanas
  fill(255);
  rect(x + ancho*0.1, y + alto*0.2, ancho*0.2, alto*0.2);
  rect(x + ancho*0.7, y + alto*0.2, ancho*0.2, alto*0.2);
}
