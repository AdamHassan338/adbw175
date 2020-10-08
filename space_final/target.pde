class target{
  
  PImage alien;
  PVector recPos;
  PVector recPos2;
  float size = 50;
  boolean passed= false;
  
  
  
  target(){
    alien = loadImage("alien.png");
    recPos = new PVector(random(0,width-size),-size);
    
  
  }
 
  void draw(){
    
    image(alien, recPos.x, recPos.y, size, size);
    //fill(255,0,255);
    //noStroke();
    //circle(recPos.x,recPos.y,50);

  }
  
  void move(){
      
    if(recPos.y<=height+size){
      recPos.y+=2; 
    }
    else{
      recPos = new PVector(random(0,width-size),-size);
      passed=true;
    }
  }


  void respawn(){
    recPos = new PVector(random(0,width-size),-size);
    
  }
  
}
