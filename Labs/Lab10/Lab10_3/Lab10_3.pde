import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
Ball b;
Goal g;
LevelBouncy lb;
LevelNormal ln;
float pixelsToMeters;
void setup() {
  size(1777,1000);

  pixelsToMeters = 20;
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-9.8 * pixelsToMeters);
  // Turn on collision listening!
  box2d.listenForCollisions();
  
  b = new Ball(width/8, 200, 40); 
  g = new Goal(100, 100, 30, 70, 5);
  lb = new LevelBouncy(width / 8, 500, width/6,344);
  ln = new LevelNormal(width / 8 * 6, 730, width/6,344);
  
}

void draw() {
  
  background(174,234,255);
  
  box2d.step();
  b.display();
  g.display();
  lb.display();
  ln.display();
  
}
 