Movil a;
Movil b;
void setup() {
  size(800, 600);
  a = new Movil(250, 100);
  b = new Movil(550, 100);
}
void draw() {
  background(255);
  PVector gravedad = new PVector(0, 0.1);
  a.agregarFuerza(gravedad);
  b.agregarFuerza(gravedad);
  a.mover();
  b.mover();
  if (a.colision(b)) {
    a.alejar(b.pos, 3);
    b.alejar(a.pos, 3);
    a.r -= 1;
    b.r -= 1;
  }
  a.mostrar();
  b.mostrar();
}
class Movil {
  PVector pos, vel, acel;
  float r = 50;
  Movil(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(
      random(-2, 2),
      0
      );
    acel = new PVector();
  }
  void agregarFuerza(PVector f) {
    acel.add(f);
  }
  void alejar(PVector otro, float cuanto) {
    PVector r = pos.copy();
    r.sub(otro);
    r.normalize();
    r.mult(cuanto);
    agregarFuerza(r);
  }
  void mover() {
    vel.add(acel);
    pos.add(vel);
    acel.mult(0);
    if (pos.y > height-r/2) {
      pos.y = height-r/2;
      vel.y *= -0.8;
    }
  }
  boolean colision(Movil otro) {
    float d =
      dist(pos.x, pos.y,
      otro.pos.x, otro.pos.y);
    return d < r/2 + otro.r/2;
  }
  void mostrar() {
    ellipse(pos.x, pos.y, r, r);
  }
}
