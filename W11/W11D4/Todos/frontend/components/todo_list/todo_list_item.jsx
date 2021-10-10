import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container';


class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { detailsShow: false }
  }
  
  toggleDone = () => {
    this.props.updateTodo(
      {
        id: this.props.todo.id,
        title: this.props.todo.title,
        body: this.props.todo.body,
        done: !this.props.todo.done
      }
    )      
  }
  
  toggleShowDetails = (e) => {
    e.preventDefault();
    this.setState({detailsShow: !this.state.detailsShow});
  }
  
  render() { 
    return (  
      <div>
      <a onClick={this.toggleShowDetails} className="todo-title"><h2>{this.props.todo.title}</h2></a>
      <button onClick={this.toggleDone}>{this.props.todo.done ? 'undo' : 'done'}</button>
      
      {
        this.state.detailsShow ?  
          <TodoDetailViewContainer
          className="hidden"
          todo={this.props.todo}/> : ""
         
        
      }
      
    </div>
    );
  }
}
 
export default TodoListItem;