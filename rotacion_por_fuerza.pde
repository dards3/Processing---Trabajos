Movil m;
void setup() {
  size(800, 600);
  rectMode(CENTER);
  m = new Movil(width/2, height/2);
}
void draw() {
  background(255);
  PVector fuerza = new PVector(0.05, 0);
  m.agregarFuerza(fuerza);
  m.mover();
  m.mostrar();
}
class Movil {
  PVector pos, vel, acel;
  float angulo;
  Movil(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector();
    acel = new PVector();
  }
  void agregarFuerza(PVector f) {
    acel.add(f);
  }
  void mover() {
    vel.add(acel);
    pos.add(vel);
    angulo += vel.mag() * 0.05;
    acel.mult(0);
  }
  void mostrar() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angulo);
    rect(0, 0, 80, 40);
    popMatrix();
  }
}
