class snow {
PVector pos, velocity;
int lives;

snow (float x, float y, float z, float vy) {
pos = new PVector (x,y,z);
velocity= new PVector (0, vy);
lives=1;




}

void show (){

  
pushMatrix();
translate (pos.x,pos.y,pos.z);
fill (255);
if (lives>0) {
box (20);
}
popMatrix();

}

void act () {
  velocity.y =velocity.y+0.03;
  pos.add(velocity);
  
  if (pos.y>150){
  lives=0;
  }







}



}
