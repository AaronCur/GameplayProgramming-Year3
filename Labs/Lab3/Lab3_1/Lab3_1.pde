// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example 1-4: Vector multiplication

void setup() {
  size(640,360);
  mouse1 = null;
  mouse2 = null;
  finished = false;
  smooth();
  
  PVector mouse = new PVector(mouseX,mouseY);
}
void mouseClicked()
{
  PVector mouse = new PVector(mouseX,mouseY);
  
  
  
}
void draw() {
  background(255);
  
  if(mousePressed == true)
  {
    first = true;
    
    PVector mouse = new PVector(mouseX,mouseY);
    
    // PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center);
  
  // Multiplying a vector!  The vector is now half its original size (multiplied by 0.5).
 // mouse.mult(1);  
  
  translate(width/2,height/2);
  strokeWeight(2);
  stroke(0);
  //line(0,0,mouse.x,mouse.y);
  }
  line(0,0,mouse.x,mouse.y);

}

void mousedClicked(){
  
  if(mouse1 == null)
  {
    
    
    
  
  
}