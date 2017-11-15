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
Ball b;
Hammer h;
Motor m;
GoalBoundary gb;
Goal g;


float pixelsToMeters;
float x1,x2,x3;
float y1,y2,y3;
ArrayList<Triangle> triangles;
int click;
boolean spawn = false;
Vec2[] vertex;
float vel;
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
  gb = new GoalBoundary(width * 0.8, height * 0.5, 100,100);
  lb = new LevelBouncy(width / 8, 700, width/6,344);
  ln = new LevelNormal(width / 8 * 6, 730, width/6,344);
  ln2 = new LevelNormal(width / 8 * 2, 730, width/11,344);
  m = new Motor(width/11, 50);
  triangles = new ArrayList<Triangle>();
  
  click = 0;
  
  vertex = new Vec2[3];
  
  
}

void draw() {
  
  background(174,234,255);
  
  box2d.step();
  gb.display();
  g.display();
  b.display();
  lb.display();
  ln.display();
  ln2.display();
  m.display();
  
   // Display all the trinagles
  for (Triangle t: triangles) {
   t.display();
  }
 
}
void mousePressed() {
  
  collision();
  if(click < 3)
  {
    click = click +1;
    vertex[click -1] = new Vec2(mouseX,mouseY);
   // vertex[click].x = mouseY;
  }
   else  if(click == 3 && spawn == false)
  {
  
    Triangle t = new Triangle(vertex[0],vertex[1],vertex[2]);
     triangles.add(t);
     spawn = true;
  
  }
 
 // CustomShape cs = new CustomShape(mouseX,mouseY);
 // polygons.add(cs);
}
 void collision()
{
    Vec2 pos = new Vec2(b.getPosition());
    //Get distances between the ball components 
    float d1 = dist(pos.x,pos.y,mouseX,mouseY);
    float d2 = b.r;
    
    if(d1 < d2)
    {
      Vec2 force = new Vec2(0,29000);
      b.applyForce(force);
      print("Yes");
    
    }
    
 }
 
 void beginContact(Contact cp)
{
 
   Body a=cp.getFixtureA().getBody();
   Body c=cp.getFixtureB().getBody();
   a.getUserData();
   c.getUserData();
   
  if (a.getUserData() instanceof GoalBoundary  && c.getUserData() instanceof Ball) {
    
    b.colourChange();
  }
  
}
// Objects stop touching each other
void endContact(Contact cp) {
  
  
}
  