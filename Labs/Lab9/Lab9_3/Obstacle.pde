class Obstacle{
  
  Body body;
  
  float x,y;
  float w,h;
  
  Obstacle(float x_, float y_, float w_, float h_) {
    
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
    
    body.createFixture(ps , 1);
    
   
  }
   
   void display() {
   
     
    stroke(0);
    strokeWeight(2);
    fill(0);
    rectMode(CENTER);
    rect(x,y,w,h);
    
   
  }
  
 

}