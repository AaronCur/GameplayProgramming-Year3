// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A rectangular box
class Ball  {
  
   Body body;
  
  float r;
  float x, y;
  color col;
  color colStroke;
 
  // Constructor
  Ball(float x, float y, float _r) {
  
    r = _r;
  
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.bullet = true;
    //bd.fixedRotation = true;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
 
  //Set Physics parameters 
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    
    //Attatch the shape to the body with the fixture
    body.createFixture(fd);
     // "this" refers to this Particle object.
    // We are telling the Box2D Body to store a
    // reference to this Particle that we can
    // access later.
    body.setUserData(this);  
    
    col = color(255,0,0);
    colStroke = color(150,0,0);
  }
 
  
// Drawing the box
  void display() {
    //Find the bodys location and angle.
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
   // using the vec2 postion and float angle to translate and rotate the recatngle
    translate(pos.x,pos.y);
    rotate(a);
    //print(pos.x ,pos.y);
    //print("\n");
    fill(col);
    stroke(colStroke);
    strokeWeight(2);
    rectMode(CENTER);
    ellipse(0,0,r*2,r*2);
    line(0, 0, r/3, 0);
    line(0, 0, -r/3, 0);
    popMatrix();
  }
}