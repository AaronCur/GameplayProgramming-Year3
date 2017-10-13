Level l;
Goal g;
Player p;
Obstacle o;
void setup() {
  size(1777,1000);
  smooth();
  l = new Level(); 
  g = new Goal();
  p = new Player();
  o = new Obstacle();
  
}

void draw() {
  
  
 
  background(127);

 
  l.display();
  g.display();
  g.collision(p);
  p.update(l);
  p.display(g);
  o.display();
  o.checkCollision(p);
  
  
  
  
  
}
void keyPressed()
{
 
 
  if(key == CODED)
  {
      //Code to to move player left or right when its inside the boundaries
      if (keyCode == RIGHT && p.location.x < 1777 - p.m_width && p.keyDown == false )
     {
       p.jumpRight = true;
       p.moveRight();
       
     }
      if (keyCode == LEFT && p.location.x > 0)
     {
       p.moveLeft();
       
     }
     
      if (keyCode == UP )
     {
       p.jump();
     }
     
  }
}

void keyReleased()
{
 
 
  if(key == CODED)
  {
      //Code to to move player left or right when its inside the boundaries
      if (keyCode == RIGHT )
     {
       p.jumpRight = false;
       p.moveRight();
       
     }
      if (keyCode == LEFT )
     {
       p.jumpLeft = false;
       p.moveLeft();
       
     }
     
  }
}