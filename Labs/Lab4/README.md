##Lab 4
###1. Bouncing ball 
Create a ball that bounces off the edges of the screen using vectors.   If any part of the ball touches the wall it bounces off it (half of the ball does not disappear off screen).
Hint: negate direction vector
###2. Bouncing balls with collision detection
Add a second bouncing ball.  When two balls collide (use circle-circle collision detection) the balls that collide should change colour to red for one second and then return to the colour they were.  Note there is no collision response, the balls will pass through each other.
Hint: Use millis() to keep track of the time.  
###3. Bouncing multiple balls with collision response
When two balls collide (use circle-circle collision detection), they bounce off each other using the below formula:

Note: The formula can also be represented as follows:
'''
 (Source: https://stackoverflow.com/questions/345838/ball-to-ball-collision-detection-and-handling#comment18597945_345838 )


Where v1f and v2f are the final velocities of ball 1 and ball 2 (after the collision) and v1i and v2i the initial velocities (before the collision).  The mass you can set depending on the size of the ball (bigger ball should have bigger mass).  
'''

###4. Bouncing multiple balls
Use an array to extend the previous step to bounce 10 balls with random colours and sizes off the edges of the screen with collision. 

