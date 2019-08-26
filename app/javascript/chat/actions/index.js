// Set types
export const GET_DATA = "GET_DATA";
export const GET_QUESTION = "GET_QUESTION";
export const INIT_CHAT = "INIT_CHAT";


// Import dependencies
// import board from '../../../assets/images/board.jpg';
// import question from '../../../assets/images/question.jpg';
// import food from '../../../assets/images/food.jpg';

import Api from './api';

// Set actions

export function baseAction(data) {
  return {
    type: GET_DATA,
    payload: data
  };
}

export function initializeChat() {
  return async dispatch => {
    const INIT_URL = "/get_question/initialize_chat"
    let question = await Api.get(INIT_URL)

    dispatch({
      type: INIT_CHAT,
      payload: {
        question: question
      }
    });
  }
}

export function getQuestion(id) {

  return async dispatch => {
    const URL = `/get_question/${id}`
    let nextQuestion = await Api.get(URL)

    dispatch({
      type: GET_QUESTION,
      payload: {
        question: nextQuestion
      }
    });
  }
}