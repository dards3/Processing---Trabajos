float[] xs = new float[10];
float[] ys = new float[10];
int cantidad = 0;
int indice = 0;

void setup() {
  size(800, 600);
}

void draw() {
  background(255);

  for (int i = 0; i < cantidad; i++) {
    ellipse(xs[i], ys[i], 20, 20);
  }
}

void mousePressed() {
  if (cantidad < 10) {
  cantidad++;
}
  xs[indice] = mouseX;
  ys[indice] = mouseY;

  indice++;

  if (indice >= 10) {
    indice = 0;
  }
}
