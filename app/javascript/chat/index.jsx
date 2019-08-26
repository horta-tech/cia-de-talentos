// external modules
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware, compose } from 'redux';
import thunk from "redux-thunk";
import logger from 'redux-logger';
import reduxPromise from 'redux-promise';

// internal modules
import Chat from './containers/chat';

// State and Reducers
import baseReducer from './reducers/base_reducer';

const identityReducer = (state = null) => state;

const initialState = {

};

const reducers = combineReducers({
  baseReducer
});

// Store and Middlewares
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const middlewares = composeEnhancers(applyMiddleware(reduxPromise, thunk, logger));
const store = createStore(reducers, initialState, middlewares);

// render an instance of the component in the DOM
ReactDOM.render(
  <Provider store={store}>
    <Chat className="horta-app"/>
  </Provider>,
  document.getElementById('app')
);