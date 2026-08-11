<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap 5 CSS & Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <!-- Compact Header CSS -->
    <style>
        :root {
            --purple-primary: #6346f6;
            --purple-gradient: linear-gradient(135deg, #5031e2 0%, #7b51f8 100%);
            --navy-dark: #0f172a;
            --text-muted: #64748b;
        }

        /* Reduced Height Navbar Wrapper */
        .navbar-wrapper {
            width: 100%;
            background: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
            position: relative;
            z-index: 1000;
        }

        /* Compact Brand Logo & Subtitle */
        .logo-icon-bg {
            width: 34px;
            height: 34px;
            background: var(--purple-gradient);
            border-radius: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-size: 0.9rem;
            box-shadow: 0 3px 10px rgba(99, 70, 246, 0.25);
        }

        .brand-title {
            font-size: 1.25rem;
            font-weight: 800;
            color: var(--navy-dark);
            line-height: 1;
            letter-spacing: -0.3px;
        }

        .brand-title-accent {
            color: var(--purple-primary);
        }

        .brand-subtitle {
            font-size: 0.62rem;
            font-weight: 600;
            color: var(--text-muted);
            letter-spacing: 0.1px;
            margin-top: 1px;
        }

        /* Compact Nav Menu Items */
        .nav-link-custom {
            font-size: 0.85rem;
            font-weight: 600;
            color: #334155 !important;
            padding: 0.25rem 0.85rem !important; /* Reduced vertical padding */
            position: relative;
            transition: all 0.2s ease;
        }

        .nav-link-custom:hover {
            color: var(--purple-primary) !important;
        }

        /* Active State Underline */
        .nav-link-custom.active {
            color: var(--purple-primary) !important;
            font-weight: 700;
        }

        .nav-link-custom.active::after {
            content: "";
            position: absolute;
            bottom: -5px;
            left: 0.85rem;
            right: 0.85rem;
            height: 2px;
            background-color: var(--purple-primary);
            border-radius: 10px;
        }

        /* Compact Right Action Buttons */
        .btn-wishlist-nav, 
        .btn-login-nav {
            color: #334155;
            font-size: 0.82rem;
            font-weight: 600;
            background: transparent;
            border: none;
            padding: 0.35rem 0.65rem;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .btn-wishlist-nav:hover, 
        .btn-login-nav:hover {
            color: var(--purple-primary);
            background: #f8fafc;
        }

        .btn-signup-nav {
            background: var(--purple-gradient);
            color: #ffffff !important;
            font-size: 0.82rem;
            font-weight: 600;
            padding: 0.4rem 1.1rem;
            border-radius: 9px;
            border: none;
            text-decoration: none;
            box-shadow: 0 3px 10px rgba(99, 70, 246, 0.25);
            transition: all 0.25s ease;
        }

        .btn-signup-nav:hover {
            transform: translateY(-1px);
            box-shadow: 0 5px 14px rgba(99, 70, 246, 0.35);
        }
    </style>
</head>
<body>

<header class="navbar-wrapper">
    <nav class="navbar navbar-expand-xl py-2"> <!-- py-1 reduces navbar overall height -->
        <div class="container-fluid px-lg-5">
            
            <!-- Compact Brand Logo & Subtitle -->
            <a class="navbar-brand d-flex align-items-center gap-2 py-0" href="${pageContext.request.contextPath}/home.jsp">
                <div class="logo-icon-bg">
                    <i class="fas fa-paper-plane"></i>
                </div>
                <div class="d-flex flex-column">
                    <span class="brand-title">Trip<span class="brand-title-accent">Wise</span></span>
                    <span class="brand-subtitle">Smart Travel, Better Experiences</span>
                </div>
            </a>

            <!-- Mobile Toggler -->
            <button class="navbar-toggler border-0 shadow-none py-1 px-2" type="button" data-bs-toggle="collapse" data-bs-target="#tripWiseHeaderNav">
                <span class="navbar-toggler-icon" style="font-size: 0.85rem;"></span>
            </button>

            <!-- Navigation Links -->
            <div class="collapse navbar-collapse" id="tripWiseHeaderNav">
                
                <ul class="navbar-nav mx-auto my-1 my-xl-0 gap-xl-1 align-items-center">
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom ${pageContext.request.requestURI.endsWith('home.jsp') ? 'active' : ''}" 
                           href="${pageContext.request.contextPath}/home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom ${pageContext.request.requestURI.endsWith('destinations.jsp') ? 'active' : ''}" 
                           href="${pageContext.request.contextPath}/destinations.jsp">Destinations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom ${pageContext.request.requestURI.endsWith('hotels.jsp') ? 'active' : ''}" 
                           href="${pageContext.request.contextPath}/hotels.jsp">Hotels</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom ${pageContext.request.requestURI.endsWith('tripplanner.jsp') ? 'active' : ''}" 
                           href="${pageContext.request.contextPath}/tripplanner.jsp">Trip Planner</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-custom ${pageContext.request.requestURI.endsWith('about.jsp') ? 'active' : ''}" 
                           href="${pageContext.request.contextPath}/about.jsp">About Us</a>
                    </li>
                </ul>

                <!-- Action Buttons -->
                <div class="d-flex align-items-center gap-2 justify-content-center my-1 my-xl-0">
                    
                    <!-- Wishlist Link -->
                    <a href="${pageContext.request.contextPath}/wishlist.jsp" class="btn btn-wishlist-nav d-flex align-items-center gap-1.5">
                        <i class="far fa-heart"></i>
                        <span>Wishlist</span>
                    </a>

                    <% if (session.getAttribute("user") == null) { %>
                        <!-- Guest State -->
                        <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-login-nav d-flex align-items-center gap-1.5">
                            <i class="far fa-user"></i>
                            <span>Login</span>
                        </a>

                        <a href="${pageContext.request.contextPath}/register.jsp" class="btn btn-signup-nav">
                            Sign Up
                        </a>
                    <% } else { %>
                        <!-- Logged-In User State -->
                        <div class="dropdown">
                            <button class="btn btn-login-nav dropdown-toggle d-flex align-items-center gap-1.5" type="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user-circle fs-6" style="color: #6346f6;"></i>
                                <span>Account</span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end border-0 shadow-lg rounded-3 mt-2">
                                <li><a class="dropdown-item py-1.5" href="${pageContext.request.contextPath}/profile.jsp"><i class="fas fa-user me-2 text-muted"></i> Profile</a></li>
                                <li><a class="dropdown-item py-1.5" href="${pageContext.request.contextPath}/bookings.jsp"><i class="fas fa-ticket-alt me-2 text-muted"></i> My Trips</a></li>
                                <li><hr class="dropdown-divider opacity-10"></li>
                                <li><a class="dropdown-item py-1.5 text-danger" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                            </ul>
                        </div>
                    <% } %>

                </div>

            </div>
        </div>
    </nav>
</header>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>