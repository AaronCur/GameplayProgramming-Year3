Mover m;
Cannon c;
boolean fire = true;
boolean gravityReady = false;
PVector force;
void setup() {
  size(1200,1000);
  smooth();
  m = new Mover(); 
  c= new Cannon();
 
   
}

void draw() {
  background(255);

  PVector gravity = new PVector(0,0.1);
  
  if(gravityReady == true)
  {
    m.applyForce(gravity);
  }
 
  //m.applyForce(wind);
 // m.update();
 // m.checkEdges();
  //m.display();
  
  c.display();
  
  
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