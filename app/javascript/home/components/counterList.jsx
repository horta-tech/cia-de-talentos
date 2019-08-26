import React, { Component } from 'react';

import Counter from './counter.jsx';
import { Fade, Zoom } from 'react-reveal';



class CounterList extends Component {
  constructor(props) {
    super(props);
    this.state = {

    }
  }

  render() {
    const { seoCount, codeCount, instaCount } = this.state;
    return (
      <div className="stats-box bg-horta d-flex text-center">

        <Zoom>
          <Counter delay={1} end={42} duration={3} text="feeds sensacionais" />
          <Counter delay={2.5} end={850} duration={3} text="conteúdos SEO" />
          <Counter delay={5} end={35702} duration={5} text="linhas de código" />
        </Zoom>


      </div>
    );
  }
}

export default CounterList;
