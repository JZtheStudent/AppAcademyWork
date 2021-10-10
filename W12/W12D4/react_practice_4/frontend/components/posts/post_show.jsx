import React from 'react';
import { Link } from 'react-router-dom';

/*
Export a `PostShow` presentational component that renders a post's information
(title and body). This component should receive the `post` from the store as
props via its container and fetch it once it has successfully mounted to the
DOM. Additionally, this component should contain a link back to the `PostIndex`.
*/

class PostShow extends React.Component {
  componentDidMount() {
    this.props.fetchPost(this.props.match.params.postId)
  }

  render() { 
    const {post} = this.props;
    return (  
      <div>
        <h3>{post.title}</h3>
        <p>{post.body}</p>
        <Link to="/">Back to Index</Link>
      </div>
    );
  }
}
 
export default PostShow;