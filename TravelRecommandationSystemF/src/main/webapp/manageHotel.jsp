<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Hotels - Admin</title>
    <!-- Google Fonts & Font Awesome -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #f1f5f9;
            display: flex;
            min-height: 100vh;
        }

        /* Dashboard Container Layout */
        .page-container {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }

        /* Sidebar Wrapper Fix */
        .sidebar-wrapper {
            width: 260px;
            flex-shrink: 0;
        }

        /* Main Content Layout */
        .main-wrapper {
            flex: 1;
            padding: 30px;
            background-color: #f8fafc;
            overflow-y: auto;
        }

        /* Content Card */
        .card-container {
            background: #ffffff;
            border-radius: 16px;
            padding: 28px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }

        /* Header Section */
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .header-section h2 {
            font-size: 24px;
            font-weight: 700;
            color: #0f172a;
        }

        .btn-add {
            background: #2563eb;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 10px;
            border: none;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
        }

        .btn-add:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        /* Table Styling */
        .table-responsive {
            width: 100%;
            overflow-x: auto;
            border-radius: 12px;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 10px;
        }

        th {
            background-color: #f8fafc;
            color: #475569;
            font-weight: 600;
            font-size: 14px;
            padding: 16px;
            text-align: left;
            border-bottom: 2px solid #f1f5f9;
        }

        td {
            padding: 16px;
            color: #334155;
            font-size: 14px;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
        }

        tr:last-child td {
            border-bottom: none;
        }

        /* Action Buttons */
        .action-btns {
            display: flex;
            gap: 8px;
        }

        .btn-action {
            border: none;
            width: 34px;
            height: 34px;
            border-radius: 8px;
            cursor: pointer;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            transition: 0.2s;
        }

        .btn-view { background: #0284c7; }
        .btn-edit { background: #f59e0b; }
        .btn-delete { background: #ef4444; }

        .btn-action:hover { opacity: 0.85; transform: scale(1.05); }

        /* Pagination Section */
        .pagination-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 25px;
            padding-top: 15px;
            border-top: 1px solid #f1f5f9;
        }

        .page-info {
            color: #64748b;
            font-size: 14px;
            font-weight: 500;
        }

        .pagination-btns {
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .btn-page {
            background: #f1f5f9;
            color: #334155;
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            font-weight: 500;
            font-size: 13px;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn-page:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .btn-page:not(:disabled):hover {
            background: #e2e8f0;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(4px);
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .modal-content {
            background: #ffffff;
            padding: 30px;
            border-radius: 16px;
            width: 520px;
            max-width: 90%;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .modal-content h3 {
            font-size: 20px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            font-size: 13px;
            color: #475569;
        }

        .form-group input, 
        .form-group select, 
        .form-group textarea {
            width: 100%;
            padding: 10px 14px;
            border: 1.5px solid #e2e8f0;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: 0.2s;
        }

        .form-group input:focus, 
        .form-group select:focus, 
        .form-group textarea:focus {
            border-color: #2563eb;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 25px;
        }

        .btn-cancel {
            background: #e2e8f0;
            color: #475569;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-save {
            background: #2563eb;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="page-container">
    
    <!-- 1. Sidebar Section -->
    <div class="sidebar-wrapper">
        <jsp:include page="sidebar.jsp" />
    </div>

    <!-- 2. Main Content Area -->
    <div class="main-wrapper">
        <div class="card-container">
            
            <div class="header-section">
                <h2>Manage Hotels</h2>
                <button class="btn-add" onclick="openAddModal()">
                    <i class="fa-solid fa-plus"></i> Add Hotel
                </button>
            </div>

            <!-- Table -->
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Hotel Name</th>
                            <th>Destination</th>
                            <th>Location</th>
                            <th>Rating</th>
                            <th>Price/Night</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="hotelsTableBody">
                        <!-- Dynamic Records Load Here -->
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination-container">
                <span id="pageInfo" class="page-info">Showing 0 of 0 entries</span>
                <div class="pagination-btns">
                    <button id="prevBtn" onclick="prevPage()" class="btn-page" disabled>Previous</button>
                    <div id="pageNumbers" style="display: flex; gap: 5px;"></div>
                    <button id="nextBtn" onclick="nextPage()" class="btn-page">Next</button>
                </div>
            </div>

        </div>
    </div>

</div>

<!-- Add / Edit Modal -->
<div id="hotelModal" class="modal">
    <div class="modal-content">
        <h3 id="modalTitle">Add Hotel Details</h3>
        <form id="addHotelForm" onsubmit="saveHotel(event)">
            <input type="hidden" id="hotelId">
            <input type="hidden" id="existingImage">

            <div class="form-group">
                <label>Select Destination</label>
                <select id="destinationSelect" required>
                    <!-- Populated dynamically via JS -->
                </select>
            </div>
            <div class="form-group">
                <label>Hotel Name</label>
                <input type="text" id="hotelName" placeholder="e.g. Grand Palace Resort" required>
            </div>
            <div class="form-group">
                <label>Location</label>
                <input type="text" id="location" placeholder="e.g. Mall Road, Manali" required>
            </div>
            <div class="form-group">
                <label>Rating (1.0 - 5.0)</label>
                <input type="number" step="0.1" id="rating" min="1" max="5" placeholder="e.g. 4.5">
            </div>
            <div class="form-group">
                <label>Price Per Night ($)</label>
                <input type="number" step="0.01" id="pricePerNight" placeholder="e.g. 120.00" required>
            </div>
            <div class="form-group">
                <label>Contact Number</label>
                <input type="text" id="contactNumber" placeholder="+91 9876543210">
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea id="description" rows="3" placeholder="Enter hotel details..."></textarea>
            </div>
            <div class="form-group">
                <label>Hotel Image <span id="imageNote" style="font-size: 11px; color: #64748b;"></span></label>
                <input type="file" id="imageFile" accept="image/*">
            </div>

            <div class="modal-footer">
                <button type="button" class="btn-cancel" onclick="closeModal('hotelModal')">Cancel</button>
                <button type="submit" class="btn-save">Save Hotel</button>
            </div>
        </form>
    </div>
</div>

<!-- View Details Modal -->
<div id="viewModal" class="modal">
    <div class="modal-content">
        <h3>Hotel Details</h3>
        <div id="viewDetailsContent"></div>
        <div class="modal-footer">
            <button type="button" class="btn-cancel" onclick="closeModal('viewModal')">Close</button>
        </div>
    </div>
</div>

<script src="js/manage-hotel.js"></script>
</body>
</html>