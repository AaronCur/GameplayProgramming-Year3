class Obstacle{
  
  PVector location;
  PVector location2;
  Float m_width;
  Float m_height;
  Boolean case1, case2;
  
  Obstacle() {
    //Draw the ground 2/3s down the screen (rule of thirds)
    location = new PVector(800,566);
    location2 = new PVector(800,566);
    m_height = 100f;
    m_width = 100f;
  }
  void checkCollision (Player p)
   {
     
     //Case1
     if(location.x < p.location.x + p.m_width)
     {
       
       case1 = true;
       
      }
      else 
      {
        case1 = false;
      }
      
      
      //Case2
      if(p.location.y+ p.m_height > location.y)
      {
        
        case2 = true;
      
      }
      else
      {
        case2 = false;
      
      }
       
     
   }
   void processCollision(Player P)
   {
     checkCollision(P);
     
     if(case1 == true && case2 == true)
     {
       p.gravityActive = false;
       p.location.y = location.y - p.m_height - 1;
     
  
     }
     else if(case1 == true)
     {
       p.location.x = location.x - p.m_width - 1;
       
  
     }
     else
     {
       p.gravityActive = true;
     
     }
     
     
   
   
   
   
   
   }
   void display() {
    stroke(0);
    strokeWeight(0);
   
    fill(0);
    
    rect(location.x,location.y,m_width,m_height);
   
    
  }
  
 

}