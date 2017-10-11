class Player {

  PVector location;
  PVector location2;
  PVector velocity;
  float m_width;
  float m_height;

  Player() {
    
    m_width = 35f;
    m_height = 58f;
    location = new PVector(334,664- m_height);
    //to get the position of the rectangles bottom left corner for recatngle collision detection
    location2 = new PVector (location.x + m_width, location.y + m_height);
    velocity = new PVector(0,0);
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
   

}