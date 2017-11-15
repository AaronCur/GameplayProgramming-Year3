// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// PBox2D example

// Class to describe a fixed spinning object

class Motor {

  // Our object is two boxes and one joint
  // Consider making the fixed box much smaller and not drawing it
  RevoluteJoint joint;
  Hammer hammer;
  AnchorBox anchorBox;

  Motor(float x, float y) {

    // Initialize locations of two boxes
    hammer= new Hammer(x, y , false); 
    anchorBox = new AnchorBox(x, y , 50, 50, true); 

    // Define joint as between two bodies
    RevoluteJointDef rjd = new RevoluteJointDef();

    rjd.initialize(hammer.body, anchorBox.body, anchorBox.body.getWorldCenter());

    // Turning on a motor (optional)
    rjd.motorSpeed = -PI*10;       // how fast?
    rjd.maxMotorTorque = 10000000.0; // how powerful?
    rjd.enableMotor = true;      // is it on?

    // There are many other properties you can set for a Revolute joint
    // For example, you can limit its angle between a minimum and a maximum
    // See box2d manual for more
    

      // Create the joint
    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }

  // Turn the motor on or off
  void toggleMotor() {
    joint.enableMotor(!joint.isMotorEnabled());
  }

  boolean motorOn() {
    return joint.isMotorEnabled();
  }


  void display() {
    hammer.display();
    anchorBox.display();

    // Draw anchor just for debug
    Vec2 anchor = box2d.coordWorldToPixels(anchorBox.body.getWorldCenter());
    fill(0);
    noStroke();
    ellipse(anchor.x, anchor.y, 8, 8);
  }
}