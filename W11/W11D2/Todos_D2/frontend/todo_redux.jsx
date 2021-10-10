import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';

import Root from './components/root';

import {receiveTodos, receiveTodo, removeTodo, updateTodo} from './actions/todo_actions';
import {receiveSteps, receiveStep, removeStep} from './actions/step_actions';

import allTodos from './reducers/selectors';




document.addEventListener('DOMContentLoaded', () => {
  const main = document.getElementById('main');
  

  const store = configureStore();
  window.store = store;
  
  
  
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;
  window.updateTodo = updateTodo;

  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;
  
  window.allTodos = allTodos;
  ReactDOM.render(<Root store={store} />, main);
});
