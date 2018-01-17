/**
*helper funtion that constructs game
*/
class Game
{
  constructor()
  {

    console.log("game constructed");
    this.ps = new ParticleSystem();
    //this.stats = new Stats();
  //  this.stats.showPanel( 1 ); // 0: fps, 1: ms, 2: mb, 3+: custom
  //  document.body.appendChild( stats.dom );

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

  //  var stats = new Stats();
    //stats.showPanel( 1 ); // 0: fps, 1: ms, 2: mb, 3+: custom
    //document.body.appendChild( stats.dom );
    //this.stats.begin();
    gameNs.game.ps.update();
    //this.stats.end();

  }


  draw()
  {
    //window.requestAnimationFrame(gameNs.game.draw);

    //this.particle.run();
  }

}
