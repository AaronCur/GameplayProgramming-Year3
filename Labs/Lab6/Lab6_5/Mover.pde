class Mover {

  PVector location;
  PVector velocity;
  PVector initialVelocity;
  PVector acceleration;
  float mass;
  float radius;
  float diameter;
  boolean wall = false;

  Mover() {
    location = new PVector(30,925);
    velocity = new PVector(0,0);
    initialVelocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = 1;
    diameter = 48;
    radius = diameter / 2;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(location.x,location.y,diameter,diameter);
  }
   
  
  void checkEdges() {

    // Bounce off edges
    //Reduce ball velocity slightly every time
  if (location.x > width - radius) 
  {
    wall = true;
      location.x = width - radius;
      velocity.x = velocity.x * -0.95;
  }
  else if (location.x < 0 + radius)
  {
    wall = true;
    location.x = radius;
    velocity.x = velocity.x * -0.95;
  }
  else
  {
    wall = false;
  }
    
  if (location.y > height - radius)
  {
    wall = true;
    // when it hits the bottom of the window
    velocity.y = velocity.y * -0.95; 
    location.y = height - radius ;
  }
  else if(location.y < 0 + radius)
  {
    wall = true;
    velocity.y = velocity.y * -0.95; 
    location.y = radius ;
    
    
  }
  else 
  {
    wall = false;
  }
  
  }
  void applyForce()
  {
    velocity.add(initialVelocity);
  }
  void reset()
  {
    location = new PVector(30,925);
    velocity = new PVector(0,0);
    initialVelocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
  }
}