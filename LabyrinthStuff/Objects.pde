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
    dir=new PVector(focusX-eyeX,focusZ-eyeZ);
    dir.setMag(speed);
  }
  void act(){
    int hitX=int(loc.x+2000)/gridSize;
    int hitY=int(loc.z+2000)/gridSize;
    if(map.get(hitX,hitY)==white){
      loc.x+=dir.x;
      loc.z+=dir.y;
    }
    else{
      lives=0;
      for(int i=0;i<5;i++)objects.add(new Particle(loc));
    }
    if(lives==0)for(int i=0;i<10;i++)objects.add(new Particle(this.loc));
  }
  void show(){
    world.pushMatrix();
    world.translate(loc.x,loc.y,loc.z);
    world.fill(255);
    world.stroke(100);
    world.box(size);
    world.popMatrix();
  }
}

class Particle extends GameObject{
  PVector vel,gravity;
  float speed;
  Particle(PVector loc){
    super();
    lives=255;
    size=5;
    this.loc=loc;
    speed=5;
    float vx=random(-10,10);
    float vy=random(-10,0);
    float vz=random(-10,10);
    vel=new PVector(vx,vy,vz);
    vel.setMag(speed);
    gravity=new PVector(0,1,0);
  }
  void act(){
    loc.add(vel);
    vel.add(gravity);
    lives--;
  }
  void show(){
    world.pushMatrix();
    world.translate(loc.x,loc.y,loc.z);
    world.fill(50,lives);
    world.stroke(100);
    world.box(size);
    world.popMatrix();
  }
}

class Turret extends GameObject{
  PVector dir,turretLoc;
  color c;
  int timer;
  Turret(PVector loc){
    super(loc.x,loc.y,loc.z,50,5);
    turretCount++;
    c=0;
    timer=0;
    turretLoc=new PVector(loc.x,loc.y-40,loc.z);
    dir=new PVector(eyeX-loc.x,eyeZ-loc.z);
    dir.setMag(5);
  }
  void act(){
    for(GameObject obj:objects){
      if(obj instanceof Bullet&&dist(obj.loc.x,obj.loc.z,loc.x,loc.z)<(obj.size/2+size/2)*2){
        lives--;
        obj.lives--;
        c++;
      }
    }
    timer++;
    if(timer>60){
      objects.add(new TurretBullet(loc.copy(),new PVector(-dir.x,-dir.y)));
      println("Hi");
      timer=0;
    }
    dir.x=eyeX-loc.x;
    dir.y=eyeZ-loc.z;
  }
  void show(){
    world.pushMatrix();
    world.fill(c*50);
    world.stroke(0,0,255);
    world.strokeWeight(5);
    world.translate(loc.x,loc.y,loc.z);
    world.box(50);//base
    world.popMatrix();
    
    world.pushMatrix();
    world.fill(c*50);
    world.stroke(0,0,255);
    world.strokeWeight(5);
    world.translate(turretLoc.x,turretLoc.y,turretLoc.z);
    world.rotateY(-dir.heading());
    world.box(30);//top
    world.translate(30,0,0);
    world.box(50,20,20);//gun
    world.popMatrix();
  }
}

class TurretBullet extends GameObject{
  PVector dir;
  float speed,timer;
  int dmg;
  TurretBullet(PVector loc,PVector newDir){
    super(loc.x,loc.y-40,loc.z,10,1);
    speed=20;
    //float vx=cos(newDir.x);
    //float vz=sin(newDir.z);
    //dir=new PVector(vx,vz);
    dmg=int(random(1,3));
    dir=newDir;
    dir.setMag(speed);
  }
  void act(){
    int hitX=int(loc.x+2000)/gridSize;
    int hitY=int(loc.z+2000)/gridSize;
    if(map.get(hitX,hitY)==white||map.get(hitX,hitY)==black){
      loc.x-=dir.x;
      loc.z-=dir.y;
    }
    else if(map.get(hitX,hitY)!=white){
      lives=0;
      for(int i=0;i<5;i++)objects.add(new Particle(loc));
    }
    timer++;
    if(timer>=90)lives=0;
    if(lives==0)for(int i=0;i<30;i++)objects.add(new Particle(this.loc));
  }
  void show(){
    world.pushMatrix();
    world.translate(loc.x,loc.y,loc.z);
    world.fill(0);
    world.stroke(0,0,255);
    world.strokeWeight(5);
    world.box(size);
    world.popMatrix();
  }
}

class TurretParticle extends GameObject{
  PVector vel,gravity;
  float speed;
  TurretParticle(PVector loc){
    super();
    lives=255;
    size=20;
    this.loc=loc;
    speed=10;
    float vx=random(-20,20);
    float vy=random(-20,0);
    float vz=random(-20,20);
    vel=new PVector(vx,vy,vz);
    vel.setMag(speed);
    gravity=new PVector(0,1,0);
  }
  void act(){
    loc.add(vel);
    vel.add(gravity);
    lives-=15;
    if(loc.y>height-50)loc.y=height-50;
  }
  void show(){
    world.pushMatrix();
    world.translate(loc.x,loc.y,loc.z);
    world.fill(255,lives);
    world.stroke(0,0,255,lives);
    world.strokeWeight(5);
    world.box(size);
    world.popMatrix();
  }
}
