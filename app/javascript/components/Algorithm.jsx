import React from "react";
import PropTypes from "prop-types";
class Algorithm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      language: "Ruby"
    };
  }
  languageOptions = e => {
    this.setState({
      language: e.target.value
    });
  };
  render() {
    let examples = [...this.props.examples];
    let unique_languages = [...new Set(examples.map(eg => eg.language))];
    return (
      <div className="container">
        <h1>{this.props.algorithm.name}</h1>
        <p>
          <b>Worst case:</b> {this.props.algorithm.worst_case}
        </p>
        <p>
          <b>Best case:</b> {this.props.algorithm.best_case}
        </p>
        <hr></hr>
        <b className="pr-3">Language:</b>
        <select onChange={e => this.languageOptions(e)}>
          {unique_languages.map(lang => {
            return <option>{lang}</option>;
          })}
        </select>
        <div className="row">
          {examples
            .filter(example => example.language == this.state.language)
            .map((eg, index) => {
              return (
                <div className="col-sm p-3">
                  <span className="d-inline-flex m-2 p-1">
                    <p className="pt-4">{++index}.</p>
                    <div className="d-inline-block m-4 p-3 position-absolute bg-light border border-black">
                      <code>
                        <pre>{eg.example}</pre>
                      </code>
                    </div>
                  </span>
                  <br></br>
                </div>
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
