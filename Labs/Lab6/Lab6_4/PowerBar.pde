class PowerBar{
  
  
  PVector location;
  Float m_fillWidth;
  Float m_outlineWidth;
  Float m_height;
  Float radians = 0f;
  float degrees = 0f;
  PowerBar()
  {
    location = new PVector(400,50);
    //redLocation = new PVector(30,952.5);
    m_outlineWidth= 400f;
    m_fillWidth = 0f;
    m_height = 55f;
    
   
   
  }
  //To increase the power bar when called 
  void increase()
  {
  
     if(m_fillWidth< m_outlineWidth)
    {

      m_fillWidth+=4;
      
    }
  
  }
  //To decrease the power bar when called
  void decrease()
  {
       if(m_fillWidth > 0 )
    {
     
      m_fillWidth-=4;
     
    }
  
  
  }
   void display() 
   {
    stroke(0);
    strokeWeight(2);
    
    fill(255,255,255);
    rect(location.x,location.y,m_outlineWidth,m_height);
    fill(255,0,0);
    rect(location.x,location.y,m_fillWidth,m_height);
  
  
  }
  
  
  
  
  
  
  
}