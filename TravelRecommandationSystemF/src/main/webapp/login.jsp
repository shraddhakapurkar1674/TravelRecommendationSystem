<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - TripWise</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@600&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Login Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/login-styles.css" rel="stylesheet">

    <!-- Inline CSS Overrides -->
    <style>
        .glass-login-card {
            padding: 1.5rem 1.75rem 1.25rem !important; /* Compact inner padding */
            margin-top: 1rem !important;
        }

        .floating-plane-logo {
            width: 38px !important;
            height: 38px !important;
            font-size: 1rem !important;
            margin-top: -32px !important;
            margin-bottom: 0.5rem !important;
        }

        .custom-input-group {
            position: relative;
        }

        .custom-input-group input {
            padding: 0.45rem 2.5rem !important; /* Slimmer input height */
            font-size: 0.85rem !important;
        }

        .custom-input-group .input-icon-left,
        .custom-input-group .input-icon-right {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 0.85rem !important;
            color: #6c757d;
        }

        .custom-input-group .input-icon-left {
            left: 0.85rem;
        }

        .custom-input-group .input-icon-right {
            right: 0.85rem;
            cursor: pointer;
            z-index: 10;
        }

        .btn-login-submit {
            padding: 0.5rem 1rem !important;
            font-size: 0.88rem !important;
            transition: all 0.3s ease;
        }

        .divider-text {
            margin: 0.75rem 0 !important; /* Compact divider spacing */
        }

        .social-login-btn {
            width: 34px !important;
            height: 34px !important;
            font-size: 0.85rem !important;
            text-decoration: none;
        }

        .logo {
            width: 34px;
            height: 34px;
            background: var(--purple-gradient, #6346f6);
            border-radius: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-size: 0.9rem;
            box-shadow: 0 3px 10px rgba(99, 70, 246, 0.25);
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="login-page-wrapper">

        <!-- MAIN BODY SECTION -->
        <main class="main-content my-auto">
            <div class="container">
                <div class="row align-items-center justify-content-between">
                    
                    <!-- LEFT SIDE: Text, Features, Social Validation -->
                    <div class="col-lg-5 mb-4 mb-lg-0">
                        <div class="position-relative d-inline-block">
                            <span class="handwritten-welcome">Welcome Back!</span>
                            <!-- Dotted Path with Plane SVG -->
                            <svg class="travel-path-svg" viewBox="0 0 100 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M5 30 Q 50 -10, 95 10" stroke="#818cf8" stroke-width="2" stroke-dasharray="4 4"/>
                                <path d="M92 6 L98 11 L90 14 Z" fill="#6346f6"/>
                            </svg>
                        </div>

                        <h1 class="left-title mb-2" style="font-size: 2.2rem;">
                            Continue Your<br/>
                            Travel <span style="color: #6346f6;">Journey</span>
                        </h1>

                        <p class="text-secondary mb-4" style="max-width: 400px; font-size: 0.88rem; line-height: 1.5;">
                            Login to explore personalized destinations, create your travel plans and turn your dream trips into reality.
                        </p>

                        <!-- Feature Badges -->
                        <div class="d-flex flex-column gap-2 mb-3">
                            <div class="feature-badge-card d-flex align-items-center gap-3 py-2">
                                <div class="badge-icon badge-icon-purple">
                                    <i class="fas fa-map-marked-alt"></i>
                                </div>
                                <div>
                                    <h6 class="fw-bold mb-0" style="font-size: 0.85rem;">Personalized Recommendations</h6>
                                    <small class="text-muted" style="font-size: 0.72rem;">Trips tailored just for you</small>
                                </div>
                            </div>

                            <div class="feature-badge-card d-flex align-items-center gap-3 py-2">
                                <div class="badge-icon badge-icon-blue">
                                    <i class="fas fa-shield-alt"></i>
                                </div>
                                <div>
                                    <h6 class="fw-bold mb-0" style="font-size: 0.85rem;">Secure & Trusted</h6>
                                    <small class="text-muted" style="font-size: 0.72rem;">Your data is always protected</small>
                                </div>
                            </div>

                            <div class="feature-badge-card d-flex align-items-center gap-3 py-2">
                                <div class="badge-icon badge-icon-pink">
                                    <i class="fas fa-heart"></i>
                                </div>
                                <div>
                                    <h6 class="fw-bold mb-0" style="font-size: 0.85rem;">Travel. Explore. Cherish.</h6>
                                    <small class="text-muted" style="font-size: 0.72rem;">Make every trip unforgettable</small>
                                </div>
                            </div>
                        </div>

                        <!-- User Count Validation Badge -->
                        <div class="feature-badge-card d-flex align-items-center gap-3 py-2" style="max-width: 320px;">
                            <div class="avatar-group d-flex">
                                <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100" alt="User">
                                <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100" alt="User">
                                <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100" alt="User">
                                <img src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100" alt="User">
                            </div>
                            <div>
                                <span class="d-block fw-bold" style="font-size: 0.8rem;">Join <span style="color: #6346f6;">10,000+</span> Happy Travellers</span>
                                <div class="text-warning" style="font-size: 0.68rem;">
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- RIGHT SIDE: Glassmorphism Floating Compact Login Box -->
                    <div class="col-lg-5 col-xl-4 mx-auto">
                        <div class="glass-login-card position-relative">
                            
                            <!-- Card Header Icon -->
                            <div class="floating-plane-logo logo mx-auto">
                                <i class="fas fa-paper-plane"></i>
                            </div>

                            <h4 class="fw-extrabold text-center mb-1" style="font-weight: 800; font-size: 1.35rem;">
                                Login to <span style="color: #6346f6;">TripWise</span>
                            </h4>
                            <p class="text-center text-muted small mb-3" style="font-size: 0.78rem;">Your next adventure is one step away</p>

                            <!-- Dynamic JS Alert Notification Banner -->
                            <div id="jsAlertBanner" class="alert py-1 px-2 small rounded-2 mb-2 d-none" style="font-size: 0.78rem;" role="alert"></div>

                            <!-- Server-side Attribute Message (Fallback) -->
                            <% if (request.getAttribute("errorMessage") != null) { %>
                                <div class="alert alert-danger py-1 px-2 small rounded-2 mb-2" style="font-size: 0.78rem;" role="alert">
                                    <%= request.getAttribute("errorMessage") %>
                                </div>
                            <% } %>

                            <!-- Login Form -->
                            <form id="loginForm">
                                
                                <!-- Email Input -->
                                <div class="mb-3 custom-input-group">
                                    <i class="far fa-envelope input-icon-left"></i>
                                    <input type="email" id="emailInput" name="email" class="form-control" placeholder="Email Address" required autocomplete="off">
                                </div>

                                <!-- Password Input -->
                                <div class="mb-2 custom-input-group">
                                    <i class="fas fa-lock input-icon-left"></i>
                                    <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Password" required>
                                    <i class="far fa-eye input-icon-right" id="togglePassword"></i>
                                </div>

                                <!-- Remember & Forgot Password -->
                                <div class="d-flex align-items-center justify-content-between mb-3" style="font-size: 0.78rem;">
                                    <div class="form-check mb-0">
                                        <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                                        <label class="form-check-label text-secondary fw-medium" for="rememberMe">
                                            Remember me
                                        </label>
                                    </div>
                                    <a href="#" class="text-decoration-none fw-semibold" style="color: #6346f6;">Forgot Password?</a>
                                </div>

                                <!-- Submit Button -->
                                <button type="submit" id="submitBtn" class="btn btn-login-submit w-100 d-flex align-items-center justify-content-center gap-2" style="background-color: #6346f6; color: #ffffff;">
                                    <i class="fas fa-paper-plane" id="btnIcon"></i> 
                                    <span id="btnText">Login</span> 
                                    <i class="fas fa-arrow-right fs-6" id="btnArrow"></i>
                                </button>
                            </form>

                            <!-- Divider -->
                            <div class="divider-text text-center text-muted small my-2">
                                <span>OR</span>
                            </div>

                            <!-- Social Logins (Google, Facebook, Apple) -->
                            <div class="d-flex justify-content-center gap-2 mb-3">
                                <a href="#" class="social-login-btn border rounded-circle d-flex align-items-center justify-content-center">
                                    <svg width="16" height="16" viewBox="0 0 24 24"><path fill="#EA4335" d="M12 5c1.6 0 3 .6 4.1 1.6l3.1-3.1C17.3 1.7 14.8 1 12 1 7.5 1 3.7 3.6 1.9 7.3l3.7 2.9C6.5 7.3 9 5 12 5z"/><path fill="#4285F4" d="M23.5 12.3c0-.8-.1-1.6-.2-2.3H12v4.5h6.5c-.3 1.5-1.1 2.8-2.4 3.7l3.7 2.9c2.2-2 3.7-5 3.7-8.8z"/><path fill="#FBBC05" d="M5.6 14.8c-.2-.7-.4-1.5-.4-2.3s.2-1.6.4-2.3L1.9 7.3C.7 9.7 0 10.8 0 12s.7 2.3 1.9 4.7l3.7-2.9z"/><path fill="#34A853" d="M12 23c3.2 0 6-1.1 8-3l-3.7-2.9c-1.1.7-2.5 1.2-4.3 1.2-3 0-5.5-2.3-6.4-5.2L1.9 16C3.7 19.7 7.5 23 12 23z"/></svg>
                                </a>
                                <a href="#" class="social-login-btn border rounded-circle d-flex align-items-center justify-content-center text-primary">
                                    <i class="fab fa-facebook-f" style="color: #1877f2;"></i>
                                </a>
                                <a href="#" class="social-login-btn border rounded-circle d-flex align-items-center justify-content-center text-dark">
                                    <i class="fab fa-apple"></i>
                                </a>
                            </div>

                            <!-- Footer Link inside Card -->
                            <p class="text-center mb-0 text-secondary" style="font-size: 0.78rem;">
                                Don't have an account? 
                                <a href="${pageContext.request.contextPath}/register.jsp" class="fw-bold text-decoration-none" style="color: #6346f6;">
                                    Sign Up Now <i class="fas fa-arrow-right ms-1"></i>
                                </a>
                            </p>

                        </div>
                    </div>

                </div>
            </div>
        </main>

        <!-- FOOTER -->
        <jsp:include page="footer.jsp"></jsp:include>
    </div>

<!-- JavaScript Authentication Logic -->
<script>
document.addEventListener("DOMContentLoaded", function () {

    const loginForm = document.getElementById("loginForm");
    const passwordInput = document.getElementById("passwordInput");
    const togglePassword = document.getElementById("togglePassword");
    const alertBanner = document.getElementById("jsAlertBanner");
    const submitBtn = document.getElementById("submitBtn");
    const btnText = document.getElementById("btnText");
    const btnIcon = document.getElementById("btnIcon");
    const btnArrow = document.getElementById("btnArrow");

    // Helper to display clean alerts
    function displayAlert(message, type = "danger") {
        alertBanner.className = `alert alert-${type} py-1 px-2 small rounded-2 mb-2`;
        alertBanner.textContent = message;
        alertBanner.classList.remove("d-none");
    }

    // Toggle Password Visibility
    if (togglePassword && passwordInput) {
        togglePassword.addEventListener("click", function () {
            const isPassword = passwordInput.getAttribute("type") === "password";
            passwordInput.setAttribute("type", isPassword ? "text" : "password");
            this.classList.toggle("fa-eye", !isPassword);
            this.classList.toggle("fa-eye-slash", isPassword);
        });
    }

    // Handle Login Submit
    if (loginForm) {
        loginForm.addEventListener("submit", async function (e) {
            e.preventDefault();

            alertBanner.classList.add("d-none");

            const emailVal = document.getElementById("emailInput").value.trim();
            const passwordVal = passwordInput.value.trim();

            if (!emailVal || !passwordVal) {
                displayAlert("Please enter both email address and password.", "warning");
                return;
            }

            // Button loading UI state
            submitBtn.disabled = true;
            btnText.textContent = "Logging in...";
            btnIcon.className = "fas fa-spinner fa-spin";
            btnArrow.classList.add("d-none");

            try {
                // Call STS Backend at Port 8091
                const response = await fetch("http://localhost:8091/api/auth/login", {
                    method: "POST",
                    credentials: "include", // Required for session cookies across ports
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify({
                        email: emailVal,
                        password: passwordVal
                    })
                });

                const data = await response.json();

                if (response.ok) {
                    displayAlert("Login Successful! Redirecting...", "success");

                    const userRole = data.user ? data.user.role : "";
                    const contextPath = "${pageContext.request.contextPath}";

                    // Redirect based on MySQL Role
                    setTimeout(() => {
                        if (userRole === "ROLE_ADMIN" || userRole === "ADMIN") {
                            window.location.href = contextPath + "/dashboard.jsp";
                        } else {
                            window.location.href = contextPath + "/home.jsp";
                        }
                    }, 800);

                } else {
                    displayAlert(data.message || "Invalid Email or Password!", "danger");
                    
                    // Reset button state
                    submitBtn.disabled = false;
                    btnText.textContent = "Login";
                    btnIcon.className = "fas fa-paper-plane";
                    btnArrow.classList.remove("d-none");
                }
            } catch (error) {
                console.error("Login Error:", error);
                displayAlert("Connection Error! Make sure STS backend is running on http://localhost:8091", "danger");
                
                // Reset button state
                submitBtn.disabled = false;
                btnText.textContent = "Login";
                btnIcon.className = "fas fa-paper-plane";
                btnArrow.classList.remove("d-none");
            }
        });
    }
});
</script>
</body>
</html>