void game(){
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(0);
  world.camera(eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ);
  moveCam();
  drawSurface(-2000,2000,100,height);
  drawSurface(-2000,2000,100,height-gridSize*4);
  drawMap(5);
  for(int i=0;i<objects.size();i++){
    GameObject obj=objects.get(i);
    if(obj.lives<=0){
      println("Dead");
      objects.remove(i);
      if(obj instanceof Turret)turretCount--;
    }
    if(obj instanceof TurretBullet&&dist(obj.loc.x,obj.loc.z,eyeX,eyeZ)<5){
      hp-=int(random(9,14));
      obj.lives=0;
    }
    else{
      insta(obj);
    }
  }
  if(p)mode=PAUSE;
  if(isLights)world.pointLight(255,255,255,eyeX,eyeY,eyeZ);
  else if(!isLights)world.noLights();
  if(hp<=0){
    overMsg="You lose!";
    overColor=#5F0C0C;
    mode=GAMEOVER;
  }else if(turretCount==0){
    overMsg="You win!";
    overColor=#008E06;
    mode=GAMEOVER;
  }
  world.endDraw();
  image(world,0,0);
  
  HUD.beginDraw();
  HUD.clear();
  HUD.rectMode(CENTER);
  HUD.imageMode(CENTER);
  drawCrosshair();
  drawMinimap();
  drawCoords();
  drawBars();
  HUD.endDraw();
  image(HUD,0,0);
  
  println(turretCount);
}
