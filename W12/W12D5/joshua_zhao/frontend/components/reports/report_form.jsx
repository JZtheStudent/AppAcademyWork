import React from 'react';

/*
Export a `ReportForm` presentational component that creates a form to either
create or edit a report (it will be used by two separate containers). The form
should indicate whether it is a create or edit form based on the `formType`
prop. The form should initialize state to the `report` passed in from props. Use
controlled inputs and trigger the `action` passed in from the container upon
submission. Use a text input for the understanding field and a textarea for the
improvement field.
*/

class ReportForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.report;

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.action(this.state);
  }
  
  change(item) {
    return e => {this.setState({ [item]: e.currentTarget.value })}
  }
  
  render() { 
    return (  
      <div>
        <h3>{this.props.formType}</h3>
        <form onSubmit={this.handleSubmit}>
          <label>Understanding:
            <input
              type='text'
              value={this.state.understanding}
              onChange={this.change('understanding')}/>
          </label>
          <label>Improvement:
            <textarea 
              value={this.state.improvement}
              onChange={this.change('improvement')}/>
          </label>
          <button type="submit">{this.props.formType}</button>
        </form>
      </div>
    );
  }
}
 
export default ReportForm;