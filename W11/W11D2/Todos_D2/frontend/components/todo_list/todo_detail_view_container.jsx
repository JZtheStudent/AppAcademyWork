import {connect} from 'react-redux';
import TodoDetailView from './todo_detail_view';

import {removeTodo, updateTodo} from '../../actions/todo_actions';


const mapDispatchToProps = dispatch => ({
  
  removeTodo: todo => dispatch(removeTodo(todo)),
  updateTodo: todo => dispatch(updateTodo(todo))
});

export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);