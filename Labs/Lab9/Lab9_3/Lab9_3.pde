import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
Level l;
Ceiling c;
Obstacle o;
Obstacle o2;
Player p;
Goal g;
float pixelsToMeters;
void setup() {
  size(1777,1000);

  pixelsToMeters = 20;
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-9.8 * pixelsToMeters);
  // Turn on collision listening!
  box2d.listenForCollisions();
  
  l = new Level(width / 2, 833, width, 334); 
  c = new Ceiling(width/2, 20, width, 40);
  o = new Obstacle(width/2, 650, 100, 100);
  o2 = new Obstacle((width/8) *5, 500, 100, 100);
  p = new Player(width/8, 200);
  g = new Goal((width/8) * 6, 636, 35, 58);
  
}

void draw() {
  
  background(127);
 
  
  box2d.step();
 
  l.display();
  g.display();
  p.display();
  c.display();
  o.display();
  o2.display();
  
  
  
}
  void keyPressed()
{
 
 
  if(key == CODED)
  {
    
     if (keyCode == UP )
     {
       p.moveUp();
 
     }
      //Code to to move player left or right when its inside the boundaries
      if (keyCode == RIGHT  )
     {
       
      p.moveRight();
     
     }
    
     
      if (keyCode == LEFT )
     {
       p.moveLeft();
       
     }
     
  }
}
void keyReleased()
{
 
 
  if(key == CODED)
  {
      //Code to to move player left or right when its inside the boundaries
      if (keyCode == RIGHT || keyCode == LEFT )
     {
       p.resetX();
      
       
     }
  }
}
  // Collision event functions!
void beginContact(Contact cp)
{
 
   Body a=cp.getFixtureA().getBody();
   Body b=cp.getFixtureB().getBody();
   a.getUserData();
   b.getUserData();
   
  if (a.getUserData() instanceof Player  && b.getUserData() instanceof Goal) {
    
    p.colourChange();
  }
  
}
// Objects stop touching each other
void endContact(Contact cp) {
  
    Body a=cp.getFixtureA().getBody();
   Body b=cp.getFixtureB().getBody();
   a.getUserData();
   b.getUserData();
   
  if (a.getUserData() instanceof Player  && b.getUserData() instanceof Goal) {
    
    p.colourReset();
   // p.change();
  }

  print("\n");
  
}