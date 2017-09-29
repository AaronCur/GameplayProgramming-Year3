Ball[] balls = new Ball[10];

void setup() {
  size(1200,1200);
  smooth();
  
  for(int i = 0; i < balls.length; i++)
  {
    balls[i] = new Ball((random(150, 1050)), (random(150, 1050)), (random(30,100)));
  }

}

void draw() 
{
  
  
 background(255);
 
 for(int i =0; i < balls.length; i++)
 {
 balls[i].update();
 balls[i].display();
 balls[i].boundaryDetection();
   
 for(int j = i+1; j < balls.length; j++)
 {
   balls[i].collision(balls[j]);
 }
 
 }
  

}