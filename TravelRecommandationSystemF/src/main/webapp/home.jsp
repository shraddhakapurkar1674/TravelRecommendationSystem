<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TripWise - Smart Travel, Better Experiences</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Swiper CSS (For Slider) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Custom Page Stylesheet -->
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">
</head>
<body>

    <!-- Header Include -->
    <jsp:include page="header.jsp" />

    <!-- 1. HERO BANNER SECTION -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 col-xl-7">
                    <h1 class="fw-extrabold text-dark hero-title mb-3">
                        Discover Personalized<br/>
                        Travel <span class="text-purple-gradient">Recommendations</span>
                    </h1>
                    <p class="hero-subtitle mb-4">
                        Get destination, hotel, transport and activity recommendations tailored just for you.
                    </p>
                    <div class="d-flex flex-wrap gap-3 mb-2">
                        <a href="#search-bar" class="btn btn-primary-gradient rounded-3 px-4 py-2-5 fw-semibold shadow-sm d-flex align-items-center gap-2">
                            <i class="fas fa-sliders-h"></i> Get Recommendations
                        </a>
                        <a href="#" class="btn btn-outline-secondary rounded-3 px-4 py-2-5 fw-semibold d-flex align-items-center gap-2 bg-white shadow-sm border-0">
                            <i class="fas fa-play-circle text-primary fs-5"></i> Watch Demo
                        </a>
                    </div>
                </div>
            </div>

            <!-- SEARCH / RECOMMENDATION BAR -->
            <div id="search-bar" class="search-floating-card card rounded-4 p-3 mt-5">
                <form id="recommendationForm" class="row g-2 align-items-center">
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex align-items-center search-input-group rounded-3 px-3 py-2">
                            <i class="fas fa-location-arrow text-primary fs-5 me-2"></i>
                            <div class="w-100">
                                <label class="d-block text-muted fw-bold mb-0" style="font-size: 0.7rem; text-transform: uppercase;">From</label>
                                <input type="text" id="sourceLocation" class="form-control border-0 bg-transparent p-0 fw-semibold text-dark shadow-none" value="Pune" placeholder="Enter Origin" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex align-items-center search-input-group rounded-3 px-3 py-2">
                            <i class="fas fa-map-marker-alt text-purple fs-5 me-2"></i>
                            <div class="w-100">
                                <label class="d-block text-muted fw-bold mb-0" style="font-size: 0.7rem; text-transform: uppercase;">Where to?</label>
                                <input type="text" id="targetDestination" class="form-control border-0 bg-transparent p-0 fw-semibold text-dark shadow-none" placeholder="Any Destination">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4">
                        <div class="d-flex align-items-center search-input-group rounded-3 px-3 py-2">
                            <i class="fas fa-wallet text-success fs-5 me-2"></i>
                            <div class="w-100">
                                <label class="d-block text-muted fw-bold mb-0" style="font-size: 0.7rem; text-transform: uppercase;">Budget</label>
                                <input type="number" id="maxBudget" class="form-control border-0 bg-transparent p-0 fw-semibold text-dark shadow-none" placeholder="Any Budget">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4">
                        <div class="d-flex align-items-center search-input-group rounded-3 px-3 py-2">
                            <i class="fas fa-tag text-warning fs-5 me-2"></i>
                            <div class="w-100">
                                <label class="d-block text-muted fw-bold mb-0" style="font-size: 0.7rem; text-transform: uppercase;">Trip Type</label>
                                <select id="tripType" class="form-select border-0 bg-transparent p-0 fw-semibold text-dark shadow-none">
                                    <option value="Any">Any Type</option>
                                    <option value="Adventure">Adventure</option>
                                    <option value="Beach">Beach</option>
                                    <option value="Nature">Nature</option>
                                    <option value="Cultural">Cultural</option>
                                    <option value="Family">Family</option>
                                    <option value="Romantic">Romantic</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4">
                        <button type="submit" class="btn btn-primary-gradient w-100 rounded-3 py-2-5 text-white fw-bold shadow-sm d-flex align-items-center justify-content-center gap-2">
                            <i class="fas fa-map-marked-alt"></i> Plan My Trip
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- 2. WHY CHOOSE TRIPWISE -->
    <section class="py-5 bg-white">
        <div class="container py-3">
            <div class="text-center mb-5">
                <h2 class="section-title">Why Choose <span class="text-purple">TripWise?</span></h2>
            </div>
            <div class="row g-3">
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="card border-0 shadow-sm p-3 text-center h-100 rounded-4 feature-box">
                        <div class="icon-circle icon-bg-blue mx-auto mb-3"><i class="fas fa-bullseye"></i></div>
                        <h6 class="fw-bold text-dark mb-2" style="font-size: 0.88rem;">Personalized Recommendations</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">AI-powered suggestions based on your preferences and past behavior.</p>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="card border-0 shadow-sm p-3 text-center h-100 rounded-4 feature-box">
                        <div class="icon-circle icon-bg-orange mx-auto mb-3"><i class="fas fa-wallet"></i></div>
                        <h6 class="fw-bold text-dark mb-2" style="font-size: 0.88rem;">Budget Optimizer</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">Smart suggestions that fit perfectly in your budget.</p>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="card border-0 shadow-sm p-3 text-center h-100 rounded-4 feature-box">
                        <div class="icon-circle icon-bg-purple mx-auto mb-3"><i class="fas fa-map"></i></div>
                        <h6 class="fw-bold text-dark mb-2" style="font-size: 0.88rem;">Complete Trip Planner</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">Plan hotels, activities, transport and more in one place.</p>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="card border-0 shadow-sm p-3 text-center h-100 rounded-4 feature-box">
                        <div class="icon-circle icon-bg-teal mx-auto mb-3"><i class="fas fa-cloud-sun"></i></div>
                        <h6 class="fw-bold text-dark mb-2" style="font-size: 0.88rem;">Weather Check</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">Real-time weather updates to help you plan better.</p>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="card border-0 shadow-sm p-3 text-center h-100 rounded-4 feature-box">
                        <div class="icon-circle icon-bg-yellow mx-auto mb-3"><i class="fas fa-star"></i></div>
                        <h6 class="fw-bold text-dark mb-2" style="font-size: 0.88rem;">Top Experiences</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">Handpicked activities and local experiences for you.</p>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <div class="card border-0 shadow-sm p-3 text-center h-100 rounded-4 feature-box">
                        <div class="icon-circle icon-bg-pink mx-auto mb-3"><i class="fas fa-heart"></i></div>
                        <h6 class="fw-bold text-dark mb-2" style="font-size: 0.88rem;">Save & Wishlist</h6>
                        <p class="text-muted mb-0" style="font-size: 0.75rem;">Save your favorite recommendations and plan anytime.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 3. POPULAR DESTINATIONS -->
    <section class="py-5 bg-white">
        <div class="container py-3">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="section-title mb-0">Popular <span class="text-purple">Destinations</span></h2>
                <a href="${pageContext.request.contextPath}/destinations.jsp" class="text-purple fw-bold text-decoration-none">
                    View All <i class="fas fa-arrow-right ms-1"></i>
                </a>
            </div>

            <div class="row g-3">
                <div class="col">
                    <div class="destination-card shadow-sm">
                        <img src="https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?w=500" alt="Goa">
                        <div class="destination-overlay">
                            <span class="rating-badge"><i class="fas fa-star text-warning me-1"></i>4.6</span>
                            <div>
                                <h5 class="text-white fw-bold mb-0"><i class="fas fa-map-marker-alt me-1"></i> Goa</h5>
                                <p class="text-white-50 small mb-1">Beach • Nightlife</p>
                                <span class="text-white fw-bold">From ₹5,999 <i class="fas fa-chevron-right fs-6 ms-1"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="destination-card shadow-sm">
                        <img src="https://images.unsplash.com/photo-1506461883276-594a12b11ce3?w=500" alt="Manali">
                        <div class="destination-overlay">
                            <span class="rating-badge"><i class="fas fa-star text-warning me-1"></i>4.7</span>
                            <div>
                                <h5 class="text-white fw-bold mb-0"><i class="fas fa-map-marker-alt me-1"></i> Manali</h5>
                                <p class="text-white-50 small mb-1">Mountains • Snow</p>
                                <span class="text-white fw-bold">From ₹7,999 <i class="fas fa-chevron-right fs-6 ms-1"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="destination-card shadow-sm">
                        <img src="https://images.unsplash.com/photo-1599661046289-e31897846e41?w=500" alt="Udaipur">
                        <div class="destination-overlay">
                            <span class="rating-badge"><i class="fas fa-star text-warning me-1"></i>4.5</span>
                            <div>
                                <h5 class="text-white fw-bold mb-0"><i class="fas fa-map-marker-alt me-1"></i> Udaipur</h5>
                                <p class="text-white-50 small mb-1">Heritage • Lakes</p>
                                <span class="text-white fw-bold">From ₹6,499 <i class="fas fa-chevron-right fs-6 ms-1"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="destination-card shadow-sm">
                        <img src="https://images.unsplash.com/photo-1602216056096-3b40cc0c9944?w=500" alt="Coorg">
                        <div class="destination-overlay">
                            <span class="rating-badge"><i class="fas fa-star text-warning me-1"></i>4.5</span>
                            <div>
                                <h5 class="text-white fw-bold mb-0"><i class="fas fa-map-marker-alt me-1"></i> Coorg</h5>
                                <p class="text-white-50 small mb-1">Nature • Coffee</p>
                                <span class="text-white fw-bold">From ₹4,499 <i class="fas fa-chevron-right fs-6 ms-1"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="destination-card shadow-sm">
                        <img src="https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?w=500" alt="Rishikesh">
                        <div class="destination-overlay">
                            <span class="rating-badge"><i class="fas fa-star text-warning me-1"></i>4.5</span>
                            <div>
                                <h5 class="text-white fw-bold mb-0"><i class="fas fa-map-marker-alt me-1"></i> Rishikesh</h5>
                                <p class="text-white-50 small mb-1">Adventure • Spiritual</p>
                                <span class="text-white fw-bold">From ₹4,999 <i class="fas fa-chevron-right fs-6 ms-1"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 4. WHAT KIND OF TRAVELLER ARE YOU? (PRO SLIDER WITH 10 OPTIONS) -->
    <section class="py-5 traveller-section">
        <div class="container py-3">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2 class="section-title mb-1">What Kind of <span class="text-purple">Traveller</span> Are You?</h2>
                    <p class="text-muted mb-0 small">Swipe to find curated trips tailored to your vibe</p>
                </div>
                <!-- Navigation Arrows -->
                <div class="d-none d-md-flex gap-2">
                    <div class="swiper-button-prev-custom"><i class="fas fa-chevron-left"></i></div>
                    <div class="swiper-button-next-custom"><i class="fas fa-chevron-right"></i></div>
                </div>
            </div>

            <!-- Swiper Container -->
            <div class="swiper traveller-swiper">
                <div class="swiper-wrapper">
                    <!-- Option 1 -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1551632811-561732d1e306?w=400" alt="Adventure Seeker">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Adventure Seeker</h6>
                                <p class="text-muted mb-0 small">Thrill-seeking activities, trekking and high energy.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Option 2 -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400" alt="Beach Lover">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Beach Lover</h6>
                                <p class="text-muted mb-0 small">Sun, waves, water sports and coastal relaxation.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Option 3 -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1448375240586-882707db888b?w=400" alt="Nature Explorer">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Nature Explorer</h6>
                                <p class="text-muted mb-0 small">Wildlife, lush forests, lakes and offbeat trails.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Option 4 -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1564507592333-c60657eea523?w=400" alt="Cultural Explorer">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Cultural Explorer</h6>
                                <p class="text-muted mb-0 small">Heritage monuments, history, art and local tradition.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Option 5 -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1511895426328-dc8714191300?w=400" alt="Family Vacationer">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Family Vacationer</h6>
                                <p class="text-muted mb-0 small">Kid-friendly resorts, safe activities and family fun.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Option 6 -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1501555088652-021faa106b9b?w=400" alt="Solo Backpacker">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Solo Backpacker</h6>
                                <p class="text-muted mb-0 small">Budget stays, social hostels and self-discovery trips.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Option 7 (NEW) -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=400" alt="Luxury & Spa">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Luxury & Wellness</h6>
                                <p class="text-muted mb-0 small">5-star resorts, spa retreats and premium comfort.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Option 8 (NEW) -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=400" alt="Foodie Explorer">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Foodie Explorer</h6>
                                <p class="text-muted mb-0 small">Street food tours, fine dining and culinary culture.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Option 9 (NEW) -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1518105779142-d975f22f1b0a?w=400" alt="Romantic Getaway">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Romantic Escapes</h6>
                                <p class="text-muted mb-0 small">Honeymoon spots, sunset points and cozy retreats.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Option 10 (NEW) -->
                    <div class="swiper-slide">
                        <div class="traveller-card">
                            <div class="img-wrapper">
                                <img src="https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?w=400" alt="Workationer">
                            </div>
                            <div class="p-3">
                                <h6 class="fw-bold text-dark mb-1">Digital Nomad</h6>
                                <p class="text-muted mb-0 small">Workation spots with high-speed Wi-Fi and good views.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Swiper Dots -->
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </section>

    <!-- 5. BUILD YOUR COMPLETE TRIP -->
    <section class="py-5 bg-light">
        <div class="container py-3">
            <div class="text-center mb-5">
                <h2 class="section-title">Build Your <span class="text-purple">Complete</span> Trip</h2>
                <p class="text-muted mb-0">Plan your perfect trip in just a few simple steps</p>
            </div>

            <div class="trip-build-container">
                <div class="step-connector-line d-none d-md-block"></div>

                <div class="row g-4 text-center">
                    <div class="col-md">
                        <div class="step-circle bg-primary">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h6 class="fw-bold text-dark mb-1">1. Choose Destination</h6>
                        <p class="text-muted small mb-0">Select a destination you love</p>
                    </div>
                    <div class="col-md">
                        <div class="step-circle" style="background-color: #7c3aed;">
                            <i class="fas fa-sliders-h"></i>
                        </div>
                        <h6 class="fw-bold text-dark mb-1">2. Customize Preferences</h6>
                        <p class="text-muted small mb-0">Tell us your budget, interests and style</p>
                    </div>
                    <div class="col-md">
                        <div class="step-circle" style="background-color: #059669;">
                            <i class="fas fa-list-ul"></i>
                        </div>
                        <h6 class="fw-bold text-dark mb-1">3. Get Recommendations</h6>
                        <p class="text-muted small mb-0">We suggest the best options for you</p>
                    </div>
                    <div class="col-md">
                        <div class="step-circle" style="background-color: #f97316;">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <h6 class="fw-bold text-dark mb-1">4. Plan Your Trip</h6>
                        <p class="text-muted small mb-0">Organize your itinerary, hotels, transport</p>
                    </div>
                    <div class="col-md">
                        <div class="step-circle" style="background-color: #ec4899;">
                            <i class="fas fa-shopping-bag"></i>
                        </div>
                        <h6 class="fw-bold text-dark mb-1">5. Enjoy Your Journey</h6>
                        <p class="text-muted small mb-0">Pack your bags and have a great trip!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 6. HIGH-CONTRAST FOOTER SECTION -->
    <jsp:include page="footer.jsp"></jsp:include>

    <!-- JS Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    
    <!-- Initialize Traveller Swiper -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var swiper = new Swiper('.traveller-swiper', {
                slidesPerView: 1,
                spaceBetween: 16,
                loop: true,
                autoplay: {
                    delay: 3500,
                    disableOnInteraction: false,
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                navigation: {
                    nextEl: '.swiper-button-next-custom',
                    prevEl: '.swiper-button-prev-custom',
                },
                breakpoints: {
                    576: { slidesPerView: 2, spaceBetween: 16 },
                    768: { slidesPerView: 3, spaceBetween: 20 },
                    992: { slidesPerView: 4, spaceBetween: 20 },
                    1200: { slidesPerView: 5, spaceBetween: 24 }
                }
            });
        });
    </script>
</body>
</html>