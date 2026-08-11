<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">

<footer class="curved-footer">
    <!-- Curved Wave SVG -->
    <div class="footer-wave-svg">
        <svg viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M0,0 C150,90 350,-40 500,50 C650,140 900,10 1200,40 L1200,120 L0,120 Z"></path>
        </svg>
    </div>

    <div class="container position-relative" style="z-index: 4;">
        <div class="row g-4 justify-content-between">
            
            <!-- Brand Column -->
            <div class="col-lg-4 col-md-6">
                <h5 class="footer-title d-flex align-items-center gap-2">
                    <i class="fas fa-paper-plane" style="color: #fffff;"></i>
                    TripWise
                </h5>
                <p class="footer-description mb-3">
                    Explore personalized destinations, plan your trips effortlessly, and turn your travel dreams into reality with TripWise.
                </p>
                <div class="d-flex gap-2">
                    <a href="#" class="social-round-btn"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-round-btn"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-round-btn"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="social-round-btn"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 col-md-3 col-6">
                <h6 class="footer-title">Quick Links</h6>
                <a href="${pageContext.request.contextPath}/home.jsp" class="footer-link">Home</a>
                <a href="${pageContext.request.contextPath}/destinations.jsp" class="footer-link">Destinations</a>
                <a href="${pageContext.request.contextPath}/packages.jsp" class="footer-link">Tour Packages</a>
                <a href="${pageContext.request.contextPath}/about.jsp" class="footer-link">About Us</a>
            </div>

            <!-- Support Links -->
            <div class="col-lg-2 col-md-3 col-6">
                <h6 class="footer-title">Support</h6>
                <a href="#" class="footer-link">Help Center</a>
                <a href="#" class="footer-link">Privacy Policy</a>
                <a href="#" class="footer-link">Terms of Service</a>
                <a href="#" class="footer-link">Contact Us</a>
            </div>

            <!-- Newsletter -->
            <div class="col-lg-3 col-md-6">
                <h6 class="footer-title">Stay Updated</h6>
                <p class="footer-description mb-3">Subscribe to get special offers and travel updates.</p>
                <div class="footer-newsletter-group">
                    <input type="email" class="form-control footer-newsletter-input" placeholder="Your Email...">
                    <button class="btn btn-footer-subscribe" type="button">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>
            </div>

        </div>

        <hr class="footer-divider my-4">

        <div class="d-flex flex-column flex-sm-row justify-content-between align-items-center text-secondary small gap-2">
            <div>
                &copy; <%= java.time.Year.now().getValue() %> TripWise. All rights reserved.
            </div>
            <div class="d-flex gap-3">
                <a href="#" class="footer-link d-inline mb-0">Privacy</a>
                <a href="#" class="footer-link d-inline mb-0">Terms</a>
                <a href="#" class="footer-link d-inline mb-0">Cookies</a>
            </div>
        </div>
    </div>
</footer>