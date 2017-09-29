class Ball
{

  PVector position;  // Location of the ball
  PVector velocity;  // Velocity of the ball 

  boolean collision = false;

  
  float radius;
  float diameter;
  float mass;
  int timer = 0;
  int timeSinceCollsion = 0;
  int timerAtCollision = 0;

  
  Ball (float x, float y, float r)
  {
    position = new PVector(x,y);
    //velocity = PVector.random2D();
    velocity = new PVector(random(-10,10), random(-10, 10));
    //velocity.mult(3);
    radius = r;
    diameter = radius * 2 ;
    mass = radius /2 ;
    
  }
  
  void update()
  {
    position.add(velocity);
  }
  
  void boundaryDetection()
  {
     // Bounce off edges
    if ((position.x > width - radius) || (position.x < 0 + radius)) {
      velocity.x = velocity.x * -1;
    }
    if ((position.y > height - radius) || (position.y < 0 + radius)) {
      // We're reducing velocity ever so slightly 
      // when it hits the bottom of the window
      velocity.y = velocity.y * -1; 
      //location.y = height;
    }
    
  }
  void collision(Ball other)
  {
    
    //Get distances between the ball components 
    PVector distanceVect = PVector.sub(position, other.position);
    
    //Calculate magnitude of the vector seperating the balls 
    float distanceVectMag = distanceVect.mag();
    
    //Minimum distance before they are touching 
    float minDistance = radius + radius;
    
    
    if ( distanceVectMag < minDistance)
    {
      
      collision = true; 
     timerAtCollision = timer;
      
     float tempV1X = (velocity.x * (mass - other.mass) + (2 *  other.mass * other.velocity.x)) / (mass + other.mass);
     float tempV1Y = (velocity.y * (mass - other.mass) + (2 *  other.mass * other.velocity.y)) / (mass + other.mass);
     
     float tempV2X = (other.velocity.x * (other.mass - mass) + (2 * mass * velocity.x)) / (mass + other.mass);
     float tempV2Y = other.velocity.y * (other.mass - mass) + (2 * (mass * velocity.y)) / (mass + other.mass);
    
     velocity = new PVector (tempV1X, tempV1Y);
     other.velocity = new PVector(tempV2X , tempV2Y);
     
    }
    
   
  }
   
  void display() {
    
    timer = millis();
    
    stroke(0,0,0);
    strokeWeight(3);
    ellipse(position.x,position.y,diameter,diameter);
    
    
    if(collision == true)
    {
      //timerAtCollision = timer;
      fill(255,0,0);
      
      if(timer >= timerAtCollision + 1000)
      {
        collision = false;
      }
      
    }
    else
    {
      fill(255,255,255);
      
    }
    
    // Display circle at location vector
   
     
  }
}