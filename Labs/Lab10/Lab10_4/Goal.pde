class Goal{
  
  Body body;
  
  float x,y,r1,r2;
  //float w,h;
  int npoints;
  
 // float radius = 50;
   
  Goal(float x, float y, float r1_, float r2_, int npoints_) {
    
   
    r1= r1_;
    r2 = r2_;
    npoints = npoints_;
  
     //makePentagon(x,y);
     

}
void star(float x, float y, float radius1, float radius2, int npoints) {
  
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx,sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  
  }
  endShape(CLOSE);
    
}
//void makePentagon(float x, float y)
//{
  //Vec2[] vertices = new Vec2[5];
    //vertices[0] = box2d.vectorPixelsToWorld(new Vec2(70, 66.57396));
    //vertices[1] = box2d.vectorPixelsToWorld(new Vec2(21.631187, 66.57396));
    //vertices[2] = box2d.vectorPixelsToWorld(new Vec2(-56.631195, 41.144962));
    //vertices[3] = box2d.vectorPixelsToWorld(new Vec2(-56.631187, -41.144974));
    //vertices[4] = box2d.vectorPixelsToWorld(new Vec2(21.631199, -66.57395));

    // Define a polygon (this is what we use for a rectangle)
    //PolygonShape ps = new PolygonShape();
    //ps.set(vertices, vertices.length);

    // Define the body and make it from the shape
    //BodyDef bd = new BodyDef();
    //bd.type = BodyType.STATIC;
    //bd.position.set(box2d.coordPixelsToWorld(x,y));
    //body = box2d.createBody(bd);

    //body.createFixture(ps, 1.0);


    // Give it some initial random velocity
   
//}
//void makepentagon(float x, float y, float radius1, float radius2, int npoints)
   void display() {
    pushMatrix();
    translate(width*0.8, height*0.5);
    rotate(60);
    fill(255,255,0);
    stroke(0);
    strokeWeight(2);
    star(0, 0, 30, 70, 5); 
    popMatrix();
   
  }
  
 

}