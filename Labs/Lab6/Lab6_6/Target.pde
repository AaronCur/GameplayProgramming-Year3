class Target{
  
  PVector location;
  Float m_width;
  Float m_height;
  Boolean hit = false;
  Float diameter = 100f;
  Float radius = 0f;

  Target() {
    location = new PVector(400,400);
    //redLocation = new PVector(30,952.5);
    m_width = 90f;
    m_height = 55f;
    radius = diameter/2;
   
  }
   void update()
   {
     if(hit == true)
     {
    
       location = new PVector(random(200,1100), random(200, 900));
       
       hit = false;

     }
   }
  
   void display()
   {
     
     
     
    stroke(0);
    strokeWeight(2);
    
    fill(255,0,0);
    ellipse(location.x ,location.y, diameter,diameter);
    fill(255,255,255);
    ellipse(location.x ,location.y, 70 ,70);
    fill(255,0,0);
    ellipse(location.x ,location.y, 40,40);
       
       
     
   
    
  }
  
 

}