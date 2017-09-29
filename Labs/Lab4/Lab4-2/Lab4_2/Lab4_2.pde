PVector locationBlue;  // Location of BlueBall
PVector velocityBlue;  // Velocity of RedBall
PVector locationRed;  // Location of RedBall
PVector velocityRed;  // Velocity of RedBall

boolean collision = false;

int diameter = 48;
int radius;
int timer = 0;
int timeSinceCollsion = 0;
int timerAtCollision = 0;


void setup() {
  size(640,360);
  smooth();
  background(222);
  locationBlue = new PVector(100,100);
  velocityBlue = new PVector(1.5,2.1);
  
  
  locationRed = new PVector(200,200);
  velocityRed = new PVector(1.9,1.3);
  
  radius = diameter / 2;
  
  
  
  

}

void collision()
{
  
  //Get distances between the ball components 
  PVector distanceVect = PVector.sub(locationBlue, locationRed);
  
  //Calculate magnitude of the vector seperating the balls 
  float distanceVectMag = distanceVect.mag();
  
  //Minimum distance before they are touching 
  float minDistance = radius + radius;
  
  
  if ( distanceVectMag < minDistance)
  {
    
   collision = true; 
    timerAtCollision = timer;
  }
  
}
 
void draw() {
  
  timer = millis();
  collision ();
  
  
  if(collision == true)
  {
    //timerAtCollision = timer;
    fill(255,0,0);
    
    if(timer >= timerAtCollision + 2000)
    collision = false;
    
  }
  else
  {
    fill(255,255,255);
    
  }
  
  
 background(222);
  // Add velocity to the location.
  locationBlue.add(velocityBlue);
 
  
  // Add velocity to the location.
  locationRed.add(velocityRed);
  
  // Bounce off edges
  if ((locationRed.x > width - radius) || (locationRed.x < 0 + radius)) {
    velocityRed.x = velocityRed.x * -1;
  }
  if ((locationRed.y > height - radius) || (locationRed.y < 0 + radius)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocityRed.y = velocityRed.y * -1; 
    //location.y = height;
  }
  
  
  if ((locationBlue.x > width - radius) || (locationBlue.x < 0 + radius)) {
    velocityBlue.x = velocityBlue.x * -1;
  }
  if ((locationBlue.y > height - radius) || (locationBlue.y < 0 + radius)) {
    // We're reducing velocity ever so slightly 
    // when it hits the bottom of the window
    velocityBlue.y = velocityBlue.y * -1; 
    //location.y = height;
  }
  
 

  // Display circle at location vector
  ellipse(locationRed.x,locationRed.y,diameter,diameter);
  stroke(255,0,0);
  strokeWeight(3);
  
  
  ellipse(locationBlue.x,locationBlue.y,diameter,diameter);
  stroke(0,0,255);
  strokeWeight(3);
  
   
  
  
  
  
}