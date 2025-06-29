// contact_script.js
const form = document.getElementById('contact-form');
const submitBtn = document.querySelector('.submit-btn');

// Add an event listener to the submit button
submitBtn.addEventListener('click', (e) => {
    // Prevent the default form submission behavior
    e.preventDefault();

    // Get the form data
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const message = document.getElementById('message').value;

    // Create an object with the form data
    const formData = {
        name,
        email,
        message
    };

    // Post the form data to the API endpoint
    fetch('/api/contact', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
    .then((response) => response.json())
    .then((data) => console.log(data))
    .catch((error) => console.error(error));
});