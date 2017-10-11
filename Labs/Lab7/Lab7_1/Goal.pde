class Goal{
  
  PVector location;
  Float m_width;
  Float m_height;
  Boolean hit = false;
  
  Goal() {
    
    m_width = 35f;
    m_height = 58f;
    location = new PVector(1332,664- m_height);
    
  }
   void update()
   {
    // if(hit == true)
    // {
    
       //location = new PVector(random(200,1100), random(200, 900));
       
      // hit = false;

    // }
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