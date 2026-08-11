const HOTEL_API = "http://localhost:8091/api/hotels";
const DEST_API = "http://localhost:8091/api/destinations";

let hotelsData = [];
let currentPage = 1;
const rowsPerPage = 5;

document.addEventListener("DOMContentLoaded", () => {
    loadDestinationsDropdown();
    loadHotels();
});

// 1. Fetch Destinations for Dropdown in Form
function loadDestinationsDropdown() {
    fetch(DEST_API)
        .then(res => res.json())
        .then(data => {
            const select = document.getElementById("destinationSelect");
            select.innerHTML = '<option value="">-- Select Destination --</option>';
            data.forEach(d => {
                select.innerHTML += `<option value="${d.id}">${d.destinationName}</option>`;
            });
        })
        .catch(err => console.error("Error loading destinations:", err));
}

// 2. Load All Hotels
function loadHotels() {
    fetch(HOTEL_API)
        .then(res => res.json())
        .then(data => {
            hotelsData = data;
            currentPage = 1;
            renderTable();
        })
        .catch(err => console.error("Error fetching hotels:", err));
}

// 3. Render Table
function renderTable() {
    const tableBody = document.getElementById("hotelsTableBody");
    tableBody.innerHTML = "";

    if (!hotelsData || hotelsData.length === 0) {
        tableBody.innerHTML = `<tr><td colspan="7" style="text-align:center;">No hotels found.</td></tr>`;
        updatePagination(0);
        return;
    }

    const start = (currentPage - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    const items = hotelsData.slice(start, end);

    items.forEach(h => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${h.id}</td>
            <td style="font-weight:600;">${h.hotelName || '-'}</td>
            <td>${h.destinationName || 'N/A'}</td>
            <td>${h.location || '-'}</td>
            <td>⭐ ${h.rating ? h.rating.toFixed(1) : '0.0'}</td>
            <td>$${h.pricePerNight ? h.pricePerNight.toFixed(2) : '0.00'}</td>
            <td>
                <div class="action-btns">
                    <button class="btn-action btn-view" onclick="viewHotel(${h.id})"><i class="fa-solid fa-eye"></i></button>
                    <button class="btn-action btn-edit" onclick="editHotel(${h.id})"><i class="fa-solid fa-pen"></i></button>
                    <button class="btn-action btn-delete" onclick="deleteHotel(${h.id})"><i class="fa-solid fa-trash"></i></button>
                </div>
            </td>
        `;
        tableBody.appendChild(row);
    });

    updatePagination(hotelsData.length);
}

// 4. Save/Update Hotel
function saveHotel(event) {
    event.preventDefault();

    const formData = new FormData();
    const id = document.getElementById("hotelId").value;
    if (id) formData.append("id", id);

    formData.append("destinationId", document.getElementById("destinationSelect").value);
    formData.append("hotelName", document.getElementById("hotelName").value);
    formData.append("location", document.getElementById("location").value);
    formData.append("rating", document.getElementById("rating").value || 0.0);
    formData.append("pricePerNight", document.getElementById("pricePerNight").value || 0.0);
    formData.append("contactNumber", document.getElementById("contactNumber").value);
    formData.append("description", document.getElementById("description").value);
    formData.append("existingImage", document.getElementById("existingImage").value);

    const fileInput = document.getElementById("imageFile");
    if (fileInput.files.length > 0) {
        formData.append("imageFile", fileInput.files[0]);
    }

    fetch(`${HOTEL_API}/upload`, {
        method: "POST",
        body: formData
    })
    .then(res => res.text())
    .then(msg => {
        alert(msg);
        closeModal("hotelModal");
        loadHotels();
    })
    .catch(err => alert("Error saving hotel"));
}

// 5. View Hotel Details
function viewHotel(id) {
    const h = hotelsData.find(item => item.id === id);
    if (!h) return;

    let imageSrc = h.image ? h.image : 'images/default_hotel.jpg';
    if (!imageSrc.startsWith('http')) {
        const cleanPath = imageSrc.startsWith('/') ? imageSrc.substring(1) : imageSrc;
        imageSrc = `http://localhost:8091/${cleanPath}`;
    }

    document.getElementById("viewDetailsContent").innerHTML = `
        <div style="text-align:center; margin-bottom:15px;">
            <img src="${imageSrc}" style="width:100%; max-height:200px; object-fit:cover; border-radius:8px;" onerror="this.src='https://via.placeholder.com/400x200?text=No+Image';">
        </div>
        <p><strong>Hotel:</strong> ${h.hotelName}</p>
        <p><strong>Destination:</strong> ${h.destinationName || 'N/A'}</p>
        <p><strong>Location:</strong> ${h.location}</p>
        <p><strong>Rating:</strong> ⭐ ${h.rating}</p>
        <p><strong>Price/Night:</strong> $${h.pricePerNight}</p>
        <p><strong>Contact:</strong> ${h.contactNumber || 'N/A'}</p>
        <p><strong>Description:</strong> ${h.description || 'N/A'}</p>
    `;
    document.getElementById("viewModal").style.display = "flex";
}

// 6. Edit Hotel
function editHotel(id) {
    const h = hotelsData.find(item => item.id === id);
    if (!h) return;

    document.getElementById("modalTitle").innerText = "Edit Hotel";
    document.getElementById("hotelId").value = h.id;
    document.getElementById("destinationSelect").value = h.destinationId;
    document.getElementById("hotelName").value = h.hotelName || '';
    document.getElementById("location").value = h.location || '';
    document.getElementById("rating").value = h.rating || '';
    document.getElementById("pricePerNight").value = h.pricePerNight || '';
    document.getElementById("contactNumber").value = h.contactNumber || '';
    document.getElementById("description").value = h.description || '';
    document.getElementById("existingImage").value = h.image || '';

    document.getElementById("hotelModal").style.display = "flex";
}

// 7. Delete Hotel
function deleteHotel(id) {
    if (confirm("Are you sure you want to delete this hotel?")) {
        fetch(`${HOTEL_API}/${id}`, { method: "DELETE" })
            .then(res => res.text())
            .then(msg => {
                alert(msg);
                loadHotels();
            });
    }
}

// Helper Functions
function openAddModal() {
    document.getElementById("modalTitle").innerText = "Add Hotel";
    document.getElementById("addHotelForm").reset();
    document.getElementById("hotelId").value = "";
    document.getElementById("existingImage").value = "";
    document.getElementById("hotelModal").style.display = "flex";
}

function closeModal(id) {
    document.getElementById(id).style.display = "none";
}

function updatePagination(totalItems) {
    const totalPages = Math.ceil(totalItems / rowsPerPage) || 1;
    document.getElementById("pageInfo").innerText = `Showing ${totalItems === 0 ? 0 : (currentPage - 1) * rowsPerPage + 1} to ${Math.min(currentPage * rowsPerPage, totalItems)} of ${totalItems} entries`;
    
    document.getElementById("prevBtn").disabled = currentPage === 1;
    document.getElementById("nextBtn").disabled = currentPage === totalPages || totalItems === 0;

    const pageNumbers = document.getElementById("pageNumbers");
    pageNumbers.innerHTML = "";
    for (let i = 1; i <= totalPages; i++) {
        const btn = document.createElement("button");
        btn.innerText = i;
        btn.style.cssText = `padding: 4px 10px; border-radius: 4px; border: 1px solid #cbd5e1; cursor: pointer; background: ${i === currentPage ? '#2563eb' : '#fff'}; color: ${i === currentPage ? '#fff' : '#000'};`;
        btn.onclick = () => { currentPage = i; renderTable(); };
        pageNumbers.appendChild(btn);
    }
}

function prevPage() { if (currentPage > 1) { currentPage--; renderTable(); } }
function nextPage() { if (currentPage < Math.ceil(hotelsData.length / rowsPerPage)) { currentPage++; renderTable(); } }