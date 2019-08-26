import React, { Component } from 'react';
import CountUp from 'react-countup';


class Counter extends Component {
  render() {
    const {delay, end, duration, text} = this.props
    return (
      <div className="stats-wrapper">
        <div className="stats-number">
          <CountUp delay={delay} end={end} duration={duration} />
        </div>
        <div className="stats-text">
          {text}
        </div>
      </div>
    );
  }
}

export default Counter;
