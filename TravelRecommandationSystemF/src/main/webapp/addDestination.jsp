<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Destination</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

body{
    background:#f4f7fc;
}

.card{
    border:none;
    border-radius:12px;
    box-shadow:0px 2px 10px rgba(0,0,0,.2);
}

.card-header{
    background:#0B1F3A;
    color:white;
    font-size:24px;
    font-weight:bold;
}

label{
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container mt-5">

<div class="card">

<div class="card-header">

<i class="fa-solid fa-location-dot"></i>

Add Destination

</div>

<div class="card-body">

<form>

<div class="row">

<div class="col-md-6 mb-3">

<label>Destination Name</label>

<input
type="text"
id="destinationName"
class="form-control">

</div>

<div class="col-md-6 mb-3">

<label>State</label>

<input
type="text"
id="state"
class="form-control">

</div>

</div>


<div class="row">

<div class="col-md-6 mb-3">

<label>Country</label>

<input
type="text"
id="country"
class="form-control">

</div>

<div class="col-md-6 mb-3">

<label>Category</label>

<select
id="category"
class="form-select">

<option value="">Select Category</option>

<option>Beach</option>

<option>Hill Station</option>

<option>Historical</option>

<option>Adventure</option>

<option>Nature</option>

<option>Religious</option>

</select>

</div>

</div>


<div class="row">

<div class="col-md-6 mb-3">

<label>Budget</label>

<input
type="number"
id="budget"
class="form-control">

</div>

<div class="col-md-6 mb-3">

<label>Best Season</label>

<select
id="bestSeason"
class="form-select">

<option>Summer</option>

<option>Winter</option>

<option>Monsoon</option>

<option>All Season</option>

</select>

</div>

</div>


<div class="mb-3">

<label>Description</label>

<textarea
id="description"
rows="4"
class="form-control"></textarea>

</div>


<div class="row">

<div class="col-md-6 mb-3">

<label>Image</label>

<input
type="file"
id="image"
class="form-control">

</div>

<div class="col-md-6 mb-3">

<label>Status</label>

<select
id="status"
class="form-select">

<option>Active</option>

<option>Inactive</option>

</select>

</div>

</div>

<div class="text-center">

<button
type="button"
class="btn btn-success"
onclick="saveDestination()">

<i class="fa-solid fa-floppy-disk"></i>

Save

</button>

<button
type="reset"
class="btn btn-warning">

Reset

</button>

<a
href="manageDestination.jsp"
class="btn btn-danger">

Cancel

</a>

</div>

</form>

</div>

</div>

</div>

<script src="js/addDestination.js"></script>

</body>
</html>