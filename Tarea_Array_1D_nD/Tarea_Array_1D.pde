int cant = 20;
float[] barras;

void setup() {
  size(800, 600);
  barras = new float[cant];
}

void draw() {
  background(255);
  float ancho = width / cant;
  for (int i = 0; i < cant; i++) {
    float x = i * ancho;

    fill(0);
    rect(x, height - barras[i], ancho, barras[i]);
  }
  int i = int(mouseX / (width / cant));

  if (i >= 0 && i < cant) {
    barras[i] = height - mouseY;
    barras[i] = constrain(barras[i], 0, height);
  }
}
