import {connect} from 'react-redux';
import TodoList from './todo_list';
import {removeTodo, updateTodo} from '../../actions/todo_actions';
import { fetchTodos, createTodo } from '../../actions/todo_actions';
import { clearErrors } from '../../actions/error_actions';

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: Object.values(state.errors)
 
});

const mapDispatchToProps = dispatch => ({
  
  removeTodo: todo => dispatch(removeTodo(todo)),
  updateTodo: todo => dispatch(updateTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: (todo) => dispatch(createTodo(todo)),
  clearErrors: () => dispatch(clearErrors())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);