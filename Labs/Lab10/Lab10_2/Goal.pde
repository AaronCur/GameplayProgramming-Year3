class Goal{
  
  Body body;
  
  float x,y,r1,r2;
  int npoints;
   
  Goal(float x_, float y_, float r1_, float r2_, int npoints_) {
    
   
    r1= r1_;
    r2 = r2_;
    x = x_;
    y = y_;
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