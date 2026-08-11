const BACKEND_BASE_URL = 'http://localhost:8091';

document.addEventListener("DOMContentLoaded", function () {
    fetchPopularDestinations();
    fetchSystemStatistics();
});

function fetchPopularDestinations() {
    fetch(`${BACKEND_BASE_URL}/api/destinations/popular`, {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' }
    })
    .then(response => {
        if (!response.ok) throw new Error("Network response failed");
        return response.json();
    })
    .then(data => {
        const container = document.getElementById('popularDestinationsContainer');
        if (!container) return;
        container.innerHTML = '';

        data.forEach(dest => {
            const cardHtml = `
                <div class="col-lg-4 col-md-6">
                    <div class="card destination-card border-0 shadow-sm rounded-4 overflow-hidden h-100">
                        <div class="destination-img-wrapper">
                            <img src="${dest.imageUrl || 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=500'}" alt="${dest.name}">
                            <span class="position-absolute top-0 end-0 bg-white text-dark fw-bold px-2 py-1 m-3 rounded-pill small shadow-sm">
                                <i class="fas fa-star text-warning me-1"></i>${dest.rating || '4.5'}
                            </span>
                        </div>
                        <div class="card-body d-flex flex-column justify-content-between p-3">
                            <div>
                                <h5 class="fw-bold mb-1">${dest.name}</h5>
                                <p class="text-muted small mb-2"><i class="fas fa-map-marker-alt text-danger me-1"></i>${dest.category} • ${dest.location}</p>
                                <p class="text-muted small">${dest.shortDescription || dest.description || ''}</p>
                            </div>
                            <div class="d-flex justify-content-between align-items-center pt-2 border-top mt-2">
                                <div>
                                    <small class="text-muted d-block">Est. Per Day</small>
                                    <span class="fw-bold text-primary fs-5">₹${dest.estimatedBudgetPerDay || dest.pricePerDay || '0'}</span>
                                </div>
                                <button class="btn btn-outline-primary btn-sm rounded-pill fw-semibold" onclick="exploreDestination('${dest.name}')">
                                    Explore &rarr;
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            container.innerHTML += cardHtml;
        });
    })
    .catch(err => {
        console.error("Error fetching destinations:", err);
        const container = document.getElementById('popularDestinationsContainer');
        if (container) {
            container.innerHTML = `<div class="col-12 text-center text-muted"><p>Unable to load popular destinations right now.</p></div>`;
        }
    });
}

function fetchSystemStatistics() {
    fetch(`${BACKEND_BASE_URL}/api/statistics`, {
        method: 'GET',
        headers: { 'Content-Type': 'application/json' }
    })
    .then(res => res.json())
    .then(stats => {
        if(stats.travellers) document.getElementById('statTravellers').innerText = stats.travellers + "+";
        if(stats.destinations) document.getElementById('statDestinations').innerText = stats.destinations + "+";
        if(stats.hotels) document.getElementById('statHotels').innerText = stats.hotels + "+";
        if(stats.experiences) document.getElementById('statExperiences').innerText = stats.experiences + "+";
    })
    .catch(err => console.error("Error fetching statistics:", err));
}

function exploreDestination(name) {
    const targetInput = document.getElementById('targetDestination');
    if (targetInput) {
        targetInput.value = name;
        document.getElementById('recommendationForm').dispatchEvent(new Event('submit'));
    }
}