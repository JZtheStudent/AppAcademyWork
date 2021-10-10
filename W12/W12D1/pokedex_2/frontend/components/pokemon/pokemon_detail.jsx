import React from 'react';

class PokemonDetail extends React.Component {

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentDidUpdate(prevProps) {
    if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId) {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId);
    }
  }


  render() {
    return (
      <div>
        <h1>Pokemon Detail</h1>
      </div>
    );
  }
}

export default PokemonDetail;