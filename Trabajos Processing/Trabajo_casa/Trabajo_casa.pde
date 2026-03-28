void setup() {
  size(800, 600);
}

void draw() {
  background(180, 220, 255); 

  dibujarPiso();
  dibujarCasa(width*0.4, height*0.5);
}

// piso
void dibujarPiso() {
  fill(100, 200, 100);
  rect(0, height*0.75, width, height*0.25);
}

// casa
void dibujarCasa(float x, float y) {
  float ancho = width*0.2;
  float alto = height*0.25;

  fill(200, 150, 100);
  rect(x, y, ancho, alto);

  // techo 
  line(x, y, x + ancho/2, y - alto*0.5);
  line(x + ancho, y, x + ancho/2, y - alto*0.5);

  // puerta
  fill(120, 70, 40);
  rect(x + ancho*0.4, y + alto*0.5, ancho*0.2, alto*0.5);

  // ventana
  fill(255);
  rect(x + ancho*0.1, y + alto*0.2, ancho*0.2, alto*0.2);
}
