class LevelBouncy{
  
  Body body;
  
  float x,y;
  float w,h;
  
  LevelBouncy(float x_, float y_, float w_,float h_) {
    //Draw the ground 2/3s down the screen (rule of thirds)
  //  groundLocation = new PVector(0,666);
   // m_groundHeight = 334f;
   // ceilLocation = new PVector(0, 0);
   // m_ceilHeight = 40f;
   // m_levelWidth = 1777f;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    BodyDef bd= new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    
    float box2dW = box2d.scalarPixelsToWorld(w / 2);
    float box2dH = box2d.scalarPixelsToWorld(h / 2);
    
    ps.setAsBox(box2dW,box2dH);
    
     FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 1;
    fd.restitution = 0.8;
    body.setUserData(this);  
    //Attatch the shape to the body with the fixture
    body.createFixture(fd);
    
   
  }
   
   void display() {
   
     
    stroke(0);
    strokeWeight(2);
    fill(0,127,0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
  
 

}