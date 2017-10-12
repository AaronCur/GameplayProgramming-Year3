class Obstacle{
  
  PVector location;
  PVector location2;
  Float m_width;
  Float m_height;
  Boolean ob, case2;
  
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
    // if(location.x < p.location.x + p.m_width && p.location.y + p.m_height > location.y)
    // {
      // p.velocity.y = 0;
       //p.gravityActive = false;
       //p.jump = true;
       //p.location.y = location.y - p.m_height;
       
     // }
     // else
      //{
         // p.gravityActive = false;
      
     // }
      
      
      if(p.location.y + p.m_height < location.y && p.location.x + p.m_width >location.x)
     {
       
       
       p.objectCollide = false;
       p.jump = false;
       p.gravityActive = true;
      }
      else if (p.location.y + p.m_height >= location.y && p.location.x + p.m_width >location.x && p.location.x< location.x + m_width)
      {
        p.objectCollide = true;
        p.gravityActive = false;
        p.velocity.y = 0;
        p.location.y = location.y - p.m_height;
        p.jump = true;
      }
       else
       {
         p.objectCollide = false;
         p.gravityActive = true;
       
        }
      
       if(p.location.x + p.m_width >= location.x  && p.location.x + p.m_width < location.x + 5 && p.location.y + p.m_height > location.y)
       {
         p.velocity.x = 0;
         p.location.x = location.x - p.m_width;
       
       }
       else if (p.location.x <= location.x + m_width && p.location.x + p.m_width > location.x + m_width + 5 && p.location.y + p.m_height > location.y)
        {
          
         p.velocity.x = 0;
         p.location.x = location.x + m_width;
      
      
      
        }
      
      //Case2
     // if(p.location.y+ p.m_height >= location.y)
     // {
        
      //  case2 = true;
      
     // }
     // else
     // {
     // /  case2 = false;
      
     // }
       
     
   }
   
   void display() {
    stroke(0);
    strokeWeight(0);
   
    fill(0);
    
    rect(location.x,location.y,m_width,m_height);
   
    
  }
  
 

}