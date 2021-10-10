import React from 'react';


class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = { 
      id: new Date().getTime(), 
      title: "",
      body: "",
      done: false
    };
  }

  updateItem = (e, item) => {
    this.setState({[item]: e.target.value});
  }
  
  handleSubmit = (e) => {
    e.preventDefault();
    this.props.createTodo(this.state);
    this.setState({       
      id: new Date().getTime(), 
      title: "",
      body: "",
      done: false
    });
    this.props.clearErrors();
  }

  render() { 
    return ( 
      <div>
         <form onSubmit={this.handleSubmit}>
        
          <h2>Add a todo</h2>
          <label>Title:
            <input
              type="text"
              value={this.state.title}
              onChange={(e) => this.updateItem(e, 'title')}
              />
          </label>
          <label>Body:
            <input
              type="text"
              value={this.state.body}
              onChange={(e) => this.updateItem(e, 'body')}
              />
          </label>
    
          <button>Add Todo</button>
        </form>
        {
          this.props.errors.map((error,i) => {
            return(
              <li key={i}>{error}</li>
            )
          })
        }
      </div>
     
    );
  }
}
 
export default TodoForm;