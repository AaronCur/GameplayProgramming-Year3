Mover m;
boolean fire = true;
boolean gravityReady = false;
PVector force;
void setup() {
  size(1200,1000);
  smooth();
  m = new Mover(); 
 
   
}

void draw() {
  background(255);

  //PVector wind = new PVector(0.01,0);
  PVector gravity = new PVector(0,0.1);
  
  if(gravityReady == true)
  {
    m.applyForce(gravity);
  }
 
  //m.applyForce(wind);
  m.update();
  m.checkEdges();
  m.display();
  
  
}

void keyPressed()
{
  if(key == 32)
  {
    if(fire == true)
   {
    applyForce();
    fire = false; 
    gravityReady = true;
   }
  }
 
}
void applyForce()
{
  
  force = new PVector(5,-5);

  m.applyForce(force);
}