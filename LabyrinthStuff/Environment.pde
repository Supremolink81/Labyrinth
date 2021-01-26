void drawMap(int count){
  for(int x=0;x<map.width;x++){
    for(int y=0;y<map.height;y++){
      color c=map.get(x,y);
      if(c==dullblue)for(int i=1;i<=count;i++)texturedCube(x*gridSize-2000,height-gridSize*i,y*gridSize-2000,mossyStone,gridSize);
      if(c==black)objects.add(new Turret(new PVector(x,y)));
    }
  }
}
