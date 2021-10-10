import React from 'react';
import {Route} from 'react-router-dom';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import PokemonDetail from './pokemon/pokemon_detail';

const App = () => {
  return (  

    <Route path="/" component={PokemonIndexContainer} />
  );
}
 
export default App;
