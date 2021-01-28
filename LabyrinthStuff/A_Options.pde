void options(){
  options.beginDraw();
  options.background(120);
  options.textAlign(CENTER,CENTER);
  options.rectMode(CENTER);
  options.fill(255);
  options.textSize(100);
  options.text("Options",displayWidth/2,200);
  options.textSize(50);
  options.text("Sensitivity",200,displayHeight/2.3);
  options.text("Lights",300,displayHeight/1.7);
  options.fill(255);
  options.line(200,displayHeight/2,400,displayHeight/2);
  
  if(dist(mouseX,mouseY,sliderX,sliderY)<25){
    options.stroke(0);
    options.strokeWeight(5);
    if(mousePressed)sliderX=mouseX;
  }else{
    options.stroke(255);
    options.strokeWeight(1);
  }
  
  options.circle(sliderX,sliderY,50);
  if(!isLights)options.fill(255,0,0);
  else options.fill(255);
  options.rect(150,displayHeight/1.4,200,100);
  if(isLights)options.fill(0,255,0);
  else options.fill(255);
  options.rect(350,displayHeight/1.4,200,100);
  options.fill(0);
  options.rect(100,displayHeight/1.1,150,60);
  
  if(!isLights)options.fill(0);
  else options.fill(255);
  options.text("Off",150,displayHeight/1.4);
  if(isLights)options.fill(0);
  else options.fill(255);
  options.text("On",350,displayHeight/1.4);
  options.fill(255);
  options.text("Back",100,displayHeight/1.1);
  if(sliderY!=displayHeight/2)sliderY=displayHeight/2;
  if(sliderX>400)sliderX=400;
  if(sliderX<200)sliderX=200;
  options.endDraw();
  image(options,0,0);
}
