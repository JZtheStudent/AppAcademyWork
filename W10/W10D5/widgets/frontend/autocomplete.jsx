import React from 'react';


class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = { inputVal: "" }
  }
  
  handleInput = (event) => {
    this.setState({inputVal: event.currentTarget.value});
  }
  
  matches = () => {
    const matches = [];
    if (this.state.inputVal.length === 0) {
      return this.props.names;
    }

    this.props.names.forEach(name => {
      const sub = name.slice(0, this.state.inputVal.length);
      if (sub.toLowerCase() === this.state.inputVal.toLowerCase()) {
        matches.push(name);
      }
    });

    if (matches.length === 0) {
      matches.push('No matches');
    }
    return matches;
  }

  selectName = (event) => {
    const name = event.currentTarget.innerText;
    this.setState({inputVal: name}); 
  }
  render() { 
    
    const results = this.matches().map((result, idx) => {
      return (
        <li key={idx} onClick={this.selectName}>{result}</li>
      );
    });
    
    return ( 
      <div>
        <h1>Autocomplete</h1>
        <input 
        type="text"  
        onChange={this.handleInput}
        placeholder="Search..."
        value={this.state.inputVal}/>
        <ul>
          {results}
        </ul>
      </div>
    );
  }
}
 
export default Autocomplete;