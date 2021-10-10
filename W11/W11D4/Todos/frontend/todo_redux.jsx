import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';

import Root from './components/root';

import {receiveTodo, removeTodo, updateTodo} from './actions/todo_actions';
import {receiveSteps, receiveStep, removeStep} from './actions/step_actions';

import allTodos from './reducers/selectors';


import {fetchTodos} from './actions/todo_actions';


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  

  const store = configureStore();
  window.store = store;
  
  
  
  window.receiveTodo = receiveTodo;
  window.removeTodo = removeTodo;
  window.updateTodo = updateTodo;

  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;
  
  window.allTodos = allTodos;
  window.fetchTodos = fetchTodos;
  ReactDOM.render(<Root store={store} />, root);
});
