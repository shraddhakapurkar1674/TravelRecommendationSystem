<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Activity - Admin Dashboard</title>
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="css/manageActivity.css">
</head>
<body>

<div class="app-container">
    <!-- Existing Shared Sidebar Component -->
    <jsp:include page="sidebar.jsp" />

    <!-- Main Dashboard Content -->
    <div class="main-content">
        <div class="card-container">
            
            <div class="header-section">
                <h2>Manage Activities</h2>
                <button class="btn-primary-custom" onclick="openAddModal()">
                    <i class="fa-solid fa-plus"></i> Add Activity
                </button>
            </div>

            <div class="search-wrapper">
                <input type="text" id="searchInput" class="search-input" placeholder="Search by activity name, category, destination..." onkeyup="filterTable()">
            </div>

            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Activity Name</th>
                            <th>Destination</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Duration</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="activityTableBody">
                        <!-- Dynamic Records Rendered via JavaScript -->
                    </tbody>
                </table>
            </div>

            <!-- Dynamic Pagination Container -->
            <div class="pagination-container" id="paginationControls"></div>

        </div>
    </div>
</div>

<!-- Add / Edit Activity Modal -->
<div class="modal-overlay" id="activityModal">
    <div class="modal-content-custom">
        <h3 id="modalTitle" style="margin-bottom: 20px; color: #1b2559;">Add Activity</h3>
        
        <form id="activityForm" onsubmit="saveActivity(event)">
            <input type="hidden" id="activityId">

            <div class="form-group">
                <label>Destination <span style="color:red;">*</span></label>
                <select id="destinationId" class="form-control-custom" required>
                    <option value="" name="destinationId">-- Select Destination --</option>
                    <!-- Loaded dynamically from server -->
                </select>
            </div>

            <div style="display: flex; gap: 12px;">
                <div class="form-group" style="flex: 1;">
                    <label>Activity Name <span style="color:red;">*</span></label>
                    <input type="text" id="activityName" class="form-control-custom" placeholder="e.g. Trekking" required>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>Category <span style="color:red;">*</span></label>
                    <select id="category" class="form-control-custom" required>
                        <option value="">-- Select Category --</option>
                        <option value="Adventure">Adventure</option>
                        <option value="Nature">Nature</option>
                        <option value="Family">Family</option>
                        <option value="Romantic">Romantic</option>
                        <option value="Historical">Historical</option>
                        <option value="Religious">Religious</option>
                        <option value="Shopping">Shopping</option>
                        <option value="Entertainment">Entertainment</option>
                        <option value="Water Sports">Water Sports</option>
                    </select>
                </div>
            </div>

            <div style="display: flex; gap: 12px;">
                <div class="form-group" style="flex: 1;">
                    <label>Price (₹) <span style="color:red;">*</span></label>
                    <input type="number" step="0.01" min="0" id="price" class="form-control-custom" placeholder="0.00" required>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>Duration <span style="color:red;">*</span></label>
                    <input type="text" id="duration" class="form-control-custom" placeholder="e.g. 2 Hours" required>
                </div>
            </div>

            <div class="form-group">
                <label>Description</label>
                <textarea id="description" class="form-control-custom" rows="3" placeholder="Brief description of the activity..."></textarea>
            </div>

            <div style="display: flex; gap: 12px;">
                <div class="form-group" style="flex: 1;">
                    <label>Select Activity Image</label>
                    <input type="file" id="imageFile" class="form-control-custom" accept="image/*" onchange="handleFileSelect(event)">
                    <input type="hidden" id="image">
                    <small id="existingImageName" style="color: #707ebe; display: block; margin-top: 4px;"></small>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>Status <span style="color:red;">*</span></label>
                    <select id="status" class="form-control-custom" required>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
            </div>

            <div class="modal-footer-btns">
                <button type="button" class="btn-cancel" onclick="closeModal()">Cancel</button>
                <button type="submit" class="btn-primary-custom">Save Activity</button>
            </div>
        </form>
    </div>
</div>

<!-- View Activity Detail Popup Modal -->
<div class="modal-overlay" id="viewActivityModal">
    <div class="modal-content-custom modal-view-card">
        <div class="modal-header-view">
            <h3 style="color: #1b2559;">Activity Details</h3>
            <button class="btn-close-icon" onclick="closeViewModal()"><i class="fa-solid fa-xmark"></i></button>
        </div>
        
        <div id="viewActivityDetails" class="view-popup-body">
            <!-- Dynamic view content injected here -->
        </div>

        <div class="modal-footer-btns" style="margin-top:20px;">
            <button type="button" class="btn-primary-custom" onclick="closeViewModal()">Close</button>
        </div>
    </div>
</div>

<script src="js/manageActivity.js"></script>
</body>
</html>