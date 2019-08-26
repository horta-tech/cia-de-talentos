import React, { Component } from 'react';

// Configure Redux
import { connect } from "react-redux";
import { bindActionCreators } from "redux";
import { initializeChat, getQuestion } from "../actions/index";

class Answer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      final_path: this.props.data.final_path,
      next_question: this.props.data.next_question_id
    }
  }

  handleClick = () => {
    if (this.state.final_path) {
      window.open(this.state.final_path);
    } else {
    this.props.actions.getQuestion(this.state.next_question);
    }
  }



  render() {
    const { text, image } = this.props.data
    const style = {
      backgroundImage: `linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)), url(${image.url})`
    }

    return (
      <div onClick={this.handleClick} className="answer-box" style={style}>
        <p>{text}</p>
      </div>
    );
  }
}

const mapStateToProps = state => {
  return {
    question: state.baseReducer,
    answers: state.baseReducer.answers
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    actions: bindActionCreators(
      {
        initializeChat,
        getQuestion
      },
      dispatch
    )
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Answer);