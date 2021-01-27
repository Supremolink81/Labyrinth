void intro(){
  menu.beginDraw();
  menu.textAlign(CENTER,CENTER);
  menu.rectMode(CENTER);
  menu.background(255);
  menu.textSize(100);
  menu.text("Turretmania",displayWidth/2,200);
  menu.textSize(50);
  menu.fill(255);
  menu.stroke(0);
  menu.strokeWeight(5);
  menu.rect(displayWidth/2,displayHeight/2,250,70);
  menu.rect(displayWidth/2,displayHeight/1.6,250,70);
  menu.rect(displayWidth/2,displayHeight/1.3,250,70);
  menu.fill(0);
  menu.text("Play Game",displayWidth/2,displayHeight/2);
  menu.text("Options",displayWidth/2,displayHeight/1.6);
  menu.text("Exit Game",displayWidth/2,displayHeight/1.3);
  menu.rect(200,displayHeight/2,100,100);
  menu.rect(200,displayHeight/2-70,60,60); //right turret
  menu.rect(240,displayHeight/2-70,100,20);
  menu.rect(displayWidth-200,displayHeight/2,100,100);
  menu.rect(displayWidth-200,displayHeight/2-70,60,60); //left turret
  menu.rect(displayWidth-240,displayHeight/2-70,100,20);
  menu.endDraw();
  
  image(menu,0,0);
}
