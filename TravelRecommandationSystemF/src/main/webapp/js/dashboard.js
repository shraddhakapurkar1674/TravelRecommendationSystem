document.addEventListener("DOMContentLoaded", function () {
    loadDashboardStats();
});

function loadDashboardStats() {
    const backendUrl = "http://localhost:8091/api/admin/dashboard/stats";

    fetch(backendUrl)
        .then(response => {
            if (!response.ok) throw new Error("HTTP Status: " + response.status);
            return response.json();
        })
        .then(data => {
            setSafeText("totalUsers", data.totalUsers ? data.totalUsers.toLocaleString() : "0");
            setSafeText("totalDestinations", data.totalDestinations || "0");
            setSafeText("totalHotels", data.totalHotels || "0");
            setSafeText("totalTransport", data.totalTransport || "0");
            setSafeText("totalActivities", data.totalActivities || "0");
            setSafeText("totalReviews", data.totalReviews || "0");

            setSafeText("totalBookings", data.totalBookings || "0");
            setSafeText("confirmedBookings", data.confirmedBookings || "0");
            setSafeText("pendingBookings", data.pendingBookings || "0");

            renderRankingList("topDestinationsContainer", data.topDestinations, "views");
            renderRankingList("topHotelsContainer", data.topHotels, "bookings");
            renderRankingList("topTransportContainer", data.topTransport, "bookings");
            renderRankingList("topActivitiesContainer", data.topActivities, "bookings");

            renderReviews("recentReviewsContainer", data.recentReviews);
            renderUsers("recentUsersContainer", data.recentUsers);
            renderBookingsTable("latestBookingsTable", data.latestBookings);
        })
        .catch(err => {
            console.error("Error connecting to STS API (Port 8091):", err);
        });
}

function setSafeText(id, value) {
    const el = document.getElementById(id);
    if (el) el.innerText = value;
}

function renderRankingList(containerId, items, subMetricKey) {
    const container = document.getElementById(containerId);
    if (!container) return;
    container.innerHTML = "";

    if (!items || items.length === 0) {
        container.innerHTML = `<small class="text-muted">No data</small>`;
        return;
    }

    items.slice(0, 5).forEach((item, idx) => {
        const subText = item[subMetricKey] ? `${item[subMetricKey]} ${subMetricKey}` : '';
        const imgUrl = item.imageUrl || `https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=80`;

        container.innerHTML += `
            <div class="d-flex align-items-center justify-content-between py-1">
                <div class="d-flex align-items-center gap-2">
                    <span class="ranking-badge">${idx + 1}</span>
                    <img src="${imgUrl}" class="item-thumb" alt="${item.name}">
                    <div><h6 class="item-title">${item.name}</h6></div>
                </div>
                <div class="text-end">
                    <small class="text-warning fw-bold" style="font-size:0.72rem;">★ ${item.rating || '4.5'}</small>
                    <div class="text-muted" style="font-size:0.68rem;">${subText}</div>
                </div>
            </div>`;
    });
}

function renderReviews(containerId, reviews) {
    const container = document.getElementById(containerId);
    if (!container) return;
    container.innerHTML = "";

    if (!reviews || reviews.length === 0) {
        container.innerHTML = `<small class="text-muted">No reviews</small>`;
        return;
    }

    reviews.slice(0, 5).forEach(rev => {
        container.innerHTML += `
            <div class="d-flex gap-2 py-1">
                <img src="${rev.userAvatar || 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=80'}" class="rounded-circle item-thumb">
                <div class="flex-grow-1">
                    <div class="d-flex justify-content-between align-items-center">
                        <strong style="font-size:0.78rem;">${rev.user}</strong>
                        <span class="text-muted" style="font-size:0.68rem;">${rev.date}</span>
                    </div>
                    <small class="text-primary d-block" style="font-size:0.7rem;">${rev.location}</small>
                    <p class="text-secondary mb-0" style="font-size:0.72rem; line-height:1.3;">"${rev.comment}"</p>
                </div>
            </div>`;
    });
}

function renderUsers(containerId, users) {
    const container = document.getElementById(containerId);
    if (!container) return;
    container.innerHTML = "";

    if (!users || users.length === 0) {
        container.innerHTML = `<small class="text-muted">No users</small>`;
        return;
    }

    users.slice(0, 5).forEach(u => {
        const initial = u.name ? u.name.charAt(0).toUpperCase() : "U";
        container.innerHTML += `
            <div class="d-flex align-items-center justify-content-between py-1">
                <div class="d-flex align-items-center gap-2">
                    <div class="user-avatar-initial">${initial}</div>
                    <div>
                        <h6 class="item-title">${u.name}</h6>
                        <small class="text-muted" style="font-size:0.68rem;">${u.email}</small>
                    </div>
                </div>
                <small class="text-muted" style="font-size:0.68rem;">${u.date || ''}</small>
            </div>`;
    });
}

function renderBookingsTable(tableBodyId, bookings) {
    const tableBody = document.getElementById(tableBodyId);
    if (!tableBody) return;
    tableBody.innerHTML = "";

    if (!bookings || bookings.length === 0) {
        tableBody.innerHTML = `<tr><td colspan="6" class="text-center text-muted">No bookings</td></tr>`;
        return;
    }

    bookings.slice(0, 5).forEach(b => {
        const isConfirmed = (b.status || "").toLowerCase() === "confirmed";
        const badgeClass = isConfirmed ? "badge-confirmed" : "badge-pending";

        tableBody.innerHTML += `
            <tr>
                <td><strong>${b.id}</strong></td>
                <td>${b.user}</td>
                <td>${b.destination}</td>
                <td>${b.date}</td>
                <td class="fw-bold">₹${b.amount}</td>
                <td><span class="status-badge-soft ${badgeClass}">${b.status}</span></td>
            </tr>`;
    });
}