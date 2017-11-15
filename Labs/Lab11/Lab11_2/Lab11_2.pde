import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
LevelBouncy lb;
LevelNormal ln2;
LevelNormal ln;
Hammer h;
Motor m;

float pixelsToMeters;
float x1,x2,x3;
float y1,y2,y3;
void setup() {
  size(1777,1000);

  pixelsToMeters = 20;
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-9.8 * pixelsToMeters);
  // Turn on collision listening!
  box2d.listenForCollisions();

  lb = new LevelBouncy(width / 8, 500, width/6,344);
  ln = new LevelNormal(width / 8 * 6, 730, width/6,344);
  ln2 = new LevelNormal(width / 8 * 2, 730, width/11,344);
  m = new Motor(width/2, 200);
  //h = new Hammer(width/2, height/2);
  
}

void draw() {
  
  background(174,234,255);
  
  box2d.step();
  lb.display();
  ln.display();
  ln2.display();
  m.display();
 
}

  