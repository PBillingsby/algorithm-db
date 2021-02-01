import React from "react";
import PropTypes from "prop-types";
class Algorithm extends React.Component {
  render() {
    const examples = [...this.props.examples];
    const unique = [...new Set(examples)].map(eg => {
      return eg.language;
    });
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
        <select>
          {unique.map(lang => {
            return <option>{lang}</option>;
          })}
        </select>
        <div className="row">
          {examples.map(eg => {
            return (
              <div className="col-sm">
                <p>
                  <b>Language:</b> {eg.language}
                </p>
                <div className="m-4 d-inline-block float-left p-3 position-absolute bg-light border border-black">
                  <code>
                    <pre>{eg.example}</pre>
                  </code>
                </div>
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
