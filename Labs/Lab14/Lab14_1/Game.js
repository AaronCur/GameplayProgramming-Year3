/**
*helper funtion that constructs game
*/
class Game
{
  constructor()
  {

    console.log("game constructed");
    gameNs.particles = [];

    for(var i = 0; i < 100; i++)
    {
      gameNs.particles.push(new Particle(500,100));
   }
  // gameNs.particles[0].location.x = 200;
  // gameNs.particles[0].location.y = 100;

  // gameNs.particles[1].location.x = 300;
  // gameNs.particles[1].location.y = 100;
  }

  initWorld()
  {
      console.log("game initialising");



  }

  update()
  {
    var canvas = document.getElementById('mycanvas');
    var ctx = canvas.getContext('2d');
    ctx.clearRect(0,0,canvas.width, canvas.height);
    window.requestAnimationFrame(gameNs.game.update);
    for(var i =0; i < 100; i++)
    {
      gameNs.particles[i].run();

    }


  }


  draw()
  {
    //window.requestAnimationFrame(gameNs.game.draw);

    //this.particle.run();
  }

}
