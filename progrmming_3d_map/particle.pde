class particle {
PVector pos;
PVector velocity;
int lives;
int timer;
  
particle (float x, float y, float z, float vx, float vy, float vz) {
  pos = new PVector (x, y, z);
  velocity = new PVector (vx, vy, vz);
lives =1;
timer=0;

}



void show (){
pushMatrix();
translate (pos.x, pos.y, pos.z);
fill (255);
box (7);
popMatrix();





}


void act () {
pos.x=pos.x+velocity.x*4;
pos.y=pos.y+velocity.y*3;
pos.z=pos.z+velocity.z*4;

timer++;
if (timer>100) {
lives=0;
}


}





}
