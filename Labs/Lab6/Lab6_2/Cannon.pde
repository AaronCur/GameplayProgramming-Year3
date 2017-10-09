class Cannon{
  
  PVector location;
  PVector redLocation;
  Float m_width;
  Float m_height;
  
  Cannon() {
    location = new PVector(30,925);
    //redLocation = new PVector(30,952.5);
    m_width = 90f;
    m_height = 55f;
  }
  
   void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    rect(location.x,location.y,m_width,m_height);
    fill(255,0,0);
    translate(0,m_height/2);
    ellipse(location.x ,location.y, 10,10);
  }
  
  

}