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
ArrayList<Triangle> triangles;
int click;
float x1,x2,x3;
float y1,y2,y3;
float vel;
Vec2[] vertex;
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
  
  triangles = new ArrayList<Triangle>();
  
  click = 0;
  
  vertex = new Vec2[3];
  
}

void draw() {
  
  background(174,234,255);
  
  box2d.step();
  b.display();
  g.display();
  lb.display();
  ln.display();
  
   // Display all the trinagles
  for (Triangle t: triangles) {
   t.display();
  }
  // triangles that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  //for (int i = triangles.size()-1; i >= 0; i--) {
    //Triangle t = triangles.get(i);
    //if (t.done()) {
     // triangles.remove(i);
    //}
  //}
  b.reset();
  b.getVelocity();
  vel = b.getVelocity();
}
void mousePressed() {
  
  
  if(click < 3)
  {
    click = click +1;
    vertex[click -1] = box2d.vectorPixelsToWorld(mouseX,mouseY);
   // vertex[click].x = mouseY;
  }
  if(click == 3)
  {
  
    Triangle t = new Triangle(vertex[0].x, vertex[0].y,vertex[1].x, vertex[1].y,vertex[2].x, vertex[2].y);
     triangles.add(t);
  
  }
 
 // CustomShape cs = new CustomShape(mouseX,mouseY);
 // polygons.add(cs);
}
   // Collision event functions!