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
        <hr></hr>
        <b className="pr-3 mb-2">Language:</b>
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
        <p>
          <b>Worst case:</b> {this.props.algorithm.worst_case}
        </p>
        <p>
          <b>Best case:</b> {this.props.algorithm.best_case}
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
                      className="submit-btn ml-4 mt-4"
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
