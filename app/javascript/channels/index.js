// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context(".", true, /_channel\.js$/);
channels.keys().forEach(channels);

window.infoHover = function(event) {
  debugger;
};
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
      sendObjectsToContainer(obj);
    });
};

const sendObjectsToContainer = objects => {
  objects.forEach(obj => {
    document.getElementById("exampleSelect").innerHTML += `
        <li>
          <code class="max-w-sm overflow-scroll m-2 py-3">
            <pre class="border border-black border-opacity-30 p-3">${obj.example}</pre>
          </code>
        </li>`;
  });
};
