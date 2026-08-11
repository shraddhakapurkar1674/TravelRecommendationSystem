<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TripWise Admin Dashboard</title>

    <!-- Bootstrap 5 & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body class="dashboard-body">

<div class="dashboard-wrapper">
    <!-- Main Content -->
    
    <jsp:include page="sidebar.jsp">
        <jsp:param name="activePage" value="dashboard" />
    </jsp:include>
    <main class="main-content">

        <!-- Top Navigation Bar -->
        <header class="glass-topbar d-flex justify-content-between align-items-center mb-4">
            <div class="search-box position-relative flex-grow-1 me-4" style="max-width: 400px;">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="form-control search-input" placeholder="Search here...">
            </div>

            <div class="d-flex align-items-center gap-3">
                <div class="user-profile-badge d-flex align-items-center gap-2">
                    <div class="avatar-circle"><i class="fas fa-user"></i></div>
                    <div>
                        <div class="fw-bold lh-1" style="font-size: 0.85rem;">Admin</div>
                        <small class="text-muted" style="font-size: 0.72rem;">Super Admin</small>
                    </div>
                </div>
            </div>
        </header>

        <!-- Metric Cards -->
        <section class="row g-3 mb-4">
            <div class="col-6 col-md-4 col-xl-2">
                <div class="glass-card metric-card">
                    <div class="d-flex align-items-center gap-3">
                        <div class="icon-shape bg-purple-soft text-purple"><i class="fas fa-users"></i></div>
                        <div>
                            <span class="metric-label"> Users</span>
                            <h3 class="metric-value" id="totalUsers">0</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-4 col-xl-2">
                <div class="glass-card metric-card">
                    <div class="d-flex align-items-center gap-3">
                        <div class="icon-shape bg-indigo-soft text-indigo"><i class="fas fa-map-marker-alt"></i></div>
                        <div>
                            <span class="metric-label">Destinations</span>
                            <h3 class="metric-value" id="totalDestinations">0</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-4 col-xl-2">
                <div class="glass-card metric-card">
                    <div class="d-flex align-items-center gap-3">
                        <div class="icon-shape bg-orange-soft text-orange"><i class="fas fa-hotel"></i></div>
                        <div>
                            <span class="metric-label">Hotels</span>
                            <h3 class="metric-value" id="totalHotels">0</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-4 col-xl-2">
                <div class="glass-card metric-card">
                    <div class="d-flex align-items-center gap-3">
                        <div class="icon-shape bg-blue-soft text-blue"><i class="fas fa-bus"></i></div>
                        <div>
                            <span class="metric-label">Transport</span>
                            <h3 class="metric-value" id="totalTransport">0</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-4 col-xl-2">
                <div class="glass-card metric-card">
                    <div class="d-flex align-items-center gap-3">
                        <div class="icon-shape bg-green-soft text-green"><i class="fas fa-walking"></i></div>
                        <div>
                            <span class="metric-label">Activities</span>
                            <h3 class="metric-value" id="totalActivities">0</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6 col-md-4 col-xl-2">
                <div class="glass-card metric-card">
                    <div class="d-flex align-items-center gap-3">
                        <div class="icon-shape bg-pink-soft text-pink"><i class="fas fa-star"></i></div>
                        <div>
                            <span class="metric-label">Reviews</span>
                            <h3 class="metric-value" id="totalReviews">0</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Bookings Overview -->
        <section class="glass-card p-4 mb-4">
            <h5 class="fw-bold mb-3"><i class="far fa-calendar-check text-primary me-2"></i>Booking Overview</h5>
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="inner-metric-box d-flex align-items-center justify-content-between p-3">
                        <div>
                            <span class="text-muted small d-block">Total Bookings</span>
                            <h3 class="fw-extrabold mb-0" id="totalBookings">0</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="inner-metric-box d-flex align-items-center justify-content-between p-3">
                        <div>
                            <span class="text-muted small d-block">Confirmed Bookings</span>
                            <h3 class="fw-extrabold mb-0" id="confirmedBookings">0</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="inner-metric-box d-flex align-items-center justify-content-between p-3">
                        <div>
                            <span class="text-muted small d-block">Pending Bookings</span>
                            <h3 class="fw-extrabold mb-0" id="pendingBookings">0</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Top Items Section -->
        <section class="row g-3 mb-4">
            <div class="col-xl-3 col-md-6">
                <div class="glass-card p-3 h-100">
                    <h6 class="fw-bold mb-3">Top Destinations</h6>
                    <div id="topDestinationsContainer" class="d-flex flex-column gap-2"></div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="glass-card p-3 h-100">
                    <h6 class="fw-bold mb-3">Top Hotels</h6>
                    <div id="topHotelsContainer" class="d-flex flex-column gap-2"></div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="glass-card p-3 h-100">
                    <h6 class="fw-bold mb-3">Top Transport</h6>
                    <div id="topTransportContainer" class="d-flex flex-column gap-2"></div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="glass-card p-3 h-100">
                    <h6 class="fw-bold mb-3">Top Activities</h6>
                    <div id="topActivitiesContainer" class="d-flex flex-column gap-2"></div>
                </div>
            </div>
        </section>

        <!-- Bottom Tables Section -->
        <section class="row g-3">
            <div class="col-xl-4 col-md-6">
                <div class="glass-card p-3 h-100">
                    <h6 class="fw-bold mb-3">Recent Reviews</h6>
                    <div id="recentReviewsContainer" class="d-flex flex-column gap-3"></div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="glass-card p-3 h-100">
                    <h6 class="fw-bold mb-3">Recent Registered Users</h6>
                    <div id="recentUsersContainer" class="d-flex flex-column gap-3"></div>
                </div>
            </div>
            <div class="col-xl-5 col-md-12">
                <div class="glass-card p-3 h-100">
                    <h6 class="fw-bold mb-3">Latest Bookings</h6>
                    <div class="table-responsive">
                        <table class="table custom-glass-table align-middle">
                            <thead>
                                <tr><th>ID</th><th>User</th><th>Destination</th><th>Date</th><th>Amount</th><th>Status</th></tr>
                            </thead>
                            <tbody id="latestBookingsTable"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

    </main>
</div>

<script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
</body>
</html>