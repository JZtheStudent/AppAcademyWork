import {
  RECEIVE_REPORTS,
  RECEIVE_REPORT,
  REMOVE_REPORT,
} from '../actions/report_actions';
import merge from 'lodash/merge'

/*
Export a `ReportsReducer` that takes in the old state and appropriately handles
all report actions.
*/

const ReportsReducer = (state={}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_REPORTS:
      return Object.assign({}, state, action.reports);
    case RECEIVE_REPORT:
      return Object.assign({}, state, { [action.report.id]: action.report });
    case REMOVE_REPORT:
      let newState = Object.assign({}, state);
      delete newState[action.reportId];
      return newState;
    default:
      return state;
  }

};

export default ReportsReducer;

