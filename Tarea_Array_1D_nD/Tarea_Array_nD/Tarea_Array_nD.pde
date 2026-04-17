int filas = 10;
int cols = 10;
boolean[][][] laberinto; // fila, columna y lado

void setup() {
  size(800, 600);
  laberinto = new boolean[filas][cols][6];
  iniciarLaberinto();
}

void draw() {
  background(255);
  dibujarLaberinto();
}
void iniciarLaberinto() {
  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {
      for (int k = 0; k < 6; k++) {
        laberinto[i][j][k] = random(1) > 0.5;
      }
    }
  }
}
void dibujarLaberinto() {

  float w = width / cols;
  float h = height / filas;

  for (int i = 0; i < filas; i++) {
    for (int j = 0; j < cols; j++) {

      float x = j * w;
      float y = i * h;

      // para los lados
      if (laberinto[i][j][0]) line(x, y, x + w, y);           // arriba
      if (laberinto[i][j][1]) line(x, y + h, x + w, y + h);   // abajo
      if (laberinto[i][j][2]) line(x, y, x, y + h);           // izquierda
      if (laberinto[i][j][3]) line(x + w, y, x + w, y + h);   // derecha

      // para las diagonales
      if (laberinto[i][j][4]) line(x, y, x + w, y + h);
      if (laberinto[i][j][5]) line(x + w, y, x, y + h);
    }
  }
}
