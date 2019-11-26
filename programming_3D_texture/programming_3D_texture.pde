//victoria
//nov 4

PImage qblock;
PImage map;

float rotx=PI/4, roty=PI/4;
int blocksize=100;

void setup () {
size (800, 600, P3D);
qblock =loadImage ("question.jpg");
textureMode (NORMAL);

}

void draw () {
background (0);

for (int x= -1000;x<1000; x=x+200){
  for (int z=-1000; z<0; z=z+200){
  texturebox (qblock, qblock, qblock, x, height/2, z, blocksize);
  }

}



}

void texturebox (PImage top, PImage side, PImage bottom, float x, float y, float z, float size){  //if you want more than one texture, have 3 PImage and 3 begin/end shape



pushMatrix();
translate (x, y, z);
rotateX (rotx);
rotateY (roty);
scale (size);



 //x, y, z, anchorpoint, anchorpoint
//x, y, z is from the center of the image
//anchorpoint starts from top left corner, always 1, -1, or 0

beginShape(QUADS); //group every 4 vertex as one shape
noStroke ();

texture (side);
//1 front face
vertex (-1, -1, -1, 0, 0);
vertex (1, -1, -1, 1, 0);
vertex (1, 1, -1, 1, 1);
vertex (-1, 1, -1, 0, 1);

//-1 back face
vertex (-1, -1, 1, 0, 0);
vertex (1, -1, 1, 1, 0);
vertex (1, 1, 1, 1, 1);
vertex (-1, 1, 1, 0, 1);

//left face
vertex (-1, -1, -1, 0, 0);
vertex (-1, 1, -1, 1, 0);
vertex (-1, 1, 1, 1, 1);
vertex (-1, -1, 1, 0, 1);

//right face
vertex (1, -1, -1, 0, 0);
vertex (1, 1, -1, 1, 0);
vertex (1, 1, 1, 1, 1);
vertex (1, -1, 1, 0, 1);

endShape ();

beginShape (QUADS);
texture (top);
//top face
vertex (-1, 1, -1, 0, 0);
vertex (1, 1, -1, 1, 0);
vertex (1, 1, 1, 1, 1);
vertex (-1, 1, 1, 0, 1);

endShape ();

beginShape (QUADS);
texture (bottom);
//bottom face
vertex (-1, -1, -1, 0, 0);
vertex (1, -1, -1, 1, 0);
vertex (1, -1, 1, 1, 1);
vertex (-1, -1, 1, 0, 1);





endShape();
popMatrix();
}

void mouseDragged() {

rotx= rotx+ (pmouseY-mouseY) *0.01;
roty= roty+ (pmouseX-mouseX) *0.01;

}
