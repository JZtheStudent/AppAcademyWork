import {
  RECEIVE_ALL_POSTS,
  RECEIVE_POST,
  REMOVE_POST,
} from '../actions/post_actions';
import merge from 'lodash/merge';

/*
Export a `PostsReducer` that takes in the old state and appropriately handles
all post actions.
*/
const PostsReducer = (state={}, action) => {
  Object.freeze(state)

  switch (action.type) {
    case RECEIVE_ALL_POSTS:
      return Object.assign({}, state, action.posts);
    case RECEIVE_POST:
      return Object.assign({}, state, {[action.post.id]: action.post });
    case REMOVE_POST:
      let newState = Object.assign({}, state);
      delete newState[action.postId];
      return newState;
    default:
      return state;
  }

};

export default PostsReducer;