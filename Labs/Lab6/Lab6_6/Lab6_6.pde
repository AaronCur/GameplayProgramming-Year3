Mover m;
Cannon c;
PowerBar pb;
Target t;
boolean fire = true;
boolean gravityReady = false;
Float force = 0f;
Float maxForce = 40.0f;
void setup() {
  size(1200, 1000);
  smooth();
  m = new Mover(); 
  c= new Cannon();
  pb= new PowerBar();
  t = new Target();
}
void draw() {
  background(255);

  PVector gravity = new PVector(0, 0.2);

  if (gravityReady == true)
  {
    m.applyForce(gravity);
  }
   
   t.update();
   t.display();
   m.update();
   pb.display();
   m.display();
   c.display();
   collision();
   
   if(t.hit == true)
  {
    reset();

  }
   
}

void reset()
{

    m.reset();
    pb.reset();
    force = 0f;
    gravityReady = false;
    fire = true;
   
}
void collision()
{
    
    //Get distances between the ball components 
    PVector distanceVect = PVector.sub(m.location, t.location);
    
    //Calculate magnitude of the vector seperating the balls 
    float distanceVectMag = distanceVect.mag();
    
    //Minimum distance before they are touching 
    float minDistance = m.radius + t.radius;
    
    if(distanceVectMag < minDistance)
    {
      t.hit = true;
    }
    
}
void keyPressed()
{
  if (keyCode == 82)
  {
    reset();
  }
  //To fire projectile
  if (key == 32)
  {
    if (fire == true && force > 0)
    {
      m.applyForce();
      fire = false; 
      gravityReady = true;
    }
  }
  
 
  if(key == CODED)
  {
 
    //Code to to increase / decrease angle of projection 
     if (keyCode == DOWN)
     {
        if (c.degrees <0 && c.degrees >= -90)
        {
          c.degrees++;
        }
        
        c.radians = (c.degrees * (3.14159265359 / 180));
        // c.angle -=0.1;
     }
      if (keyCode == UP)
     {
        if (c.degrees <=0 && c.degrees > -90)
        {
          c.degrees--;
        }
        c.radians = (c.degrees * (3.14159265359 / 180));
        
         //c.angle +=0.1;
     }
     //Code to to increase / decrease force of ball and increase / decrease power bar 
      if (keyCode == RIGHT && pb.m_fillWidth <= pb.m_outlineWidth)
     {
        if(force <= maxForce)
        {
          force+=0.4;
          pb.increase();
        }
        
     }
      if (keyCode == LEFT && pb.m_fillWidth > 0)
     {
        if (force > 0)
        {
          force-=0.4;
          pb.decrease();
          
        }
       
     }
     
      m.initialVelocity.x = force * cos(c.radians);
      m.initialVelocity.y = force * sin(c.radians);
  }
  
  
 
}