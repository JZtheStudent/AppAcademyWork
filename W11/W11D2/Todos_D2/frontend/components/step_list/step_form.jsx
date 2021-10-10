import React from 'react';

class StepForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = { 
            id: new Date().getTime(),
            title: "",
            boby: "",
            done: false,
            todo_id: this.props.todo_id
        };
    }

    update(temp) {
        return e => this.setState({[temp]: e.target.value});
    }

    handleSubmit = (e) => {
        e.preventDefault();
        this.props.receiveStep(this.state);
        this.setState({
            id: new Date().getTime(),
            title: "",
            boby: "",
            done: false,
            todo_id: this.props.todo_id
        });
    }

    render() { 
        return (
            <form className="step-form" onSubmit={this.handleSubmit}>
                <label>Title:
                    <input value={this.state.title} onChange={this.update("title")} />
                </label>
                <label>Boby:
                    <input value={this.state.boby} onChange={this.update("boby")} />
                </label>
                <button>Add Step</button>
            </form>
        );
    }
}
 
export default StepForm;