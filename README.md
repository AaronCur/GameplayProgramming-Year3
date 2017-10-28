#Gameplay Programming year 3
This repositiory contains labs completed throughout the year as part of my Gameplay Programming module

#Note
Lab 5 and Lab 8 are missing from this repository as they were completed with the process of pair programming.
The finish projects are on my partners repository.
I included the details of each lab below

##Lab 5 
This lab involves a simplified version of the classic game Missile Command.  Click the below image to see a short youtube clip of the game play:

This lab will be done in groups of two using Pair Programming.  The rules are:

-2 programmers, single computer, 2 roles:
-Driver:
Controls the mouse/keyboard
Deals with the details
-Navigator:
Thinks higher level
Watches for typos, logical errors
-Switch roles every 10-20 minutes

Once you have agreed on your pair, let the lecturer know who the pair is and whose computer you are going to use (all commits will be done from that machine; when you have finished the lab, a copy of your solution folder should be committed to the other person’s repo).  
###1 Draw a moving blue line
Click on a point with the mouse.  A blue line is slowly drawn to that point starting from the center of the bottom of screen.

###2 Explosion
When the blue line reaches the point clicked with the mouse, it creates an expanding circle (an explosion) which expands fully  over a period of about 500ms
When it reaches its maximum size, it disappears.

###3 Multiple missiles 
Each mouse click spawns a new missile
A limit of 5 missiles can be alive at any time. 
 
###4 Draw the enemy lines
Meantime, red lines are slowly drawn from the top of the screen from a random point at the top of the screen in random direction.  However, not every random direction will work - select the direction to ensure that the red line will impact the bottom of the screen if it is not destroyed) 

###5 Destroy the enemies
If the end point of the red line intersects with an explosion, the red line disappears.
5 red lines should be on screen at any time (when one is destroyed, another should start at the top of the screen)

###6 Game over
If any missile hits the bottom of the screen, display “Game Over” screen.


##Lab 8
This lab will be done in groups of two using Pair Programming.  The rules are:

-2 programmers, single computer, 2 roles:
-Driver:
Controls the mouse/keyboard
Deals with the details
-Navigator:
Thinks higher level
Watches for typos, logical errors
-Switch roles every 10-20 minutes 

###1 Record a throw
One person throw a ball, and the other person records it on their phone.  
Keep in mind that the ball has to be tracked in 2D.

###2 Play the video
Modify this code to play the video in Processing
Note: the video needs to be in a directory called data at the same level of your pde file.
You also need to import the video library:
Sketch|Import library|Add Library…

###3 Incorporate projectile
Bring in your code from the projectile lab so that you draw the projectile motion overlaid on the video.

###4 Tune
Tune the motion so that your projectile simulation matches the ball in the video as closely as possible

