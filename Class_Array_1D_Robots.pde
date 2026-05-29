class Movil{
  PVector pos, vel;
  int r = 30;
 
  Movil (float x, float y){
    pos = new PVector (x, y);
    vel = new PVector (0, 1);
  }
  void mover (){
    pos.add (vel);
    contener();
  }
  void mostrar(){
    ellipse (pos.x, pos.y, r, r);
  }
  void contener(){
    if (pos.x < 0 || pos.x > width){
      pos.sub (vel);
      vel.x = vel.x * -1;
    }
    if (pos.y < 0 || pos.y > height){
      vel.y = vel.y * -1;
    }
  }
}
Movil [] moviles;
int cant = 10;
void setup(){
  size (800, 600);
   int sep = width/cant;
   println(sep);
   frameRate(60);
  moviles = new Movil [cant];

  for (int i = 0; i < cant; i++){
    moviles[i] = new Movil (sep * i, 0);
  }
}
void draw(){
  background(0, 255, 0);
  for (int i = 0; i < cant; i++){
    moviles [i].mover();
    moviles [i].mostrar();
  }
}
