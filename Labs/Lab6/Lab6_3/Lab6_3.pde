Mover m;
Cannon c;
boolean fire = true;
boolean gravityReady = false;
PVector force;
void setup() {
  size(1200, 1000);
  smooth();
  m = new Mover(); 
  c= new Cannon();
}

void draw() {
  background(255);

  PVector gravity = new PVector(0, 0.1);

  if (gravityReady == true)
  {
    m.applyForce(gravity);
  }
  
  // c.display();
   m.update();
   //c.display();
  
   
   m.display();
   c.display();
}

void keyPressed()
{
  if (key == 32)
  {
    if (fire == true)
    {
      applyForce();
      fire = false; 
      gravityReady = true;
    }
    //c.angle +=0.1;
  }
 
  if(key == CODED)
  {
     if (keyCode == RIGHT)
     {
        if (c.degrees <0 && c.degrees >= -90)
        {
          c.degrees++;
        }
        
        c.radians = (c.degrees * (3.14159265359 / 180));
        // c.angle -=0.1;
     }
      if (keyCode == LEFT)
     {
        if (c.degrees <=0 && c.degrees > -90)
        {
          c.degrees--;
        }
        print(c.radians);
        c.radians = (c.degrees * (3.14159265359 / 180));
        
         //c.angle +=0.1;
     }
    
  }

 
}
void applyForce()
{

  force = new PVector(5, -5);

  m.applyForce(force);
}