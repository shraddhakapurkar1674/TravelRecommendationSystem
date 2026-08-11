console.log(email);
console.log(password);
function login() {

    console.log("Login button clicked");

    let email = document.getElementById("email").value;
    let password = document.getElementById("password").value;

    if (email == "" || password == "") {
        alert("Please enter Email and Password");
        return;
    }
	alert("Fetch Called");
    fetch("http://localhost:8091/admin/login", {

        method: "POST",

        headers: {
            "Content-Type": "application/json"
        },

        body: JSON.stringify({
            email: email,
            password: password
        })

    })

    .then(response => {

        if (!response.ok) {
            throw new Error("HTTP Error : " + response.status);
        }

        return response.json();

    })

    .then(data => {

        console.log(data);

        if (data != null && data.aid > 0) {

            alert("Login Successful");

            localStorage.setItem("admin", JSON.stringify(data));

            window.location.href = "admindashboard.jsp";

        } else {

            alert("Invalid Email or Password");

        }

    })

    .catch(error => {

        console.log(error);

        alert("Unable to connect to Spring Boot Server");

    });

}