class laser{
  
  PVector lzPos;
  PVector lzPos2;
  boolean state;
  
  
  laser(){
    
    lzPos = new PVector(pos.x,pos.y);
    lzPos2 = new PVector(pos.x,pos.y-50);
    
    //state=false;
    
    
  }
  
  
  void shoot(float x,float y){
      lzPos.x=x;
      lzPos.y=y;
      lzPos2.x=x;
      lzPos2.y=y-50;
    
      stroke(255,0,0);
      strokeWeight(10);
      line(lzPos.x+size/2,lzPos.y,lzPos2.x+size/2,lzPos2.y);
      
      
      
      
      
      
    
  }
  
  void move(){
    
    lzPos.y-=10;
    lzPos2.y-=10;
    stroke(255,0,0);
    strokeWeight(10);
    line(lzPos.x+size/2,lzPos.y,lzPos2.x+size/2,lzPos2.y);
  
  
  }
  
  
  
  
  void remove(){
    lzPos.y=-100;
    lzPos2.y=-100;
  
  }  
  

  
  
  
}
