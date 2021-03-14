// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context(".", true, /_channel\.js$/);
channels.keys().forEach(channels);

window.changeLanguage = function(event, algorithm_id) {
  return fetch(
    `http://localhost:3000/algorithms/${algorithm_id}?language=${event.value}`
  );
};
