//target target;
target[] targets;
laser[]  lasers;
PImage ship;
PImage bg;
PVector pos;
float size=50;
int count=0;
int lives=3;


PVector linePos;
PVector linePos2;
boolean draw = false;
boolean state =false;





void setup() {

  size(700, 700);
  ship = loadImage("ship.png");
  bg = loadImage("bg.jpg");
  pos = new PVector(width/2-size/2, height-size);
  targets = new target[5];
  lasers = new laser[20];
  for(int i=0;i<5;i++){
    targets[i]=new target();
  }
   for(int i=0;i<20;i++){
    lasers[i]=new laser();
  } 
  //lasers[2].shoot(pos.x,pos.y);
}

void draw() {
  noCursor();
  background(bg);
  

  for(target ball :targets){
    ball.draw();
  
    ball.move();
  }




  image(ship, pos.x, pos.y, size, size);

  if(draw==true){
    if(state==true){
      lasers[count-1].shoot(pos.x,pos.y);
      state=false;
    }
    
    for(target ball :targets){
      for(laser lasers:lasers){
        if(dist(ball.recPos.x,ball.recPos.y,lasers.lzPos2.x,lasers.lzPos2.y)<ball.size-15){
          lasers.remove();
          ball.respawn();
          print("hit");
    
        }
      }
      if(ball.passed==true){
        lives--;
        println(lives);
        ball.passed=false;
      }
    }
    
    for(laser lasers:lasers){
      lasers.move();
      
    }

  if(lives<=0){
    fill(255, 0, 0);
    textSize(32);
    text("GAME OVER", width/2-100, height/2); 
    

    noLoop();
  }
  
}
  
  

  
}


void keyPressed() {
  if (key=='w' && pos.y>10) {

    pos.y-=10;
  }

  if (key=='s' && pos.y<700-size) {

    pos.y+=10;
  }

  if (key=='a' && pos.x>10) {

    pos.x-=10;
  }

  if (key=='d' && pos.x<690-size) {

    pos.x+=10;
  }
  
  if(key==32){
    if(count<19){
      count++;    
    }
    else{
    count=1;
    }
    draw=true;
    state=true;
    
    
  
  
  }
  
}

void mousePressed(){
  if(mouseButton==LEFT){
    if(count<19){
      count++;    
    }
    else{
    count=1;
    }
    draw=true;
    state=true;
  }
}


void mouseMoved(){
  pos.x=mouseX-size/2;
  pos.y=mouseY-size/2;
}

/*void collition(){
  if(dist(targetA.recPos.x,targetA.recPos.y,linePos2.y,linePos2.x)<targetA.size){
    targetA.respawn();
    print("hello");
  
  }
  
  
  //return coll;
}*/
