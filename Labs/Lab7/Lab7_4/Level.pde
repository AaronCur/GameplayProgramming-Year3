class Level{
  
  PVector groundLocation;
  Float m_groundHeight;
  PVector ceilLocation;
  Float m_ceilHeight;
  Float m_levelWidth;
  
  Level() {
    //Draw the ground 2/3s down the screen (rule of thirds)
    groundLocation = new PVector(0,666);
    m_groundHeight = 334f;
    ceilLocation = new PVector(0, 0);
    m_ceilHeight = 40f;

    m_levelWidth = 1777f;
   
  }
   
   
   void display() {
    stroke(0);
    strokeWeight(2);
    fill(0);
    
    rect(ceilLocation.x,ceilLocation.y,m_levelWidth,m_ceilHeight);
    
    rect(groundLocation.x,groundLocation.y,m_levelWidth,m_groundHeight);
   
    
  }
  
 

}