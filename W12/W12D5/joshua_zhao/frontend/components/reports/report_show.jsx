import React from 'react';
import { Link } from 'react-router-dom';

import {
  formatDateTime
} from '../../util/date_util';

/*
Write a `ReportShow` presentational component that renders a report's
information (understanding, improvement, and date/time created/updated). This
component should receive the report from the store as props via its container
and fetch it once it has successfully mounted to the DOM. Only display the
`updatedAt` date/time if it is different than the `createdAt` date/time.
Additionally, include a link back to the `ReportIndex`.

Display the date and time of the `createdAt`/`updatedAt` properties like this:
`formatDateTime(this.props.report.createdAt)`
`formatDateTime(this.props.report.updatedAt)`
*/

class ReportShow extends React.Component {
  componentDidMount() {
    this.props.requestReport(this.props.report.id);
  }
  
  render() { 
    const { report } = this.props;
    return (  
      <div>
        <p>{report.understanding}</p>
        <p>{report.improvement}</p>
        {
          (report.createdAt === report.updatedAt) ?
            <h3>{formatDateTime(report.createdAt)}</h3> :
            <h3>{formatDateTime(report.updatedAt)}</h3>
        }
        <Link to="/">Back to Index</Link>
      </div>
    );
  }
}
 
export default ReportShow;