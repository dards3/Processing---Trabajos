Movil a;
Movil b;
void setup() {
  size(800, 600);
  a = new Movil(100, 300);
  b = new Movil(700, 300);
}
void draw() {
  background(255);
  a.moverLibre();
  b.perseguir(a.pos);
  a.mover();
  b.mover();
  a.mostrar();
  b.mostrar();
}
class Movil {
  PVector pos, vel, acel;
  int r = 30;
  Movil(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(
      random(-2, 2),
      random(-2, 2)
      );
    acel = new PVector();
  }
  void perseguir(PVector otro) {
    PVector r = otro.copy();
    r.sub(pos);
    r.normalize();
    r.mult(0.1);
    agregarFuerza(r);
  }
  void agregarFuerza(PVector f) {
    acel.add(f);
  }
  void mover() {
    vel.add(acel);
    pos.add(vel);
    acel.mult(0);
  }
  void moverLibre() {
    pos.add(vel);
    if (pos.x < 0 || pos.x > width) vel.x *= -1;
    if (pos.y < 0 || pos.y > height) vel.y *= -1;
  }
  void mostrar() {
    ellipse(pos.x, pos.y, r, r);
  }
}
