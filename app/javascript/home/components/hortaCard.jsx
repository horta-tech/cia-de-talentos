import React, { Component } from 'react';



class HortaCard extends Component {
  render() {
    const {title, list} = this.props

    return (
      <div className="horta-card horta-tech">
        <h2>{title}</h2>
        <div className="green-dash"></div>
        <ul className="list-unstyled horta-list">
          {list.map((item, index) => <li key={index}>+ {item}</li>)}
        </ul>
      </div>
    );
  }
}

export default HortaCard;
