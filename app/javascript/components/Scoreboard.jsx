import React from "react";
class Scoreboard extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      scores: ""
    };
  }
  componentDidMount() {
    fetch("http://localhost:3000/users/scoreboard")
      .then(resp => resp.json())
      .then(objects => {
        console.log(objects);
        this.setState({
          scores: objects
        });
      });
  }
  componentDidUpdate() {
    // this.state.scores.map(obj => {
    //   for (let i in obj) {
    //     console.log(Object.values(obj[i]));
    //   }
    // });
  }

  render() {
    return (
      <div className="text-center mx-auto md:p-8 p-2">
        <h1>LEADERBOARD</h1>
        <select>
          <option>All</option>
        </select>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-3 mx-auto">
          {this.state.scores &&
            this.state.scores.map(score => {
              return (
                <div className="md:p-8 p-2 bg-white">
                  <h3 className="text-indigo-500 font-semibold text-base mt-2">
                    {score.name}
                  </h3>
                  <p>Algorithms: {score.algorithms}</p>
                  <p>Articles: {score.articles}</p>
                </div>
              );
            })}
        </div>
      </div>
    );
  }
}

export default Scoreboard;
