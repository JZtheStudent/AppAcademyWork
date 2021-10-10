import React from 'react';
import {Link} from 'react-router-dom';

const Greeting = ({currentUser, logout}) => {

  const display = currentUser ? (
    <div>
      <p>Hello, {currentUser.username}</p>
      <button onClick={logout}>Log Out</button>
    </div>
  ) : (
    <div>
      <Link to="/signup">Sign Up</Link>
      <Link to='/login'>Log In</Link>
    </div>
  );

  return (  
    <div>
      {display}
    </div>
  );
}
 
export default Greeting;