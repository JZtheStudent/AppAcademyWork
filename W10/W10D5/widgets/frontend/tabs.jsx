import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { selected: 0 }
  }
  
  selectTab = (tab) => {
    this.setState({selected: tab});
  }

  render() { 
    
    const tab = this.props.tabs[this.state.selected];

    return (
      <div>
        <h1>Tabs</h1>
        <Headers
          selected = {this.state.selected}
          tabs = {this.props.tabs}
          onTabChosen = {this.selectTab}
        >
        
        </Headers>
        <article>
          {tab.content};
        </article>
      </div>
     );
  }
}
 


class Headers extends React.Component {

  render() { 
    const selected = this.props.selected;
    const headers = this.props.tabs.map((tab, idx) => {
      const title = tab.title;
      const klass = idx === selected ? 'active' : '';
      return (
        <li
          key = {idx}
          className = {klass}
          onClick={() => this.props.onTabChosen(idx)}>
        {title}{' '};
        </li>
      );
    })
    return (
      <div>
        {headers}
      </div> 
    );
  }
}
 
export default Tabs;