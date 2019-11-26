//victoria
//oct 29

// x, y, z

// camera has a location, direction, and tilt
//location is place
//direction is where the camera points, it will always face one point
//tilt is for image to look sideways
//camera (lx,ly,lz, dx, dy, dz, tx, ty, tz);

// radians
//2 pi is 360
// pi is 180
// PI, TWO_PI, HALF_PI ...
//radians (360) = TWO_PI

//3d programming mode is already centered

PImage pumpkin;

void setup() {
size (800, 600, P3D);
imageMode (CENTER);

pumpkin =loadImage ("pumpkin.png");

}

void draw() {
  background (150);
 // float angle = map (mouseX, 0, width, 0, TWO_PI);
 float angle2= map (mouseY, 0, height, 0, TWO_PI);
  
 // noFill ();
 // pushMatrix ();
 // translate (width/2, height/2);
  rotateX (angle2); //rotateY, rotateZ
 //rotateY (angle); //around y-axis
  
 // image (pumpkin, 0,0);
  //box (100, 50, 150); //width, height, length
 // sphere (100);
  
  //popMatrix ();
  
  grid ();



}

void grid () {
int i=0;
while (i<width) {
line (0, i, height, i);
i=i+20;
}

int j=0;
while (j<height) {
line (j, 0, j, width);
j=j+20;

}
  
}
