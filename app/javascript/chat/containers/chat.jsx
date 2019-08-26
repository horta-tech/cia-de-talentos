import React, { Component } from 'react';
import Question from '../components/question';
import Answer from '../components/answer';

// Import images

import hortaLogo from '../../../assets/images/c.png';

// Configure Redux
import { connect } from "react-redux";
import { bindActionCreators } from "redux";
import { initializeChat, getQuestion } from "../actions/index";

class Chat extends Component {

  constructor(props) {
    super(props);

    this.state = {
      displayAnswers: false
    }
  }

  componentDidMount() {
    const { actions } = this.props;
    actions.initializeChat();
  }

  handleTypeEnd = () => {
    console.log('type end!')
    this.setState({
      displayAnswers: true
    })
    console.log('display answers?')
    console.log(this.state.displayAnswers)
  }

  componentWillReceiveProps(nextProps) {
    console.log('Chat receiving props!!')
    if (nextProps.question.typed_texts !== this.props.question.typed_texts) {
      this.setState({
        displayAnswers: false
      })
    }
  }

  shouldComponentUpdate() {
    console.log('should update?')
    return true;
  }

  componentDidUpdate() {
    console.log('Chat updated!');
  }

  render () {
    console.log('RENDERING CHAT')
    const { question } = this.props;
    console.log(question);
    console.log(question.typed_texts);
    // const answers = question.answers;
    return (
      <div className="chat-container">
        <div className="msg-box">
          <img className="horta-chat-icon" src={hortaLogo} />
          <div className="msg-text">
            <Question
              strings={question.typed_texts}
              afterComplete={this.handleTypeEnd}
            />
          </div>
        </div>
        {question.answers.map((answer, index) => {
          if (this.state.displayAnswers) {
            return <Answer key={index} data={answer} />
          }
        })}
      </div>
    );
  }
};

const mapStateToProps = state => {
  return {
    question: state.baseReducer.question
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
)(Chat);
