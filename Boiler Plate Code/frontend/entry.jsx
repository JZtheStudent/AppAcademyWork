import React from 'react';
import ReactDOM from 'react-dom';





function Root() {
  return (
    <div>
      <h1>React ain't broken</h1>
    </div>
  );
};



document.addEventListener('DOMContentLoaded', () => {
  const main = document.getElementById('main');
  ReactDOM.render(<Root/>, main);
});
