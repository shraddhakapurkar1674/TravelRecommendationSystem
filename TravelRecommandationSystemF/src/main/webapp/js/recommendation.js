document.getElementById('recommendationForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const payload = {
        sourceLocation: document.getElementById('sourceLocation').value.trim(),
        targetDestination: document.getElementById('targetDestination').value.trim(),
        maxBudget: parseFloat(document.getElementById('maxBudget').value) || 0,
        tripType: document.getElementById('tripType').value,
        durationDays: parseInt(document.getElementById('durationDays').value)
    };

    fetch('http://localhost:8091/api/recommendations', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
    })
    .then(response => {
        if (!response.ok) throw new Error("Failed recommendation request");
        return response.json();
    })
    .then(data => {
        displayRecommendationResults(data);
    })
    .catch(error => {
        console.error('Error fetching recommendations:', error);
    });
});

function displayRecommendationResults(list) {
    const section = document.getElementById('recommendation-results-section');
    const container = document.getElementById('recommendationResults');
    
    section.classList.remove('d-none');
    container.innerHTML = '';

    if (!list || list.length === 0) {
        container.innerHTML = `
            <div class="col-12 text-center py-4">
                <div class="alert alert-info rounded-4 border-0 shadow-sm">
                    No recommendations matched your exact criteria. Try increasing your budget or selecting another category.
                </div>
            </div>`;
        section.scrollIntoView({ behavior: 'smooth' });
        return;
    }

    list.forEach(item => {
        const dest = item.destination || item;
        const html = `
            <div class="col-lg-6">
                <div class="card border-0 shadow-sm rounded-4 p-3 h-100 bg-white">
                    <div class="row g-0 align-items-center h-100">
                        <div class="col-md-5 h-100">
                            <img src="${dest.imageUrl || 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=500'}" class="img-fluid rounded-3 h-100 w-100 object-fit-cover" style="min-height: 180px;" alt="${dest.name}">
                        </div>
                        <div class="col-md-7 ps-md-3 pt-3 pt-md-0 d-flex flex-column justify-content-between h-100">
                            <div>
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="badge bg-primary-light text-primary rounded-pill px-3 py-1">${dest.category || 'General'}</span>
                                    <span class="badge bg-success text-white rounded-pill px-2 py-1">Score: ${Math.round(item.matchScore || 90)}%</span>
                                </div>
                                <h4 class="fw-bold mb-1">${dest.name}</h4>
                                <p class="small text-muted mb-2">${dest.shortDescription || dest.description || ''}</p>
                            </div>
                            <div class="pt-2 border-top mt-2">
                                <p class="fw-bold text-dark mb-2">Est. Total: <span class="text-primary">₹${item.totalEstimatedCost || (dest.pricePerDay * 3) || 0}</span></p>
                                <button class="btn btn-sm btn-gradient rounded-pill w-100 fw-semibold" onclick="alert('Viewing itinerary for ${dest.name}')">
                                    <i class="fas fa-route me-1"></i> View Suggested Itinerary
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `;
        container.innerHTML += html;
    });

    section.scrollIntoView({ behavior: 'smooth' });
}

function filterByTravellerType(type) {
    document.getElementById('tripType').value = type;
    document.getElementById('recommendationForm').dispatchEvent(new Event('submit'));
}