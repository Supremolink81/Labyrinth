boolean canMoveForward(){
  float fwdX,fwdY,fwdZ;
  int mapX,mapY;
  fwdX=eyeX+cos(leftRightAngle)*150;
  fwdY=eyeY;
  fwdZ=eyeZ+sin(leftRightAngle)*150;
  mapX=int(fwdX+2000)/gridSize;
  mapY=int(fwdZ+2000)/gridSize;
  if(map.get(mapX,mapY)==white)return true;
  return false;
}
boolean canMoveBackward(){
  float fwdX,fwdY,fwdZ;
  int mapX,mapY;
  fwdX=eyeX-cos(leftRightAngle)*150;
  fwdY=eyeY;
  fwdZ=eyeZ-sin(leftRightAngle)*150;
  mapX=int(fwdX+2000)/gridSize;
  mapY=int(fwdZ+2000)/gridSize;
  if(map.get(mapX,mapY)==white)return true;
  return false;
}
boolean canMoveLeft(){
  float fwdX,fwdY,fwdZ;
  int mapX,mapY;
  fwdX=eyeX+cos(leftRightAngle+degrees(-HALF_PI))*150;
  fwdY=eyeY;
  fwdZ=eyeZ+sin(leftRightAngle+degrees(-HALF_PI))*150;
  mapX=int(fwdX+2000)/gridSize;
  mapY=int(fwdZ+2000)/gridSize;
  if(map.get(mapX,mapY)==white)return true;
  return false;
}
boolean canMoveRight(){
  float fwdX,fwdY,fwdZ;
  int mapX,mapY;
  fwdX=eyeX+cos(leftRightAngle+degrees(HALF_PI))*150;
  fwdY=eyeY;
  fwdZ=eyeZ+sin(leftRightAngle+degrees(HALF_PI))*150;
  mapX=int(fwdX+2000)/gridSize;
  mapY=int(fwdZ+2000)/gridSize;
  if(map.get(mapX,mapY)==white)return true;
  return false;
}
void moveCam(){
  if(shift){
    if(stamina>0&&staminaRegen==1){
      sprint=30;
      stamina--;
    }else if(stamina==0){
      staminaRegen=0.6;
    }else if(stamina==100){
      staminaRegen=1;
    }else if(stamina<0){
      stamina=0;
    }
  }else{
    sprint=10;
    stamina+=staminaRegen;
    if(stamina>100){
      stamina=100;
    }
  }
  if(w&&canMoveForward()){
    eyeX+=cos(leftRightAngle)*sprint;
    eyeZ+=sin(leftRightAngle)*sprint;
  }
  if(a&&canMoveLeft()){
    eyeX+=cos(leftRightAngle-PI/2)*10;
    eyeZ+=sin(leftRightAngle-PI/2)*10;
  } 
  if(s&&canMoveBackward()){
    eyeX-=cos(leftRightAngle)*10;
    eyeZ-=sin(leftRightAngle)*10;
  }
  if(d&&canMoveRight()){
    eyeX+=cos(leftRightAngle+PI/2)*10;
    eyeZ+=sin(leftRightAngle+PI/2)*10;
  }
  focusX=eyeX+cos(leftRightAngle)*300;
  focusY=eyeY+tan(upDownAngle)*300;
  focusZ=eyeZ+sin(leftRightAngle)*300;
  leftRightAngle+=(mouseX-pmouseX)*0.01;
  upDownAngle+=(mouseY-pmouseY)*0.01;
  if(upDownAngle>PI/2.5)upDownAngle=PI/2.5;
  if(upDownAngle<-PI/2.5)upDownAngle=-PI/2.5;
  if(mouseX>width-2)rbt.mouseMove(3,mouseY);
  if(mouseX<2)rbt.mouseMove(width-3,mouseY);
}
