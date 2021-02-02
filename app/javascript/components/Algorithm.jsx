import React from "react";
import PropTypes from "prop-types";
class Algorithm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      language: ""
    };
  }
  languageOptions = e => {
    this.setState({
      language: e.target.value
    });
  };
  componentDidUpdate = () => {
    debugger;
  };
  deleteExample = (language, id) => {
    fetch(`http://localhost:3000/examples/${id}`, {
      method: "DELETE"
    });
    this.setState({
      language: language
    });
  };
  render() {
    let examples = [...this.props.examples];
    let unique_languages = [...new Set(examples.map(eg => eg.language))];
    return (
      <div className="col-lg">
        <h1>{this.props.algorithm.name}</h1>
        <p>
          <b>Worst case:</b> {this.props.algorithm.worst_case}
        </p>
        <p>
          <b>Best case:</b> {this.props.algorithm.best_case}
        </p>
        <hr></hr>
        <b className="pr-3 mb-2">Language:</b>
        <select onChange={e => this.languageOptions(e)}>
          <option disabled selected value>
            {" "}
            --{" "}
          </option>
          {unique_languages.map(lang => {
            return <option>{lang}</option>;
          })}
        </select>
        <div className="code-min d-inline-block mx-auto scroll-bar">
          {examples
            .filter(example => example.language == this.state.language)
            .map((eg, index) => {
              return (
                <span>
                  <p className="pt-4">{++index}.</p>
                  <div className="m-4 p-3 bg-light border border-black">
                    <code>
                      <pre>{eg.example}</pre>
                    </code>
                  </div>
                  <button
                    className="ml-4 btn-sm btn btn-outline-secondary"
                    onClick={() => this.deleteExample(eg.language, eg.id)}
                  >{`Delete ${eg.language} Example ${index}`}</button>
                </span>
              );
            })}
        </div>
      </div>
    );
  }
}

Algorithm.propTypes = {
  algorithm: PropTypes.object
};
export default Algorithm;
