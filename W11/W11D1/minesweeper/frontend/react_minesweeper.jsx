import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/game';


function Root() {
  return (
    <div>
      <Game/>

    </div>
  );
};



document.addEventListener('DOMContentLoaded', () => {
  const main = document.getElementById('main');
  ReactDOM.render(<Root/>, main);
});
