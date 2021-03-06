void keyPressed(){
  if(key=='w'||key=='W')w=true;
  if(key=='a'||key=='A')a=true;
  if(key=='s'||key=='S')s=true;
  if(key=='d'||key=='D')d=true;
  if(keyCode==SHIFT)shift=true;
}
void keyReleased(){
  if(key=='w'||key=='W')w=false;
  if(key=='a'||key=='A')a=false;
  if(key=='s'||key=='S')s=false;
  if(key=='d'||key=='D')d=false;
  if(key=='p'||key=='P'){
    if(mode==GAME){
      mode=PAUSE;
    }else if(mode==PAUSE){
      mode=GAME;
    }
  }
  if(keyCode==SHIFT)shift=false;
}
void mouseClicked(){
  if(mode==INTRO){
    if(mouseX>displayWidth/2-125&&mouseX<displayWidth/2+125&&mouseY>displayHeight/2-35&&mouseY<displayHeight/2+35){
      mode=GAME;
    }
    if(mouseX>displayWidth/2-125&&mouseX<displayWidth/2+125&&mouseY>displayHeight/1.6-35&&mouseY<displayHeight/1.6+35)mode=OPTIONS;
    if(mouseX>displayWidth/2-125&&mouseX<displayWidth/2+125&&mouseY>displayHeight/1.3-35&&mouseY<displayHeight/1.3+35)exit();
  }
  if(mode==GAME){
    objects.add(new Bullet());
  }
  if(mode==PAUSE){
    
  }
  if(mode==OPTIONS){
    if(mouseX>50&&mouseX<250&&mouseY>displayHeight/1.4-50&&mouseY<displayHeight/1.4+50)isLights=false;
    if(mouseX>250&&mouseX<450&&mouseY>displayHeight/1.4-50&&mouseY<displayHeight/1.4+50)isLights=true;
    if(mouseX>25&&mouseX<175&&mouseY>displayHeight/1.1-30&&mouseY<displayHeight/1.1+30)mode=INTRO;
  }
  if(mode==GAMEOVER){
    if(mouseX>displayWidth/2-200&&mouseX<displayWidth/2+200&&mouseY>displayHeight/2-50&&mouseY<displayHeight/2+50){
      setup();
      mode=INTRO;
    }
  }
}
