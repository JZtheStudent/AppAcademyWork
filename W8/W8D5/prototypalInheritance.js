

Function.prototype.inherits = function(parentClass){
    function Surrogate () {};

    Surrogate.prototype = parentClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

// function MovingObject () {}

// function Ship () {}
// Ship.inherits(MovingObject);

// function Asteroid () {}
// Asteroid.inherits(MovingObject);

