class Particle
{
  /**
  *constructor Function to creat instances of TouchTest
  *
  */
  constructor(_locationX, _locationY)
  {
     this.location = [];
     this.location.x= _locationX;
     this.location.y = _locationY;
     this.velocity = [];
     this.velocity.x = (Math.random() * 5) -2.5 ;
     this.velocity.y = (Math.random() * 4) - 2 ;
     this.acceleration = []
     this.acceleration.x = 0;
     this.acceleration.y = 0.1;
     this.lifespan = 1;

  }
  run()
  {

    this.update();
    this.render();

  }
  update()
  {
    this.velocity.x += this.acceleration.x;
    this.velocity.y += this.acceleration.y;
    this.location.x += this.velocity.x;
    this.location.y += this.velocity.y;

    this.lifespan -= 0.01;
  }
  render()
  {
    var canvas = document.getElementById('mycanvas');
    var ctx = canvas.getContext('2d');

    var R = 5;
    ctx.beginPath();
    ctx.arc(this.location.x, this.location.y, R, 0, 2 * Math.PI, false);
    ctx.lineWidth = 4;
    ctx.strokeStyle = "#7F7F7F";
    ctx.fillStyle = "#000000"
    ctx.globalAlpha = this.lifespan;
    ctx.stroke();
  }



}
