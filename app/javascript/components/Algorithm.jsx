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
  deleteExample = (language, example) => {
    const stateLanguage = language;
    fetch(`https://cryptic-sierra-84151.herokuapp.com/${example.id}`, {
      method: "DELETE",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      }
    }).then(
      this.setState({
        language: stateLanguage
      })
    );
  };
  render() {
    let examples = [...this.props.examples];
    let unique_languages = [...new Set(examples.map(eg => eg.language))];
    return (
      <div className="col-lg">
        <input type="hidden" name="stateLanguage" value={this.state.language} />
        <hr className="pt-4"></hr>
        <span className="inline-block">
          <p className="inline-block pr-3 py-3 text-green-700 mb-2">
            Language:
          </p>
          <select
            id="rounded selected-language"
            onChange={e => this.languageOptions(e)}
          >
            <option disabled defaultValue>
              {" "}
              --{" "}
            </option>
            {unique_languages.map(lang => {
              return <option>{lang}</option>;
            })}
          </select>
        </span>
        <p>
          <span className="text-green-700">Worst case:</span>{" "}
          {this.props.algorithm.worst_case}
        </p>
        <p>
          <span className="text-green-700">Best case:</span>{" "}
          {this.props.algorithm.best_case}
        </p>
        <div className="rounded code-min mx-auto pr-4" id="scroll-bar">
          <ol>
            {examples
              .filter(example => example.language == this.state.language)
              .map((eg, index) => {
                return (
                  <li>
                    <div className="mt-4 bg-light border border-black">
                      <pre>
                        <code>{eg.example}</code>
                      </pre>
                    </div>
                    <button
                      className="submit-btn text-red-400 mt-4"
                      onClick={() => this.deleteExample(eg.language, eg)}
                    >{`Delete Example ${index + 1}`}</button>
                  </li>
                );
              })}
          </ol>
        </div>
      </div>
    );
  }
}

Algorithm.propTypes = {
  algorithm: PropTypes.object
};
export default Algorithm;
