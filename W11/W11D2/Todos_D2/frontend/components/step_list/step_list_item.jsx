import React from 'react';

class StepListItem extends React.Component {
    constructor(props) {
        super(props);
    }

    toggleStep = (e) => {
        const toggledStep = Object.assign({}, this.props.step, {done: !this.props.step.done})
        this.props.receiveStep(toggledStep);
    }

    render() { 
        return (
            <div>
                <li>{this.props.step.title}</li>
                <li>{this.props.step.body}</li>
                <button onClick={this.toggleStep}>{this.props.step.done ? "done" : "undo"}</button>
                <button onClick={this.props.removeStep(this.props.step)}>DELETE</button>
            </div>
        );
    }
}
 
export default StepListItem;