void pause(){
  pause.beginDraw();
  pause.textAlign(CENTER,CENTER);
  pause.background(0,0,255);
  pause.fill(255);
  pause.textSize(100);
  pause.text("Paused",displayWidth/2,displayHeight/8);
  pause.textSize(20);
  pause.text("According to all known laws of aviation, there is no way that a bee should be able to fly.\nIts wings are too small to get its fat little body off the ground.\nThe bee, of course, flies anyway, because bees don't care what humans think is impossible.",displayWidth/2,displayHeight/2);
  pause.endDraw();
  image(pause,0,0);
}
