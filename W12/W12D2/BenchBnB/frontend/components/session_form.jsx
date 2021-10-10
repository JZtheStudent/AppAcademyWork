import React from 'react';
import {Link} from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {  
      username: "",
      password: "",
      email: ""
    }

    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateItem = this.updateItem.bind(this);
  }
  
  updateItem(e, item) {
    this.setState({[item]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  } 

  render() { 
    const {errors, formType} = this.props;
    const headerText = (formType === 'login') ? 'Log in'  : 'Sign Up';
    const oppositeText = (formType === 'login') ? 'Sign Up' : 'Log in';
    const oppositeLink = (formType === 'login') ? '/signup' : '/login';
    
    const emailInput = (formType === 'signup') ?
        <label>Email:
          <input 
          type="text"
          value={this.state.email}
          onChange={(e) => this.updateItem(e, 'email')}/>
        </label>
        :
        <p></p>
    
    return (  
      <div>
          <h1>{headerText}</h1>
          <Link to={oppositeLink}>{oppositeText}</Link>
          <form>
            <label>Username:
              <input 
                type="text"
                value={this.state.username}
                onChange={(e) => this.updateItem(e, 'username')}/>
            </label>
            {emailInput}
            <label>Password:
              <input type="password"
              value={this.state.password}
              onChange={(e) => this.updateItem(e, 'password')} />
            </label>

            <button onClick={this.handleSubmit}>{headerText}</button>
          </form>
          <ul>
            {
              Object.values(errors).map((error, i) => (
                <li key={i}>{error}</li>
              ))
            }
          </ul>
      </div>
    );
  }
}
 
export default SessionForm;



