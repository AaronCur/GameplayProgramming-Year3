class Hammer{
  
  Body body;
  
  float x,y;
  float w,h;
  float w2,h2;
  Vec2 offset;
  
  Hammer(float x_, float y_) {
    
    x = x_;
    y = y_;
    w = 150;
    h = 150;
    w2 = 40;
    h2 = 300;
    offset = new Vec2(0,2000);
    offset.x = box2d.scalarPixelsToWorld(offset.x);
    offset.y = box2d.scalarPixelsToWorld(offset.y);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps1 = new PolygonShape();
    float box2dW1 = box2d.scalarPixelsToWorld(w / 2);
    float box2dH1 = box2d.scalarPixelsToWorld(h / 2);
    ps1.setAsBox(box2dW1,box2dH1);
    
     // Define a polygon (this is what we use for a rectangle)
    PolygonShape ps2 = new PolygonShape();
    float box2dW2 = box2d.scalarPixelsToWorld(w2 / 2);
    float box2dH2 = box2d.scalarPixelsToWorld(h2 / 2);
    ps2.setAsBox(box2dW2 + box2d.scalarPixelsToWorld(offset.x),box2dH2 + box2d.scalarPixelsToWorld(offset.y));
    
    body.createFixture(ps1, 1.0);
    body.createFixture(ps2, 1.0);
    
     // "this" refers to this Particle object.
    // We are telling the Box2D Body to store a
    // reference to this Particle that we can
    // access later.
    body.setUserData(this);  
    
   
  }
   void display() {
   
   // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(127);
    stroke(0);
    strokeWeight(2);

    rect(0,0,w,h);
    rect(offset.x,offset.y,w2,h2);
    //rect(0,-h/6,w,h);
    popMatrix();
    
   
  }
  
 

}