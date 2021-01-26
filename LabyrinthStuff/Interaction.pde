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
  if(keyCode==SHIFT)shift=false;
}
void mouseClicked(){
  if(mode==INTRO){
    
  }
  if(mode==GAME){
    
  }
  if(mode==PAUSE){
    
  }
  if(mode==OPTIONS){
    
  }
  if(mode==GAMEOVER){
    
  }
}
