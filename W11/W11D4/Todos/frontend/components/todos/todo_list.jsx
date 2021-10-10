import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

class TodoList extends React.Component {
  
  constructor(props) {
    super(props)
  }
  
  componentDidMount() {
    this.props.fetchTodos()
  }

  render() {
    return (
      <div>
          <h1>Here are the todos</h1>
          <ul>
            {
              this.props.todos.map((todo,i) => {
                return <TodoListItem 
                  removeTodo={this.props.removeTodo}
                  updateTodo={this.props.updateTodo}
                  todo={todo}
                  key={i}/>
              })
            }
          </ul>
          <TodoForm 
            errors={this.props.errors }
            createTodo={this.props.createTodo}
            clearErrors={this.props.clearErrors}/>
        
      </div>
    )

  }
  
}

export default TodoList;

