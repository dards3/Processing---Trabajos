int cantfil = 15;
int cantcol = 9;

float [][] distancias;

void setup () {
  size(800, 600);
  distancias = new float[cantfil][cantcol];
}

void draw() {

  float ancho = width / cantfil;
  float alto = height / cantcol;

  for (int i = 0; i < cantfil; i++) {
    for (int j = 0; j < cantcol; j++) {

      float x = i * ancho;
      float y = j * alto;

      float cx = x + ancho/2;
      float cy = y + alto/2;

      float d = dist(mouseX, mouseY, cx, cy);

      distancias[i][j] = d;

      float gris = map(d, 0, width, 255, 0);

      fill(gris);
      rect(x, y, ancho, alto);
    }
  }
}
