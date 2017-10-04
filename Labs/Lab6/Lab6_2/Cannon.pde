class Cannon{
  
  PVector location;
  Float m_width;
  Float m_height;
  
  Cannon() {
    location = new PVector(30,950);
    m_width = 30f;
    m_height = 30f;
  }
  
   void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    rect(location.x,location.y,m_widthg,m_height);
  }
  
  

}