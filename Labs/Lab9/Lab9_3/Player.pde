// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A rectangular box
class Player  {
  
   Body body;
  
  float w,h;
  float x, y;
  
 
  // Constructor
  Player(float x, float y) {
  
   
    w = 35;
    h = 58;
    
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.bullet = true;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    
    float box2dW = box2d.scalarPixelsToWorld(w / 2);
    float box2dH = box2d.scalarPixelsToWorld(h / 2);
    
    ps.setAsBox(box2dW, box2dH);
  //Set Physics parameters 
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.0;
    fd.restitution = 0;
    
    //Attatch the shape to the body with the fixture
    body.createFixture(fd);
    
    
  }
 

  // Drawing the box
  void display() {
    //Find the bodys location and angle.
    Vec2 pos = box2d.getBodyPixelCoord(body);
   
    pushMatrix();
   // using the vec2 postion and float angle to translate and rotate the recatngle
    translate(pos.x,pos.y);
    print(pos.x ,pos.y);
    print("\n");
    fill(255,0,0);
    stroke(150,0,0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(x,y,w,h);
    popMatrix();
  }

  //ApplyForce() applies a force inastantly 
  //However ApplyImpulse applies the force instantly 
  void moveLeft(){
    Vec2 moveLeft = new Vec2(-30,body.getLinearVelocity().y);
    body.setLinearVelocity(moveLeft);
    
    
  }
  void moveRight(){
    
    Vec2 moveRight = new Vec2(30,body.getLinearVelocity().y);
    body.setLinearVelocity(moveRight);
  }
 
  void resetX()
  {
    Vec2 moveLeft = new Vec2(0,body.getLinearVelocity().y);
    body.setLinearVelocity(moveLeft);
  }

  void moveUp(){
    
    if(body.getLinearVelocity().y == 0)
    {
      Vec2 vel = body.getLinearVelocity();
    float desiredVel = 100;
    float velChange = desiredVel - vel.y;
    float impulse = body.getMass() * velChange;
    Vec2 apply = new Vec2 (0, impulse);
    body.applyLinearImpulse(apply,body.getWorldCenter(),true);
    
    }
    
  }
  void applyForce(Vec2 force) 
  {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
  }
}