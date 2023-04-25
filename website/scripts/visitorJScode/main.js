// main.js
const counterElement = document.getElementById('visitCount');

// Send a POST request to the API endpoint
fetch('https://7hn5blxzxg.execute-api.us-east-1.amazonaws.com/default/IncrementVisitorCounter', {
  method: 'POST',
  mode: 'cors'
})
.then(response => response.json())
.then(data => {
  // Display the visitor count in the counter element
  counterElement.textContent = data.body;
})
.catch(error => console.error(error));