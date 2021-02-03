void drawCrosshair(){
  HUD.stroke(white);
  HUD.strokeWeight(5);
  HUD.line(width/2-20,height/2,width/2+20,height/2);
  HUD.line(width/2,height/2-20,width/2,height/2+20);
}
void drawMinimap(){
  HUD.image(map,100,100,200,200);
}
void drawCoords(){
  HUD.fill(0);
  HUD.textSize(50);
  HUD.textAlign(CENTER,CENTER);
  int miniX=int(eyeX+2000)/gridSize;
  int miniZ=int(eyeZ+2000)/gridSize;
  HUD.text("X: "+miniX,displayWidth-200,50);
  HUD.text("Y: "+miniZ,displayWidth-200,100);
  HUD.strokeWeight(0);
  HUD.stroke(255,0,0);
  HUD.fill(255,0,0);
  HUD.rect(miniX*5+50,miniZ*5+50,4,4);
}
void drawBars(){
  HUD.pushMatrix();
  HUD.translate(0,0,0);
  HUD.rectMode(CENTER);
  HUD.textAlign(CENTER,CENTER);
  HUD.fill(hp*5,0,0);
  HUD.stroke(0);
  HUD.strokeWeight(5);
  HUD.rect(displayWidth/2,displayHeight/15,500,50);
  HUD.fill(0,stamina*2.5,0);
  HUD.rect(displayWidth/2,displayHeight/8,500,50);
  HUD.fill(255);
  HUD.textSize(40);
  HUD.text("HP: "+int(hp),displayWidth/2,displayHeight/15);
  HUD.text("Stamina: "+int(stamina),displayWidth/2,displayHeight/8);
  HUD.popMatrix();
}
