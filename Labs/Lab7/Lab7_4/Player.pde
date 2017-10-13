class Player {

  PVector gravity;
  PVector acceleration;
  PVector initialVelocity;
  PVector location;
  PVector location2;
  PVector velocity;
  float m_width;
  float m_height;
  float mass = 1;
  boolean gravityActive = false;
  boolean jump = true;
  boolean jumpLeft = false;
  boolean jumpRight = true;
  boolean objectCollide = false;
  boolean keyDown = false;
  
  Player() {
    
    m_width = 35f;
    m_height = 58f;
    location = new PVector(334,664- m_height);
    //to get the position of the rectangles bottom left corner for recatngle collision detection
    location2 = new PVector (location.x + m_width, location.y + m_height);
    velocity = new PVector(0,0);
    
    //pixelsToMeters = 20;
    gravity = new PVector(0.0f, 0.9);
    acceleration =new PVector(0.0f, 0.0f);
    initialVelocity =new PVector (0.0f, -25.0f);
    
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  void update(Level l)
  {
    
    location2.y = location.y + m_height + 2;
    velocity.add(acceleration);
    location.add(velocity);
    
   
    
  
     if(location.y + m_height < l.groundLocation.y)
     {
       if(objectCollide == false)
       {
          p.jump = false;
          gravityActive = true;
       
       }

      }
      else
      {
        gravityActive = false;
        velocity.y = 0;
        location.y = l.groundLocation.y - m_height;
        
      }
      
    if(objectCollide == false && gravityActive == true )
     {
          velocity.add(gravity);
         
     }
     

      
  }
  void jump()
  {
    
    if(velocity.y == 0)
    {
        velocity.add(initialVelocity);
    }
 
  }
  void jumpLeft()
  {
    if(jump == false)
    {
    
    
    
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
    if(keyDown == true)
    {
      velocity.add(-15,0);
      keyDown = false;
    
    }
    
  
  }
  
  void moveLeft()
  {
    if(jumpLeft == false)
    {
      
    velocity.add(-15,0);
    //jumpLeft ==tr
    //location.x = p.location.x  + p.velocity.x;
    //location2.x = p.location.x  + p.velocity.x;
 
    }
    else
    {
      
    velocity.x = 0;
    
    }
    
  }

}