// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A rectangular box
class Box  {
  
   Body body;
  
  float w,h;

  // Constructor
  Box(float x, float y) {
   
    w = 16;
    h = 16;
    //Build body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    //Build shape
    PolygonShape ps = new PolygonShape();
    //Box2D considers the width and height of a rectangle to be the distance 
    //from the center to the edge (so half of what we normally think of as width or height).
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    
    ps.setAsBox(box2dW, box2dH);
    
    //Set Physics parameters 
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    //Attatch the shape to the body with the fixture
    body.createFixture(fd);
    
  }

  // Drawing the box
  void display() {
    //Find the bodys location and angle.
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
   // using the vec2 postion and float angle to translate and rotate the recatngle
    translate(pos.x,pos.y);
    //- angle because box2d rotstion is opposite to procesing
    rotate(-a);
    
    fill(127);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  void killBody(){
    box2d.destroyBody(body);
    
    
  }
  
}