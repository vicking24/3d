class firework {
PVector pos, velocity;
int lives;
  
  
  firework (float x, float y, float z, float vy) {
 pos= new PVector (x, y, z);
 velocity = new PVector (random(-5,5), vy, random(-5,5));
 lives=1;
  
  }
  
  void show () {
pushMatrix();
translate (pos.x,pos.y,pos.z);
fill (#FF0A0A);
if (lives>0) {
box (20);
}
popMatrix();

  
  
  }


void act() {

velocity.y =velocity.y-1;
  pos.add(velocity);
  if (pos.y<-1000){
    lives=0;
  }


}


}
