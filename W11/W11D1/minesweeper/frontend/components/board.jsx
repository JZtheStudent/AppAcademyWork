import React from 'react';
import Tile from './tile';


class Board extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  renderRows = () => {
    const board = this.props.board;
    return (
      board.grid.map((row, i) => {
        return (
          <div key={i} className="row">
            {this.renderTiles(row, i)}
          </div>
        );
      })
    );
  };

  renderTiles = (row, i) => {
    const board = this.props.board;
    return (
      row.map((tile, j) => {
        return (
            <Tile
              value={tile}
              updateBoard={this.props.onUpdate}
              key={[i, j]}
            />
        );
      })
    );
  };

  render() {
    const board = this.renderRows();
    return (
      <div className="board">
        {board}

      </div>
    );
  }
}

export default Board;