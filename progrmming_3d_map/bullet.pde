class bullet {

  PVector pos, velocity;
int lives;
  int timer;


bullet (float x, float z, float vx, float vz) {


int y=10;
pos =new PVector (x,y,z);
velocity = new PVector (vx, vz);
lives=1;
timer=100;
}

void show (){

pushMatrix();
translate (pos.x,pos.y,pos.z);
fill (0);
if (lives>0){
box (10);
}
popMatrix();


}

void act () {
pos.x=pos.x+ velocity.x*2;
pos.z=pos.z+velocity.y*2;

timer--;
if (timer==0) {
 lives=0;
}


}



}
