Movil[] moviles;
int cant = 15;
void setup() {
  size(800, 600);
  moviles = new Movil[cant];
  for (int i = 0; i < cant; i++) {
    moviles[i] = new Movil(width/2, height/2);
  }
}
void draw() {
  background(255);
  moviles[cant-1].seguir(mouseX, mouseY);
  for (int i = cant-2; i >= 0; i--) {
    moviles[i].seguir(moviles[i+1].pos.x, moviles[i+1].pos.y);
  }
  for (int i = 0; i < cant; i++) {
    moviles[i].mover();
    moviles[i].mostrar();
  }
}
class Movil {
  PVector pos;
  PVector vel;
  PVector acel;
  int r = 15;
  Movil(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector();
    acel = new PVector();
  }
  void seguir(float x, float y) {
    PVector objetivo = new PVector(x, y);
    PVector fuerza = objetivo.copy();
    fuerza.sub(pos);
    fuerza.normalize();
    fuerza.mult(0.2);
    agregarFuerza(fuerza);
  }
  void agregarFuerza(PVector f) {
    acel.add(f);
  }
  void mover() {
    vel.add(acel);
    vel.limit(4);
    pos.add(vel);
    acel.mult(0);
  }
  void mostrar() {
    fill(0);
    ellipse(pos.x, pos.y, r, r);
  }
}
