class rain {
PVector pos, velocity;
int lives;

rain (float x, float y, float z, float vy) {
pos = new PVector (x,y,z);
velocity= new PVector (0, vy);
lives=1;


}

void show (){

  
pushMatrix();
translate (pos.x,pos.y,pos.z);
fill (#729DD8);
if (lives>0) {
box (20);
}
popMatrix();

}

void act () {
  velocity.y =velocity.y+10;
  pos.add(velocity);
  
  if (pos.y>180){
  lives=0;
  }







}



}
