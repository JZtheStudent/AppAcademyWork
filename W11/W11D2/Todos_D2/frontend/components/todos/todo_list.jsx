import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

const TodoList = (props) => {
  
  return (
    <div>
        <h1>Here are the todos</h1>
        <ul>
          {
            props.todos.map((todo,i) => {
              return <TodoListItem 
                removeTodo={props.removeTodo}
                updateTodo={props.updateTodo}
                todo={todo}
                key={i}/>
            })
          }
        </ul>
        <TodoForm receiveTodo={props.receiveTodo}/>
      
    </div>
  )
}

export default TodoList;

