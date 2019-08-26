import React, { Component } from 'react';
import Typed from 'typed.js';

class Question extends Component {
  constructor(props) {
    super(props);
    this.state = {
      typeSpeed: 30,
      backSpeed: 40,
      backDelay: 500,
      smartBackspace: true,
      loop: false,
      onComplete: this.props.afterComplete,
      strings: this.props.strings
    }
  }

  handleTypedRender() {
    const { onComplete, strings, typeSpeed, backSpeed, backDelay, smartBackspace, loop } = this.state;
    // You can pass other options here, such as typing speed, back speed, etc.

    const options = {
      strings: strings,
      typeSpeed: typeSpeed,
      backSpeed: backSpeed,
      backDelay: backDelay,
      smartBackspace: smartBackspace,
      loop: loop,
      onComplete: onComplete
    };

    if (this.typed) {
      this.typed.destroy();
    }
    this.typed = new Typed(this.el, options);
  }

  componentDidMount() {
    this.handleTypedRender();
    // this.el refers to the <span> in the render() method
  }

  componentWillUnmount() {
    // Make sure to destroy Typed instance on unmounting to prevent memory leaks
    this.typed.destroy();
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps !== this.props) {
      const { afterComplete, strings } = nextProps;
      this.setState({
        strings: strings,
        onComplete: afterComplete,
      });
    }
  }

  shouldComponentUpdate(nextProps) {
    return nextProps.strings !== this.props.strings
  }

  componentDidUpdate() {
    console.log('question updated!');
    this.handleTypedRender();
  }

  render() {
    return (
      <span
        className="type-text"
        ref={(el) => { this.el = el; }}
      />
    );
  }
}

export default Question;