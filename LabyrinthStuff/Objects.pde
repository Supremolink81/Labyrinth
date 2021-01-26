class GameObject{
  PVector loc;
  float size,lives;
  GameObject(){
    loc=new PVector(0,0,0);
    size=10;
    lives=1;
  }
  GameObject(float x,float y,float z,float s,float l){
    loc=new PVector(x,y,z);
    size=s;
    lives=l;
  }
  void act(){
    
  }
  void show(){
    world.pushMatrix();
    world.translate(loc.x,loc.y,loc.z);
    world.fill(white);
    world.stroke(100);
    world.box(size);
    world.popMatrix();
  }
}

class Bullet extends GameObject{
  PVector dir;
  float speed;
  Bullet(){
    super(eyeX,eyeY,eyeZ,10,1);
    speed=50;
    float vx=cos(leftRightAngle);
    float vy=tan(upDownAngle);
    float vz=sin(leftRightAngle);
    dir=new PVector(vx,vy,vz);
    dir.setMag(speed);
  }
  void act(){
    int hitX=int(loc.x+2000)/gridSize;
    int hitY=int(loc.z+2000)/gridSize;
    if(map.get(hitX,hitY)==white)loc.add(dir);
    else{
      lives=0;
      for(int i=0;i<5;i++)objects.add(new Particle(loc));
    }
  }
  void show(){
    
  }
}

class Particle extends GameObject{
  PVector vel,gravity;
  float speed;
  Particle(PVector loc){
    super();
    lives=255;
    this.loc=loc;
    speed=50;
    float vx=random(-5,5);
    float vy=random(-5,0);
    float vz=random(-5,5);
    vel=new PVector(vx,vy,vz);
    vel.setMag(speed);
    gravity=new PVector(0,5,0);
  }
  void act(){
    
  }
  void show(){
    
  }
}

class Turret extends GameObject{
  float rot;
  color c;
  Turret(PVector loc){
    lives=5;
    c=0;
  }
  void act(){
    super();
  }
  void show(){
    pushMatrix();
    translate(loc.x,height-30,loc.z);
    fill(c*50);
    stroke(0,0,255);
    strokeWeight(5);
    popMatrix();
  }
}
