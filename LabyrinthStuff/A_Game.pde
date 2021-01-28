void game(){
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(0);
  world.camera(eyeX,eyeY,eyeZ,focusX,focusY,focusZ,upX,upY,upZ);
  moveCam();
  drawSurface(-2000,2000,100,height);
  drawSurface(-2000,2000,100,height-gridSize*4);
  drawMap(5);
  drawInterface();
  for(GameObject obj:objects){
    insta(obj);
  }
  for(int i=0;i<objects.size();i++){
    GameObject obj=objects.get(i);
    if(obj.lives>=0){println("Dead");objects.remove(i);}
  }
  if(p)mode=PAUSE;
  if(isLights)world.pointLight(255,255,255,eyeX,eyeY,eyeZ);
  else if(!isLights)world.noLights();
  world.endDraw();
  image(world,0,0);
  
  HUD.beginDraw();
  HUD.clear();
  drawCrosshair();
  drawMinimap();
  drawCoords();
  HUD.endDraw();
  
  image(HUD,0,0);
}
