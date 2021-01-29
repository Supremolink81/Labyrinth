import java.awt.Robot;

boolean w,a,s,d,p,shift;
float eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ;
float leftRightAngle,upDownAngle,sprint;

PGraphics menu,world,pause,options,over,HUD;
PImage mossyStone,woodPlank;
int gridSize;

final int INTRO=0,GAME=1,PAUSE=2,OPTIONS=3,GAMEOVER=4;
int mode=0;

color black=#000000;
color white=#FFFFFF;
color dullblue=#7092BE;
PImage map;

ArrayList<GameObject> objects;

float sliderX,sliderY,sensitivity;
boolean isLights;

Robot rbt;

void setup(){
  
  world=createGraphics(displayWidth,displayHeight,P3D);
  HUD=createGraphics(displayWidth,displayHeight,P2D);
  menu=createGraphics(displayWidth,displayHeight,P2D);
  pause=createGraphics(displayWidth,displayHeight,P2D);
  options=createGraphics(displayWidth,displayHeight,P2D);
  over=createGraphics(displayWidth,displayHeight,P2D);
  pointLight(255,255,255,eyeX,eyeY,eyeZ);
  size(displayWidth,displayHeight,P2D);
  rectMode(CENTER);
  
  leftRightAngle=0;
  upDownAngle=0;
  eyeX=width/2;
  eyeY=9*height/10;
  eyeZ=height/2;
  upX=0;
  upY=1;
  upZ=0;
  sensitivity=map(sliderX,200,400,0.01,0.03);
  
  sliderX=300;
  sliderY=displayHeight/2;
  isLights=false;
  
  gridSize=100;
  map=loadImage("map.png");
  try{
    rbt=new Robot();
  }catch(Exception e){
    e.printStackTrace();
  }
  
  mossyStone=loadImage("Mossy_Stone_Bricks.png");
  woodPlank=loadImage("Oak_Planks.png");
  objects=new ArrayList<GameObject>();
  
  for(int x=0;x<map.width;x++){
    for(int y=0;y<map.height;y++){
      color c=map.get(x,y);
      if(c==black){
        objects.add(new Turret(new PVector(x*gridSize-2000,displayHeight-45,y*gridSize-2000)));
        println("Hi");
      }
    }
  }
}

void draw(){
  if(mode==INTRO)intro();cursor(ARROW);
  if(mode==GAME)game();noCursor();
  if(mode==PAUSE)pause();cursor(ARROW);
  if(mode==OPTIONS)options();cursor(ARROW);
  if(mode==GAMEOVER)gameOver();cursor(ARROW);
}
void drawSurface(int start,int end,int dist,int Height){
  stroke(255);
  strokeWeight(0.5);
  for(int i=start;i<end;i+=dist)for(int j=start;j<end;j+=dist)texturedCube(i,Height,j,woodPlank,dist);
}
void insta(GameObject obj){
  obj.act();
  obj.show();
}
