int cantfil = 15;
int cantcol = 9;

boolean [][] estados;

void setup () {
  size(800, 600);
  estados = new boolean[cantfil][cantcol];
}

void draw() {

  float ancho = width / cantfil;
  float alto = height / cantcol;

  for (int i = 0; i < cantfil; i++) {
    for (int j = 0; j < cantcol; j++) {

      float x = i * ancho;
      float y = j * alto;

      if (estados[i][j] == false) {
        fill(255);
        rect(x, y, ancho, alto);
      } else {
        dibujarEstampa(x, y, ancho, alto);
      }
    }
  }
}

void mousePressed() {

  float ancho = width / cantfil;
  float alto = height / cantcol;

  int i = int(mouseX / ancho);
  int j = int(mouseY / alto);

  if (i >= 0 && i < cantfil && j >= 0 && j < cantcol) {
    estados[i][j] = true;
  }
}
void dibujarEstampa(float x, float y, float w, float h) {

  fill(0);
  rect(x, y, w, h);

  stroke(255);
  line(x, y, x + w, y + h);
  line(x + w, y, x, y + h);
}
