PVector location;  // Location of shape
PVector velocity;  // Velocity of shape
PVector gravity;   // Gravity acts at the shape's acceleration
int diameter = 48;
int radius;

void setup() {
  size(640,360);
  location = new PVector(100,100);
  velocity = new PVector(1.5,2.1);
  gravity = new PVector(0,0);
  radius = diameter / 2;

}

void draw() {
  background(222);
  
  // Add velocity to the location.
  location.add(velocity);
  // Add gravity to velocity
  velocity.add(gravity);
  
  // Bounce off edges
  if ((location.x > width - radius) || (location.x < 0 + radius)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height - radius) || (location.y < 0 + radius)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocity.y = velocity.y * -1; 
    //location.y = height;
  }

  // Display circle at location vector
  stroke(0,0,255);
  strokeWeight(3);
  fill(255);
  ellipse(location.x,location.y,diameter,diameter);
}