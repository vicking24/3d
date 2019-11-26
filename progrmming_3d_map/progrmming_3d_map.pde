                                                                 //victoria
//nov 4


color black= #000000;
color white= #FFFFFF;

PImage qblock;
PImage map;


PVector direction= new PVector (0, -10);
//direction.setMag =10;
PVector dirlf= new PVector (10, 0);

float rotx=PI/4, roty=PI/4;
int blocksize=100;

boolean up, down, left, right;

float lx=2500, ly= height/2-blocksize/2, lz=2500;
float headangle;

void setup () {
  size (800, 600, P3D);
  qblock =loadImage ("question.jpg");
  map=loadImage ("map.png");
  textureMode (NORMAL);
}

void draw () {
  background (200);
  
 camera (lx, ly,lz, direction.x+lx, ly+0, direction.y+lz,0, 1, 0); 
 direction.rotate (headangle);
 headangle=(pmouseX-mouseX) *0.01;
 dirlf= direction.copy();
 dirlf.rotate (PI/2);
 
 if (up) {
   lz=lz+direction.y;
 lx=lx+direction.x;
 }
 if (down) {
   lz=lz- direction.y;
   lx=lx-direction.x;
   
 }
 if (left) {
   lx=lx-dirlf.x;
   lz=lz-dirlf.y;
 }
 if (right) {
 lx=lx+dirlf.x;
 lz=lz+dirlf.y;
 }
  

 // pushMatrix();

  //rotateX (rotx);
  //rotateY (roty);

  drawground();
  drawmap();

 // popMatrix();
  
  
}

void drawmap() {

  int mapx=0, mapy=0;
  int worldx=0, worldy=0, worldz=0;

  while (mapy<map.height) {
    color pixel= map.get (mapx, mapy);
    if (pixel==black) {

      worldx= mapx*blocksize;
      worldz= mapy*blocksize;
      texturebox (qblock, qblock, qblock, worldx, worldy, worldz, blocksize);
    }

    mapx++;

    if (mapx>map.width) {
      mapx=0;
      mapy++;
    }
  }
}

void drawground () {

  //rotateX (rotx);
  //rotateY (roty);
  stroke (100);
  int x=0;
  int y=0+blocksize;
  while (x<map.width*blocksize) {
    line (x, y, 0, x, y, map.width*blocksize);
    x=x+blocksize;
  }

  int z=0;
  while (z<map.height*blocksize) {
    line (0,y, z, map.height*blocksize, y, z);
    z=z+100;
  }
  
  noStroke();
}
 



void texturebox (PImage top, PImage side, PImage bottom, float x, float y, float z, float size) {  //if you want more than one texture, have 3 PImage and 3 begin/end shape



  pushMatrix();
  translate (x, y, z);

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

  //rotx= rotx+ (pmouseY-mouseY) *0.01;
 // roty= roty+ (pmouseX-mouseX) *0.01;
}

void keyPressed (){
if (keyCode==UP) up=true;
if (keyCode==DOWN) down=true;
if (keyCode==LEFT) left=true;
if (keyCode==RIGHT) right=true;
}

void keyReleased () {
if (keyCode==UP) up=false;
if (keyCode==DOWN) down=false;
if (keyCode==LEFT) left=false;
if (keyCode==RIGHT) right=false;

}