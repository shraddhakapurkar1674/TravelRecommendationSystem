function saveDestination(){

let destinationName=document.getElementById("destinationName").value;

let state=document.getElementById("state").value;

let country=document.getElementById("country").value;

let category=document.getElementById("category").value;

let budget=document.getElementById("budget").value;

let bestSeason=document.getElementById("bestSeason").value;

let description=document.getElementById("description").value;

let status=document.getElementById("status").value;

let image="";

let file=document.getElementById("image");

if(file.files.length>0){

image=file.files[0].name;

}

fetch("http://localhost:8091/destination/add",{

method:"POST",

headers:{

"Content-Type":"application/json"

},

body:JSON.stringify({

destinationName:destinationName,

state:state,

country:country,

category:category,

budget:budget,

bestSeason:bestSeason,

description:description,

image:image,

status:status

})

})

.then(res=>res.text())

.then(data=>{

alert(data);

window.location="manageDestination.jsp";

})

.catch(error=>{

console.log(error);

alert("Unable to connect server");

});

}