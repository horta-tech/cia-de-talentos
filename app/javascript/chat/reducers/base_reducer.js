import { GET_DATA } from "../actions";
import { GET_QUESTION } from "../actions";
import { INIT_CHAT } from "../actions";

const initialState = {
  question: {
    typed_texts: [],
    answers: []
  }
};

export default function(state = initialState, action) {
  const { type, payload } = action;

  switch (type) {
    case GET_DATA: {
      return payload
    }
    case INIT_CHAT: {
      console.log('initializing chat')
      console.log(payload);
      return payload
    }
    case GET_QUESTION: {
      console.log('getting question')
      console.log(payload);
      return payload
    }
    default: {
      return state;
    }
  }
}