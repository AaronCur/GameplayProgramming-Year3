class GoalBoundary{
  
  Body body;
  
  float x,y;
  float w,h;
 
  
  GoalBoundary(float x_, float y_, float w_, float h_) {
    
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    
    float box2dW = box2d.scalarPixelsToWorld(w / 2);
    float box2dH = box2d.scalarPixelsToWorld(h / 2);
    
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.isSensor = true;
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.0;
    fd.restitution = 0;
    
    body.createFixture(fd);
    
     // "this" refers to this Particle object.
    // We are telling the Box2D Body to store a
    // reference to this Particle that we can
    // access later.
    body.setUserData(this);  
    
   
  }
   void display() {
   
     
    stroke(0,0,0,0);
    strokeWeight(0);
    fill(174,234,255);
    rectMode(CENTER);
    rect(x,y,w,h);
    
   
  }
  
 

}