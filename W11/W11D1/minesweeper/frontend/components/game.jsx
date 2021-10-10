import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = { board: new Minesweeper.Board(9, 15) };
  }

  updateGame = (tile, flagToggled) => {
    if (flagToggled) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }



    this.setState({ board: this.state.board });

  };

  restart = () => {
    this.setState({board: new Minesweeper.Board(9, 15)})
  }

  render() {

    let modal;
    let modalScreen;
    if (this.state.board.lost() || this.state.board.won()) {
      const message = this.state.board.lost() ? ("Game Over") : ("You won!")

      let modalClass = "modal-screen";


      modal =  <div className={modalClass}>
        <div id="modal-message">
          <p>{message}</p>
          <button onClick={this.restart}>Restart</button>
        </div>
      </div>
    }
    



    return (
      <div className="game">
        <h1>Minesweeper</h1>
        {modal}
        {modalScreen}
        <Board
          board={this.state.board}
          onUpdate={this.updateGame}
        />
      </div>
    );
  }
}

export default Game;