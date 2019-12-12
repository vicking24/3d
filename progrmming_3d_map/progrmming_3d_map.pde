//victoria                                                                 //victoria
//nov 4


color black= #000000;
color white= #FFFFFF;

PImage qblock;
PImage map;

int shottimer=0, threshold=30;

PVector direction= new PVector (0, -10);
//direction.setMag =10;
PVector dirlf= new PVector (10, 0);

float rotx=PI/4, roty=PI/4;
int blocksize=100;


boolean up, down, left, right, enter, fire;

float lx=2500, ly= height/2-blocksize/2, lz=2500;
float headangle;

ArrayList <bullet> mybullet;
ArrayList <rain> myrain;
ArrayList <snow> mysnow;

ArrayList <firework> myfirework;


void setup () {
  size (800, 600, P3D);
  qblock =loadImage ("question.jpg");
  map=loadImage ("map.png");
  textureMode (NORMAL);
  mybullet= new ArrayList <bullet>(100); //# is to reserve space for bullets
  myrain= new ArrayList <rain> (1000);
  mysnow= new ArrayList <snow> (1000);
  myfirework= new ArrayList <firework> ();
}

void draw () {
  background (200);

  camera (lx, ly, lz, direction.x+lx, ly, direction.y+lz, 0, 1, 0); 
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
  bul();
  rai();
  sno();
  firewor();

  // popMatrix();
}

void firewor() {
  int p=0;
  while (p<myfirework.size() ) {
    firework f= myfirework.get (p);
    f.show();
    f.act ();
if (f.lives==0) {
myfirework.remove(p);
}else {
    p++;
  }
  }

  if (enter) {
    myfirework.add (new firework (2500, ly+blocksize, 2500, 0));
  }
}

void sno () {

  int m=0;
  while (m<mysnow.size()) {
    snow s= mysnow.get (m);
    s.show ();
    s.act ();
    if (s.lives==0) {
      mysnow.remove (m);
    } else {
      m++;
    }
  }

  int n=0;
  while (n <8) {
    mysnow.add (new snow (random (0, 5000), ly-1000, random (0, 5000), 0));
    n++;
  }
}

void rai () {

  int j=0;
  while (j<myrain.size()) {
    rain r= myrain.get (j);
    r.show ();
    r.act ();

    if (r.lives==0) {
      myrain.remove (j);
    } else {
      j++;
    }
  }
  int k=0;
  while (k <50) {
    myrain.add (new rain (random (0, 5000), ly-1000, random (0, 5000), 0));
    k++;
  }
}

void bul() {


  int i=0;
  while (i<mybullet.size() ) {
    bullet b= mybullet.get (i);
    b.show();
    b.act();

if (b.lives==0) {
mybullet.remove (i);
} else {
    i++;
  }
  }


  shottimer++;
  if (fire && shottimer>threshold) {
    mybullet.add (new bullet (lx, lz, direction.x, direction.y));
    shottimer=0;
  }
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
    line (0, y, z, map.height*blocksize, y, z);
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

void mousePressed () {
  fire=true;
}

void mouseReleased () {
  fire=false;
}

void keyPressed () {
  if (keyCode==UP) up=true;
  if (keyCode==DOWN) down=true;
  if (keyCode==LEFT) left=true;
  if (keyCode==RIGHT) right=true;
  if (key==' ') enter=true;
}

void keyReleased () {
  if (keyCode==UP) up=false;
  if (keyCode==DOWN) down=false;
  if (keyCode==LEFT) left=false;
  if (keyCode==RIGHT) right=false;
  if (key==' ') enter=false;
}
