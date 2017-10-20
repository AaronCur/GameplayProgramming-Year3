import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A list for all of our rectangles
ArrayList<Box> boxes;
Box2DProcessing box2d;

void setup() {
  size(640,360);
  // Create ArrayLists
  boxes = new ArrayList<Box>();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
}

void draw() {
  box2d.step();
  
  background(255);

  // When the mouse is clicked, add a new Box object
  if (mousePressed) {
    Box p = new Box(mouseX,mouseY);
    boxes.add(p);
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
}