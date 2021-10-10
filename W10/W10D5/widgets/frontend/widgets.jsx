import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';
import Autocomplete from './autocomplete';

let tabContent = [
  {title: 'Title I', content: 'Content I'},
  {title: 'Title II', content: 'Content II'},
  {title: 'Title III', content: 'Content III'},
]

let names = ['josh', 'josiah', 'alyssa', 'abdon', 'erin']


function Root() {
  return (
    <div id="main-container">
      <Clock/>
      <Tabs tabs={tabContent}/>
      <Autocomplete names={names}/>
    </div>
  );
};



document.addEventListener('DOMContentLoaded', () => {
  const main = document.getElementById('main');
  ReactDOM.render(<Root/>, main);
});


