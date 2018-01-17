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
     this.velocity.y = 0;
     this.acceleration = []
     this.acceleration.x = 0;
     this.acceleration.y = -0.2;
     this.lifespan = 1;

     this.img=new Image();
     this.img.src = "smoke.png";

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


    ctx.globalAlpha = this.lifespan;
    var image = this.img;
    ctx.drawImage(image, this.location.x, this.location.y);
  }



}
