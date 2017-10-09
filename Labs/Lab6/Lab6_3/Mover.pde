class Mover {

  PVector location;
  PVector velocity;
  PVector initialVelocity;
  PVector acceleration;
  float mass;
  float radius;
  float diameter;

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
  if (location.x > width - radius) 
  {
      location.x = width - radius;
      velocity.x = velocity.x * -1;
  }
  else if (location.x < 0 + radius)
  {
    location.x = radius;
    velocity.x = velocity.x * -1;
  }
    
    
  if ((location.y > height - radius) || (location.y < 0 + radius)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -1; 
    location.y = height - radius ;
  }

  }

}