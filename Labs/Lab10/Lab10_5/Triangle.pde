// A rectangular box
class Triangle {

  // We need to keep track of a Body and a width and height
  Body body;
  Vec2[] vertices;
  Vec2 center;
  float centerX;
  float centerY;
  Vec2 v1;
  Vec2 v2;
  Vec2 v3;
  // Constructor
  Triangle(Vec2 x1_, Vec2 x2_, Vec2 x3_) {
    // Add the box to the box2d world
    vertices = new Vec2[3];
    v1 = x1_;
    v2 = x2_;
    v3 = x3_;
    centerX= (v1.x + v2.x + v2.x) / 3;
    centerY= (v1.y + v2.y + v3.y) / 3;
    
   
    vertices[0] =  box2d.coordPixelsToWorld (new Vec2(v1.x, v1.y));
    vertices[1] =  box2d.coordPixelsToWorld (new Vec2(v2.x, v2.y));
    vertices[2] =  box2d.coordPixelsToWorld (new Vec2(v3.x, v3.y));

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length);

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(v1));
    body = box2d.createBody(bd);
    body.setUserData(this);  
    body.createFixture(ps, 1.0);


    // Give it some initial random velocity
   // body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
  //  body.setAngularVelocity(random(-5, 5));
  }


  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();


    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(127);
    stroke(0);
    strokeWeight(6);
    beginShape();
    //println(vertices.length);
    // For every vertex, convert to pixel vector
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }

  
}