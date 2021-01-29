import React from "react";
import PropTypes from "prop-types";
class Algorithm extends React.Component {
  render() {
    return (
      <div className="container">
        <h1>{this.props.algorithm.name}</h1>
        <p>
          <b>Worst case:</b> {this.props.algorithm.worst_case}
        </p>
        <p>
          <b>Best case:</b> {this.props.algorithm.best_case}
        </p>
        {this.props.examples.map(eg => {
          <div className="text-left">
            <p>
              <b>Language:</b> {eg.language}
            </p>
            <div className="p-4 d-inline-block position-absolute bg-light">
              <code>
                <pre>{eg.example}</pre>
              </code>
            </div>
          </div>;
        })}
      </div>
    );
  }
}

Algorithm.propTypes = {
  algorithm: PropTypes.object
};
export default Algorithm;
