<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>

<!-- Bootstrap 5 CSS & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    

<!-- 1. EMBEDDED SIDEBAR CSS -->
<style>
/* Sidebar Container */
.sidebar {
    width: 270px;
    background: #ffffff;
    border-right: 1px solid #eef2f6;
    padding: 24px 16px;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Brand Logo Styling */
.brand-container {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 0 12px 28px 12px;
}

.brand-icon {
    width: 36px;
    height: 36px;
    background: #2563eb;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #ffffff;
    font-size: 18px;
    font-weight: bold;
}

.brand-title {
    font-size: 22px;
    font-weight: 700;
    color: #1e293b;
    line-height: 1.1;
}

.brand-subtitle {
    font-size: 11px;
    color: #64748b;
    font-weight: 500;
}

/* Navigation List */
.nav-links {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 4px;
}
.l{
 color: #2563eb;
}

.nav-links li {
    border-radius: 12px;
    transition: all 0.2s ease;
}

/* Base Link Styling */
.nav-links li a {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 12px 16px;
    text-decoration: none;
    color: #64748b;
    font-size: 14px;
    font-weight: 500;
    border-radius: 12px;
    transition: all 0.2s ease;
}

.nav-links li a .nav-icon {
    font-size: 18px;
    width: 22px;
    text-align: center;
}

/* Hover State */
.nav-links li:hover:not(.active) a {
    background-color: #f8fafc;
    color: #1e293b;
}

/* Exact Gradient Active Pill Matching Design */
.nav-links li.active {
    background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%);
    box-shadow: 0 4px 12px rgba(79, 70, 229, 0.25);
}

.nav-links li.active a {
    color: #ffffff !important;
    font-weight: 600;
}

/* Red Logout Button Styling */
.nav-links li.logout-item a {
    color: #ef4444;
    margin-top: 15px;
}

.nav-links li.logout-item:hover a {
    background-color: #fef2f2;
    color: #dc2626;
}
.brand-title {
            font-size: 1.25rem;
            font-weight: 800;
            color: var(--navy-dark);
            line-height: 1;
            letter-spacing: -0.3px;
        }



</style>
</head>

<!-- 2. REUSABLE SIDEBAR HTML -->
<aside class="sidebar">
    <!-- Logo Header -->
    <div class="brand-container">
        <div class="brand-icon  logo-icon-bg"><i class="fas fa-paper-plane"></i></div>
        <div>
            <span class="brand-title">Trip<span class="brand-title-accent l ">Wise</span></span>
            <div class="brand-subtitle">Smart Travel, Better Experiences</div>
        </div>
    </div>

    <!-- Navigation Menu -->
    <ul class="nav-links">
        <li class="${param.activePage == 'dashboard' ? 'active' : ''}">
            <a href="dashboard.jsp"><span class="nav-icon">📊</span> Dashboard</a>
        </li>
        <li class="${param.activePage == 'destination' ? 'active' : ''}">
            <a href="destinations.jsp"><span class="nav-icon">📍</span> Destination Management</a>
        </li>
        <li class="${param.activePage == 'hotel' ? 'active' : ''}">
            <a href="hotels.jsp"><span class="nav-icon">🏢</span> Hotel Management</a>
        </li>
        <li class="${param.activePage == 'transport' ? 'active' : ''}">
            <a href="transport.jsp"><span class="nav-icon">🚌</span> Transport Management</a>
        </li>
        <li class="${param.activePage == 'activity' ? 'active' : ''}">
            <a href="activities.jsp"><span class="nav-icon">🧗</span> Activity Management</a>
        </li>
        <li class="${param.activePage == 'package' ? 'active' : ''}">
            <a href="packages.jsp"><span class="nav-icon">📦</span> Package Management</a>
        </li>
        <li class="${param.activePage == 'booking' ? 'active' : ''}">
            <a href="bookings.jsp"><span class="nav-icon">🎟️</span> Booking Management</a>
        </li>
        <li class="${param.activePage == 'review' ? 'active' : ''}">
            <a href="reviews.jsp"><span class="nav-icon">⭐</span> Review Management</a>
        </li>
        <li class="${param.activePage == 'user' ? 'active' : ''}">
            <a href="users.jsp"><span class="nav-icon">👥</span> User Management</a>
        </li>
        <li class="${param.activePage == 'offer' ? 'active' : ''}">
            <a href="offers.jsp"><span class="nav-icon">🏷️</span> Offer & Discounts</a>
        </li>
        <li class="${param.activePage == 'guide' ? 'active' : ''}">
            <a href="guides.jsp"><span class="nav-icon">🚶</span> Guide Management</a>
        </li>
        <li class="${param.activePage == 'report' ? 'active' : ''}">
            <a href="reports.jsp"><span class="nav-icon">📈</span> Reports & Analytics</a>
        </li>
        <li class="${param.activePage == 'notification' ? 'active' : ''}">
            <a href="notifications.jsp"><span class="nav-icon">🔔</span> Notifications</a>
        </li>
        <li class="${param.activePage == 'settings' ? 'active' : ''}">
            <a href="settings.jsp"><span class="nav-icon">⚙️</span> Settings</a>
        </li>
        <li class="logout-item">
            <a href="logout"><span class="nav-icon">🚪</span> Logout</a>
        </li>
    </ul>
</aside>

<!-- 3. SIDEBAR AUTO-HIGHLIGHT JS FALLBACK -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    // Automatic fallback: Highlight link if parameter isn't supplied
    const currentPath = window.location.pathname.split("/").pop();
    const navItems = document.querySelectorAll(".nav-links li a");

    navItems.forEach(link => {
        const href = link.getAttribute("href");
        if (href && currentPath.endsWith(href)) {
            // Remove active from all items
            document.querySelectorAll(".nav-links li").forEach(li => li.classList.remove("active"));
            // Add active to parent <li>
            link.parentElement.classList.add("active");
        }
    });
});
</script>