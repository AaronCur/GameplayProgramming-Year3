class Obstacle{
  
  PVector location;
  PVector location2;
  Float m_width;
  Float m_height;
  
  Obstacle() {
    //Draw the ground 2/3s down the screen (rule of thirds)
    location = new PVector(800,566);
    location2 = new PVector(800,566);
    m_height = 100f;
    m_width = 100f;
  }
  void checkCollision (Player p)
   {
      //To check if the player is above the obstcle
      if(p.location.y + p.m_height < location.y && p.location.x + p.m_width >location.x)
     {
       p.objectCollide = false;
       p.jump = false;
       p.gravityActive = true;
      }
      //To check if the player lands on the top the object between its x and x + width position
      else if (p.location.y + p.m_height >= location.y && p.location.x + p.m_width >location.x && p.location.x< location.x + m_width)
      {
        p.objectCollide = true;
        p.gravityActive = false;
        p.velocity.y = 0;
        p.location.y = location.y - p.m_height;
        p.jump = true;
      }
      //If none of those cases apply, apply fraivty to the player and set the object collision to false;
      //When object collide is true gravity isnt applied to the player so it stays on top of the object
      //This overwrites the statement that if its above level position apply gravity
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
     
   }
   
   void display() {
    stroke(0);
    strokeWeight(0);
    fill(0);
    rect(location.x,location.y,m_width,m_height);

  }

}