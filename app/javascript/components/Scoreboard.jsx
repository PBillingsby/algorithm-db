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
  // componentDidUpdate() {
  //   this.state.scores.map(obj => {
  //     for (let i in obj) {
  //       console.log(Object.values(obj[i]));
  //     }
  //   });
  // }
  render() {
    return (
      <div>
        {this.state.scores &&
          this.state.scores.map(score => {
            for (let i in score) {
              console.log(Object.values(score[i]));
            }
          })}
      </div>
    );
  }
}

export default Scoreboard;
