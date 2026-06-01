class Movil {

  PVector pos, vel;

  int fila, columna;

  float w, h;
  int r = 15;

  Movil(int f, int c, float ancho, float alto) {

    fila = f;
    columna = c;

    w = ancho;
    h = alto;

    float x = columna * w + w/2;
    float y = fila * h + h/2;

    pos = new PVector(x, y);

    vel = new PVector(
      random(1, 3) * (random(1) < 0.5 ? -1 : 1),
      random(1, 3) * (random(1) < 0.5 ? -1 : 1)
      );
  }

  void mover() {

    pos.add(vel);

    float izquierda = columna * w;
    float derecha = izquierda + w;

    float arriba = fila * h;
    float abajo = arriba + h;

    if (pos.x - r/2 <= izquierda) {
      pos.x = izquierda + r/2;
      vel.x *= -1;
    }

    if (pos.x + r/2 >= derecha) {
      pos.x = derecha - r/2;
      vel.x *= -1;
    }

    if (pos.y - r/2 <= arriba) {
      pos.y = arriba + r/2;
      vel.y *= -1;
    }

    if (pos.y + r/2 >= abajo) {
      pos.y = abajo - r/2;
      vel.y *= -1;
    }
  }

  void mostrar() {

    fill(255);
    rect(columna * w, fila * h, w, h);

    fill(0, 100, 255);
    ellipse(pos.x, pos.y, r, r);
  }
}

Movil[][] moviles;

int filas = 2;
int columnas = 3;

float cW;
float cH;

void setup() {

  size(800, 600);

  cW = width / float(columnas);
  cH = height / float(filas);

  moviles = new Movil[filas][columnas];

  for (int i = 0; i < filas; i++) {

    for (int j = 0; j < columnas; j++) {

      moviles[i][j] = new Movil(i, j, cW, cH);
    }
  }
}

void draw() {

  background(180);

  for (int i = 0; i < filas; i++) {

    for (int j = 0; j < columnas; j++) {

      moviles[i][j].mover();
      moviles[i][j].mostrar();
    }
  }
}
