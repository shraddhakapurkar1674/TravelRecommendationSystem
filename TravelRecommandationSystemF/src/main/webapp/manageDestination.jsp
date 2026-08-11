<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TripWise Admin - Manage Destinations</title>
    
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- CSS Links -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manage-destination.css">

    <!-- JS Links -->
    <script src="${pageContext.request.contextPath}/js/sidebar.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/manage-destination.js" defer></script>
</head>
<body>

    <div class="app-container">
        <!-- Sidebar Inclusion -->
        <jsp:include page="sidebar.jsp" />

        <!-- Main Content Area -->
        <main class="main-content">
            <div class="page-header">
                <header class="top-bar">
                    <h1>Manage Destinations</h1>
                </header>
                <button class="btn-add" onclick="openAddModal()">
                    <i class="fa-solid fa-plus"></i> Add New Destination
                </button>
            </div>

            <!-- Destinations Dynamic Table Box -->
            <section class="card-box">
                <h2>All Destinations</h2>
                <div class="table-responsive">
                    <table class="custom-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Destination</th>
                                <th>State</th>
                                <th>Country</th>
                                <th>Category</th>
                                <th>Budget ($)</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="destinationsTableBody">
                            <tr>
                                <td colspan="7" style="text-align: center; color: #64748b; padding: 20px;">
                                    Loading destinations...
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    
                   
<div class="pagination-container" style="display: flex; justify-content: space-between; align-items: center; margin-top: 15px; padding: 10px 0;">
    <span id="pageInfo" style="color: #64748b; font-size: 14px;">Showing 0 of 0 entries</span>
    
    <div class="pagination-buttons" style="display: flex; gap: 8px;">
        <button id="prevBtn" onclick="prevPage()" class="btn-submit" style="background: #e2e8f0; color: #1e293b; padding: 6px 14px;" disabled>
            <i class="fa-solid fa-chevron-left"></i> Previous
        </button>
        <div id="pageNumbers" style="display: flex; gap: 5px;"></div>
        <button id="nextBtn" onclick="nextPage()" class="btn-submit" style="background: #e2e8f0; color: #1e293b; padding: 6px 14px;">
            Next <i class="fa-solid fa-chevron-right"></i>
        </button>
    </div>
</div>
                </div>
            </section>
        </main>
    </div>

    <!-- POPUP MODAL: Add / Edit Destination Form -->
    <div class="modal-overlay" id="destinationModal">
        <div class="modal-card">
            <div class="modal-header">
                <h2 id="modalTitle">Add Destination Details</h2>
                <button class="close-btn" onclick="closeModal('destinationModal')"><i class="fa-solid fa-xmark"></i></button>
            </div>
            
            <form id="addDestinationForm" onsubmit="saveDestination(event)" enctype="multipart/form-data">
                <!-- ID आणि जुन्या इमेजचा पथ साठवण्यासाठी Hidden Inputs -->
                <input type="hidden" id="destinationId" name="id">
                <input type="hidden" id="existingImage" name="existingImage">

                <div class="form-grid">
                    <div class="form-group">
                        <label>Destination Name</label>
                        <input type="text" id="destinationName" required placeholder="e.g. New York">
                    </div>

                    <div class="form-group">
                        <label>State</label>
                        <input type="text" id="state" required placeholder="e.g. New York State">
                    </div>

                    <div class="form-group">
                        <label>Country</label>
                        <input type="text" id="country" required placeholder="e.g. USA">
                    </div>

                    <div class="form-group">
                        <label>Category</label>
                        <select id="category" required>
                            <option value="City">City</option>
                            <option value="Hill Station">Hill Station</option>
                            <option value="Beach">Beach</option>
                            <option value="Historical">Historical</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Budget ($)</label>
                        <input type="number" step="0.01" id="budget" placeholder="1600.00">
                    </div>

                    <div class="form-group">
                        <label>Best Season</label>
                        <input type="text" id="bestSeason" placeholder="e.g. Winter">
                    </div>

                    <!-- File Input for Local Image Selection -->
                    <div class="form-group full-width">
                        <label>Select Image File <small id="imageNote" style="color:#64748b;"></small></label>
                        <input type="file" id="imageFile" accept="image/*">
                    </div>

                    <div class="form-group full-width">
                        <label>Description</label>
                        <textarea id="description" rows="2" placeholder="Brief description..."></textarea>
                    </div>
                </div>

                <div style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 15px;">
                    <button type="button" class="btn-submit" style="background: #94a3b8;" onclick="closeModal('destinationModal')">Cancel</button>
                    <button type="submit" class="btn-submit" id="submitBtn">Save Destination</button>
                </div>
            </form>
        </div>
    </div>

    <!-- POPUP MODAL: View Destination Details -->
    <div class="modal-overlay" id="viewModal">
        <div class="modal-card">
            <div class="modal-header">
                <h2>Destination Details</h2>
                <button class="close-btn" onclick="closeModal('viewModal')"><i class="fa-solid fa-xmark"></i></button>
            </div>
            <div id="viewDetailsContent" style="display: flex; flex-direction: column; gap: 12px;"></div>
            <div style="display: flex; justify-content: flex-end; margin-top: 15px;">
                <button type="button" class="btn-submit" style="background: #94a3b8;" onclick="closeModal('viewModal')">Close</button>
            </div>
        </div>
    </div>

</body>
</html>