class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.handleClick = this.handleClick.bind(this);
    this.setupBoard();
    this.bindEvents();
  }
  
  setupBoard() {
    let ul = document.createElement("ul");
    
    for (let row = 0; row < 3; ++row) {
      for (let col = 0; col < 3; ++col) {
        let li = document.createElement("li");
        li.dataset.pos = JSON.stringify([row, col]);
        ul.append(li);
      }
    }
    this.el.append(ul);

  }
  
  bindEvents() {
    this.el.addEventListener("click", this.handleClick);
  }
  
  handleClick(e) {
    let el = e.target;
    if (el.nodeName === "LI") {
      this.makeMove(el);
    }
  }
  
  makeMove(square) {
    const pos = JSON.parse(square.dataset.pos);
    const currentPlayer = this.game.currentPlayer;

    try {
      this.game.playMove(pos);
    } catch (e) {
      alert("This " + e.msg.toLowerCase());
    }

    square.classList.add(currentPlayer);

    if (this.game.isOver()) this.handleGameOver()
  }

}

module.exports = View;
