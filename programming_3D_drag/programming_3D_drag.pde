//victoria
//nov 4

PImage qblock;
float rotx=PI/4, roty=PI/4;

void setup () {
size (800, 600, P3D);
imageMode(CENTER);

qblock= loadImage ("question.jpg");
}

void draw () {
background (0);

pushMatrix();
translate (width/2, height/2);
rotateX (rotx);
rotateY (roty);
box(100);
popMatrix();

}

void mouseDragged() {

rotx= rotx+ (pmouseY-mouseY) *0.01;
roty= roty+ (pmouseX-mouseX) *0.01;

}
