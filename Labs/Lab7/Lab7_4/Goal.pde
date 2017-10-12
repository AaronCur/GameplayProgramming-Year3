class Goal{
  
  PVector location;
  PVector location2;
  Float m_width;
  Float m_height;
  Boolean collision = false;
  
  Goal() {
    
    m_width = 35f;
    m_height = 58f;
    location = new PVector(1332,664- m_height);
    //Vector for bottom left corner of the goal for rectangle collision detection
    location2 = new PVector (location.x + m_width, location.y + m_height);
    
  }
  
   void collision (Player p)
   {
     
     
    if(location.x <= p.location.x + p.m_width && location.x + m_width >= p.location.x &&
        location.y <= p.location.y + p.m_height & location.y + m_height >= p.location.y )
      {
      
        collision = true;
        print("Colision");
     print("\n");
      
      }
      else
      {
        collision = false;
      }
         
   
   }
   void display()
   {

    stroke(255);
    strokeWeight(2);
    //Fill with same colour as background so it appears see through
    fill(127);
    rect(location.x,location.y,m_width,m_height);

  }
  
 

}