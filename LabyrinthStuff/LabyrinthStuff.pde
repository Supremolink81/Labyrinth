import java.awt.Robot;

boolean w,a,s,d,shift;
float eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ;
float leftRightAngle,upDownAngle,sprint;

PGraphics world,menu,HUD;
PImage mossyStone,woodPlank;
int gridSize;

final int INTRO=0,GAME=1,PAUSE=2,OPTIONS=3,GAMEOVER=4;
int mode=0;

color black=#000000;
color white=#FFFFFF;
color dullblue=#7092BE;
PImage map;

ArrayList<GameObject> objects;

Robot rbt;

void setup(){
  world=createGraphics(displayWidth,displayHeight,P3D);
  HUD=createGraphics(displayWidth,displayHeight,P2D);
  menu=createGraphics(displayWidth,displayHeight,P2D);
  noCursor();
  pointLight(255,255,255,eyeX,eyeY,eyeZ);
  size(displayWidth,displayHeight,P2D);
  leftRightAngle=0;
  upDownAngle=0;
  eyeX=width/2;
  eyeY=9*height/10;
  eyeZ=height/2;
  gridSize=100;
  map=loadImage("map.png");
  try{
    rbt=new Robot();
  }catch(Exception e){
    e.printStackTrace();
  }
  upX=0;
  upY=1;
  upZ=0;
  mossyStone=loadImage("Mossy_Stone_Bricks.png");
  woodPlank=loadImage("Oak_Planks.png");
  objects=new ArrayList<GameObject>();
}

void draw(){
  if(mode==INTRO)intro();
  if(mode==GAME)game();
  if(mode==PAUSE)pause();
  if(mode==OPTIONS)options();
  if(mode==GAMEOVER)gameOver();
}
void drawSurface(int start,int end,int dist,int Height){
  stroke(255);
  strokeWeight(0.5);
  for(int i=start;i<end;i+=dist)for(int j=start;j<end;j+=dist)texturedCube(i,Height,j,woodPlank,dist);
}
void drawInterface(){
  
}
void insta(GameObject obj){
  obj.act();
  obj.show();
}
