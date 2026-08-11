<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Transport - Admin</title>
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="css/manageTransport.css">
</head>
<body>

<div class="app-container">
    <jsp:include page="sidebar.jsp" />

    <div class="main-content">
        <div class="card-container">
            
            <div class="header-section">
                <h2>Manage Transport</h2>
                <button class="btn-primary-custom" onclick="openAddModal()">
                    <i class="fa-solid fa-plus"></i> Add Transport
                </button>
            </div>

            <div class="search-wrapper">
                <input type="text" id="searchInput" class="search-input" placeholder="Search by destination or provider..." onkeyup="filterTable()">
            </div>

            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Destination</th>
                            <th>Type</th>
                            <th>Provider</th>
                            <th>Pricing</th>
                            <th>Facilities</th>
                            <th>Charge</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="transportTableBody">
                        <!-- Dynamic Content Loaded via API -->
                    </tbody>
                </table>
            </div>

            <!-- Pagination Controls -->
            <div class="pagination-container" id="paginationControls">
                <!-- Pagination buttons generated dynamically -->
            </div>

        </div>
    </div>
</div>

<!-- Modal Dialog -->
<div class="modal-overlay" id="transportModal">
    <div class="modal-content-custom">
        <h3 id="modalTitle" style="margin-bottom: 20px; color: #1b2559;">Add Transport</h3>
        
        <form id="transportForm" onsubmit="saveTransport(event)">
            <input type="hidden" id="transportId">

            <div class="form-group">
                <label>Destination</label>
                <input type="text" id="destination" class="form-control-custom" placeholder="e.g. Goa" required>
            </div>

            <div style="display: flex; gap: 12px;">
                <div class="form-group" style="flex: 1;">
                    <label>Transport Type</label>
                    <select id="transportType" class="form-control-custom" onchange="handleTypeChange()" required>
                        <option value="">Select</option>
                        <option value="Bus">Bus</option>
                        <option value="Cab">Cab</option>
                        <option value="Train">Train</option>
                        <option value="Air">Air</option>
                    </select>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>Provider Name</label>
                    <input type="text" id="transportProvider" class="form-control-custom" placeholder="e.g. IndiGo, XYZ" required>
                </div>
            </div>

            <div style="display: flex; gap: 12px;">
                <div class="form-group" style="flex: 1;">
                    <label>Pricing Type</label>
                    <select id="pricingType" class="form-control-custom" readonly style="pointer-events: none; background: #f8fafc;">
                        <option value="PER_KM">PER_KM</option>
                        <option value="PER_TICKET">PER_TICKET</option>
                    </select>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label id="pricingValueLabel">Pricing Value (₹)</label>
                    <input type="number" step="0.01" id="pricingValue" class="form-control-custom" required>
                </div>
            </div>

            <div style="display: flex; gap: 12px;">
                <div class="form-group" style="flex: 1;">
                    <label>Facilities</label>
                    <input type="text" id="facilities" class="form-control-custom" placeholder="e.g. AC, Wi-Fi">
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>Facility Charge (₹)</label>
                    <input type="number" step="0.01" id="facilityCharge" class="form-control-custom" required>
                </div>
            </div>

            <div class="modal-footer-btns">
                <button type="button" class="btn-cancel" onclick="closeModal()">Cancel</button>
                <button type="submit" class="btn-primary-custom">Save Transport</button>
            </div>
        </form>
    </div>
</div>

<script src="js/manageTransport.js"></script>
</body>
</html>