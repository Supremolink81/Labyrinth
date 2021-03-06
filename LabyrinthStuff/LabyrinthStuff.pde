import java.awt.Robot;
int turretCount = 0;
boolean w,a,s,d,p,shift;
float eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ;
float leftRightAngle,upDownAngle,sprint,hp,stamina,staminaRegen;

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
String overMsg;
color overColor;

Robot rbt;

void setup(){
  
  world=createGraphics(displayWidth,displayHeight,P3D);
  HUD=createGraphics(displayWidth,displayHeight,P2D);
  menu=createGraphics(displayWidth,displayHeight,P2D);
  pause=createGraphics(displayWidth,displayHeight,P2D);
  options=createGraphics(displayWidth,displayHeight,P2D);
  over=createGraphics(displayWidth,displayHeight,P2D);
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
  sensitivity=map(sliderX,displayWidth/8.0,displayWidth/6.0,0.01,0.03);
  sprint=10;
  hp=50;
  stamina=100;
  staminaRegen=1;
  sliderX=displayWidth/8.0-1;
  sliderY=displayHeight/2.0;
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
      }
    }
  }
}

void draw(){
  if(mode==INTRO){intro();cursor(ARROW);}
  else if(mode==GAME){game();noCursor();}
  else if(mode==PAUSE){pause();cursor(ARROW);}
  else if(mode==OPTIONS){options();cursor(ARROW);}
  else if(mode==GAMEOVER){gameOver();cursor(ARROW);}
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
