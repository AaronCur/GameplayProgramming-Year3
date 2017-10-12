class Player {

  float pixelsToMeters = 20;
  PVector gravity;
  PVector acceleration;
  PVector initialVelocity;
  
  
  PVector location;
  PVector location2;
  PVector velocity;
  float m_width;
  float m_height;
  float m_speed;
  
  float mass = 1;
  boolean gravityActive = true;
  boolean jump = false;
  
  Player() {
    
    m_width = 35f;
    m_height = 58f;
    location = new PVector(334,664- m_height);
    //to get the position of the rectangles bottom left corner for recatngle collision detection
    location2 = new PVector (location.x + m_width, location.y + m_height);
    velocity = new PVector(0,0);
    
    //pixelsToMeters = 20;
    gravity = new PVector(0.0f, 0.5);
    acceleration =new PVector(0.0f, 0.0f);
    initialVelocity =new PVector (0.0f, -20.0f);
    
    m_speed = 1;
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  void update(Level l)
  {
    location2.x = location.x + m_width + 2;
    location2.y = location.y + m_height + 2;
    velocity.add(acceleration);
    location.add(velocity);
    
    if(location.y + m_height < l.groundLocation.y)
    {
      jump = false;
       if(gravityActive == true)
         {
           velocity.add(gravity);
         
         }
       
      
    
    }
    else
    {
      jump = true;
      velocity.y = 0;
    
    }
    
    
    
  }
  void jump()
  {
    if(jump == true)
    {
      velocity.add(initialVelocity);
   
    }
    
    
  }
  
  
  
  
  //The stroke colour is darker than the fill to give it a 3D feel
  void display(Goal g) {
   
    strokeWeight(2);
    fill(255,0,0);
    
    if(g.collision == false)
    {
      stroke(150,0,0);
      fill(255,0,0);
    }
    else
    {
      stroke(150);
      fill(255);
    }
    
    rect(location.x,location.y,m_width,m_height);
  }
   
  void moveRight()
  {
  
    velocity.x = 5;
    location.x = p.location.x + p.velocity.x;
    velocity.x = 0;

  }
  
  void moveLeft()
  {
    velocity.x = -5;
    location.x = p.location.x  + p.velocity.x;
    velocity.x = 0;
  }

}