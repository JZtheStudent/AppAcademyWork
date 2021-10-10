import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  handleClick = (e) => {
    const flagToggled = e.altKey ? true : false;
    this.props.updateBoard(this.props.value, flagToggled);
  };

  render() {
    const tile = this.props.value;
    let tileValue;
    let explored = false;
    if (tile.explored) {
      explored = true;
      let adjacentBomb = tile.adjacentBombCount();
      if (tile.bombed) {
        tileValue = "💣";
      } else if (adjacentBomb === 0) {
        tileValue = " ";
      } else {
        tileValue = adjacentBomb.toString();
      }
    } else {
      if (tile.flagged) {
        tileValue = "⛳️";
      } else {
        tileValue = "";
      }

    }
    let klass = "tile ";
    if (explored) {
      klass += "explored";
    }



    return (


      <div className={klass} onClick={this.handleClick}>
        {tileValue}
      </div>
    );
  }
}

export default Tile;