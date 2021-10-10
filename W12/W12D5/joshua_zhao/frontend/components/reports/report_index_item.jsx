import React from 'react';
import { Link, withRouter } from 'react-router-dom';

import { formatDate } from '../../util/date_util';

/*
Export a `ReportIndexItem` presentational component that takes in a `report`
and the `deleteReport` action via props. The component should render an `li`
containing the following:

1. A link to the report's show page with text of the report's date created
2. A link to the report's edit page with text 'Edit'.
3. A button to delete the report.

Use the `formatDate` function to display `createdAt` in this component. Like
this: `formatDate(report.createdAt)`.
*/

const ReportIndexItem = (props) => {
  const { report } = props;
  return (  
    <div>
      <Link to={`/reports/${report.id}`}>{formatDate(report.createdAt)}</Link>
      <Link to={`/reports/${report.id}/edit`}>Edit</Link>
      <button onClick={() => props.deleteReport(report.id)}>Delete</button>
    </div>
  );
}
 
export default ReportIndexItem;