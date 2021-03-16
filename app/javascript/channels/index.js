// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context(".", true, /_channel\.js$/);
channels.keys().forEach(channels);

window.changeLanguage = function(event, algorithm_id) {
  return fetch(
    `http://localhost:3000/algorithms/${algorithm_id}?language=${event.value}`,
    {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      }
    }
  )
    .then(resp => resp.json())
    .then(obj => {
      debugger;
      document
        .getElementById("examples")
        .append(
          "<%= j render(:partial => 'algorithms/example'), :locals => { :examples => obj } %>"
        );
    });
  // .append("<%= j render(:partial => 'comments/foobar'), :locals => { :examples => @comment } %>")
};
