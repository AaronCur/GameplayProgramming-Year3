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
      gameNs.particles.push(new Particle(300,50));
    }

  }

  initWorld()
  {
      console.log("game initialising");



  }

  update()
  {
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
