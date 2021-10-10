const View = require('./ttt-view');
const Game = require('../ttt_node/game');

document.addEventListener("DOMContentLoaded", () => {
  let game = new Game();

  let el = document.querySelector(".ttt");
  new View(game, el);

});
