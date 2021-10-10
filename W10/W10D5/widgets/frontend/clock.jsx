import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    };
  }

  tick = () => {
    this.setState({ time: new Date() });
  };
  
  componentDidMount() {
    this.handle= setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearTimeout(this.handle);
  }

 
  render() {
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();
    
    if (hours < 10) hours = "0" + hours.toString();
    if (minutes < 10) minutes = "0" + minutes.toString();
    if (seconds < 10) seconds = "0" + seconds.toString();

    return (
      <div id="clock-container">
        <h1 id="clock-title">Clock</h1>
        <h2 id="clock-time">
          {hours}:{minutes}:{seconds}
        </h2>
      </div>
    );
  }


}

export default Clock;