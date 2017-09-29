Ball[] balls = new Ball[2];



void setup() {
  size(640,360);
  smooth();
  
  for(int i = 0; i < balls.length; i++)
  {
    balls[i] = new Ball((random(0, 640)),(random(0,360)),20);
  }

}

void draw() {
  
  
 background(222);
 
 for(int i =0; i < balls.length; i++)
 {
 balls[i].update();
 balls[i].display();
 balls[i].boundaryDetection();
 }
 
 balls[0].collision(balls[1]);
  

}