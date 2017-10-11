Level l;
Goal g;
Player p;
void setup() {
  size(1777,1000);
  smooth();
  l = new Level(); 
  g = new Goal();
  p = new Player();
  
}

void draw() {
  background(127);

  l.display();
  g.display();
  g.collision(p);
  p.display(g);
  
}
void keyPressed()
{
 
 
  if(key == CODED)
  {
      //Code to to move player left or right when its inside the boundaries
      if (keyCode == RIGHT && p.location.x < 1777 - p.m_width )
     {
       p.location.x +=5;
       p.location2.x +=5;
        
     }
      if (keyCode == LEFT && p.location.x > 0)
     {
       p.location.x -=5;
       p.location2.x -=5;
     }
     
  }
}