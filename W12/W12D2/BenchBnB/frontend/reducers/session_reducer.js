import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from "../actions/session_actions";
import entitiesReducer from "./entities_reducer";

const _nullsession = {
  id: null
};

const sessionReducer = (state=_nullsession, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, {id: action.currentUser.id});
    case LOGOUT_CURRENT_USER:
      return _nullsession;
    default:
      return state;
  }
};

export default sessionReducer;