/**
*helper funtion that constructs game
*/
class ParticleSystem
{
  constructor()
  {

    console.log("game constructed");
    gameNs.particles = [];
  }

  update()
  {
    var canvas = document.getElementById('mycanvas');
    var ctx = canvas.getContext('2d');
    ctx.clearRect(0,0,canvas.width, canvas.height);

    if(gameNs.particles.length < 1000)
    {
        gameNs.particles.push(new Particle(450,1100));
    }

    for(var i =0; i < gameNs.particles.length; i++)
    {
      gameNs.particles[i].run();
      if(gameNs.particles[i].lifespan <0.01)
      {
          gameNs.particles.splice(i,1);
      }

    }

  }

}
