## Lab 7

### 1.Draw a level
The level has a ground and a goal (represented by a rectangle with a white outline and no fill)  

### 2. Draw the player
The player is represented by a red rectangle.  
Arrow keys to move.  When the right (or left) keys are held, add (or subtract) a fixed amount to the player’s position on each frame.  
When the player collides with the goal, the player rectangle turns from red to white (and stays white as long as the player is colliding with the goal, otherwise turns back to red).

### 3. Add an obstacle
Add a rectangle between the player and the goal.  
The rectangle is the same colour as the ground and looks as though it is part of it.  
When the player hits off the obstacle it cannot pass through it

### 4. Jump
A single press of the jump key (either up or space) will to make the player jump a fixed height.   
Movement is done by setting a velocity in the y direction when the key is pressed and subtracting off gravity on each frame.  
Pressing jump while already jumping has no effect
When the player reaches the ground, it stops moving in the y direction
The player’s x velocity is not affected by jumping 
The player should be able to jump over the obstacle and get to the goal

