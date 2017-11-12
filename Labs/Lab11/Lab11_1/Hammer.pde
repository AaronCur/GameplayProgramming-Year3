class Hammer{
  
  Body body;
  
  float x,y;
  float w,h;
  float w2,h2;
 
  
  Hammer(float x_, float y_) {
    
    x = x_;
    y = y_;
    w = 100;
    h = 100;
    w2 = w / 5;
    h2=h;
    Vec2 offset = new Vec2(0,h);
    offset = box2d.vectorPixelsToWorld(offset);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps1 = new PolygonShape();
    float box2dW1 = box2d.scalarPixelsToWorld(w / 2);
    float box2dH1 = box2d.scalarPixelsToWorld(h / 2);
    ps1.setAsBox(box2dW1,box2dH1);
    
    
    Vec2[] vertices = new Vec2[4];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-10 + offset.x, -10 + offset.y));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(-10 + offset.x, 50 + offset.y));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(10 + offset.x, 50 + offset.y));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(10 + offset.x, 10 + offset.y));
    
     // Define a polygon (this is what we use for a rectangle)
    PolygonShape ps2 = new PolygonShape();
    ps2.set(vertices, vertices.length);

    
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
    //rect(0,-h/6,w,h);
    popMatrix();
    
   
  }
  
 

}