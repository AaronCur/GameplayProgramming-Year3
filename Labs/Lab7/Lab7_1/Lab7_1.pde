Level l;
Goal g;
boolean fire = true;
boolean gravityReady = false;
PVector force;
void setup() {
  size(1777,1000);
  smooth();
  l = new Level(); 
  
  g = new Goal();
  
}

void draw() {
  background(127);

  //PVector wind = new PVector(0.01,0);
  //PVector gravity = new PVector(0,0.1);
  
  if(gravityReady == true)
  {
  //  m.applyForce(gravity);
  }
 
  //m.applyForce(wind);
  //m.update();
//  m.checkEdges();
 // m.display();
  
  l.display();
  g.display();
  
}