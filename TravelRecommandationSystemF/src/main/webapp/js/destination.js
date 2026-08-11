window.onload = function () {

    getAllDestination();

}

// ================= ADD DESTINATION =================

function addDestination() {

    let destination = {

        name: document.getElementById("name").value,
        location: document.getElementById("location").value,
        state: document.getElementById("state").value,
        category: document.getElementById("category").value,
        budget: document.getElementById("budget").value,
        bestTime: document.getElementById("bestTime").value,
        description: document.getElementById("description").value,
        image: document.getElementById("image").value

    };

    fetch("http://localhost:8091/destination/add", {

        method: "POST",

        headers: {
            "Content-Type": "application/json"
        },

        body: JSON.stringify(destination)

    })

    .then(res => res.text())

    .then(msg => {

        alert(msg);

        document.getElementById("name").value = "";
        document.getElementById("location").value = "";
        document.getElementById("state").value = "";
        document.getElementById("category").value = "";
        document.getElementById("budget").value = "";
        document.getElementById("bestTime").value = "";
        document.getElementById("description").value = "";
        document.getElementById("image").value = "";

        getAllDestination();

    })

    .catch(err => console.log(err));

}


// ================= VIEW ALL DESTINATIONS =================

function getAllDestination() {

    fetch("http://localhost:8091/destination/all")

    .then(res => res.json())

    .then(data => {

        let table = "";

        data.forEach(d => {

            table += "<tr>";

            table += "<td>"+d.did+"</td>";
            table += "<td>"+d.name+"</td>";
            table += "<td>"+d.location+"</td>";
            table += "<td>"+d.state+"</td>";
            table += "<td>"+d.category+"</td>";
            table += "<td>"+d.budget+"</td>";
            table += "<td>"+d.bestTime+"</td>";
            table += "<td>"+d.image+"</td>";

            table += "<td><button class='btn btn-warning btn-sm'>Edit</button></td>";

            table += "<td><button class='btn btn-danger btn-sm'>Delete</button></td>";

            table += "</tr>";

        });

        document.getElementById("destinationTable").innerHTML = table;

    })

    .catch(err => console.log(err));

}