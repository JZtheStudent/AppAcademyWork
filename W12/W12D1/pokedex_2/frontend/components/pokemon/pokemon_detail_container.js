import {connect} from 'react-redux';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';
import { selectPokemonMovesNames } from './../../reducers/selectors';

const mapStateToProps = (state, ownProps) => {
  return {
    pokemon: state.entitites.pokemon[ownProps.match.params.pokemonId],

  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    requestSinglePokemon: (pokeId) => dispatch(requestSinglePokemon(pokeId))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)