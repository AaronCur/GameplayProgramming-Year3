class Particle
{
  /**
  *constructor Function to creat instances of TouchTest
  *
  */
  constructor(_locationX,_locationY)
  {
     this.location = [];
     this.location.x= _locationX;
     this.location.y = _locationY;
     this.velocity = [];
     this.velocity.x = Math.floor(Math.random() * 1) -1  ;
     this.velocity.y = Math.floor(Math.random() * 0) -2  ;
     this.acceleration = []
     this.acceleration.x = 0;
     this.acceleration.y = 0.05;
     this.lifespan = 255;

  }
  run()
  {

  }
  update()
  {
    this.velocity.x += this.acceleration.x;
    this.velocity.y += this.acceleration.y;
    this.location.x += this.velocity.x;
    this.location.y += this.velocity.y;

    this.lifespan -= 2.0;
  }
  display()
  {
    var canvas = document.getElementById('circle');
    var ctx = canvas.getContext('2d');
    var X = canvas.width / 2;
    var Y = canvas.height / 2;
    var R = 45;
    ctx.beginPath();
    ctx.arc(X, Y, R, 0, 2 * Math.PI, false);
    ctx.lineWidth = 3;
    ctx.strokeStyle = '#FF0000';
    ctx.fill();
    ctx.stroke();
  }

}
