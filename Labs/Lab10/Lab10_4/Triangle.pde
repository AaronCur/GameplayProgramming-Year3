// A rectangular box
class Triangle {

  // We need to keep track of a Body and a width and height
  Body body;
  Vec2[] vertices;
  Vec2[] center;
  float centerX;
  float centerY;
  // Constructor
  Triangle(float x1, float y1, float x2 ,float y2, float x3, float y3) {
    // Add the box to the box2d world
    vertices = new Vec2[3];
    centerX= (x1 + x2 + x3) / 3;
    centerY= (y1 + y2 + y3) / 3;
   
    vertices[0] = new Vec2(x1, y2);
    vertices[1] = new Vec2(x2, y2);
    vertices[2] = new Vec2(x3, -y3);

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length);

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(centerX,centerY);
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