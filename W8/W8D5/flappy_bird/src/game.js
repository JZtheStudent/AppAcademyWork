import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }

  animate() {
    Level.animate();
  }

  restart() {
    this.level = new Level({width: 640, height: 480});
    this.animate();
  }

}