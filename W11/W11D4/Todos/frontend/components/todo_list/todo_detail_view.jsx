import React from 'react';

import StepListContainer from "../step_list/step_list_container";

const TodoDetailView = (props) => {
  return (  
    <div>
      <li>{props.todo.title}</li>
      <StepListContainer todo_id={props.todo.id} />
      <button onClick={() => props.removeTodo(props.todo)}>Delete</button>
      
    </div>
  );
}
 
export default TodoDetailView;