package com.travelrecommdations.repository;

import com.travelrecommdations.model.Hotel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class HotelRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 1. Get All Hotels with Destination Name (JOIN query)
    public List<Object> getAllHotels() {
        String sql = "SELECT h.*, d.destination_name FROM hotel h " +
                     "LEFT JOIN destination d ON h.destination_id = d.id " +
                     "ORDER BY h.id DESC";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Hotel hotel = new Hotel();
            hotel.setId(rs.getLong("id"));
            hotel.setDestinationId(rs.getLong("destination_id"));
            hotel.setDestinationName(rs.getString("destination_name"));
            hotel.setHotelName(rs.getString("hotel_name"));
            hotel.setLocation(rs.getString("location"));
            hotel.setRating(rs.getDouble("rating"));
            hotel.setPricePerNight(rs.getDouble("price_per_night"));
            hotel.setContactNumber(rs.getString("contact_number"));
            hotel.setDescription(rs.getString("description"));
            hotel.setImage(rs.getString("image"));
            hotel.setStatus(rs.getString("status"));
            return hotel;
        });
    }

    // 2. Add New Hotel
    public int addHotel(Hotel h) {
        String sql = "INSERT INTO hotel (destination_id, hotel_name, location, rating, price_per_night, contact_number, description, image, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        // Truncate image path if it exceeds length limits
        String imageUrl = h.getImage();
        if (imageUrl != null && imageUrl.length() > 255) {
            imageUrl = imageUrl.substring(0, 255);
        }

        return jdbcTemplate.update(sql, 
            h.getDestinationId(), 
            h.getHotelName(), 
            h.getLocation(), 
            h.getRating(), 
            h.getPricePerNight(), 
            h.getContactNumber(), 
            h.getDescription(), 
            imageUrl, 
            h.getStatus()
        );
    }

    // 3. Update Existing Hotel
    public int updateHotel(Hotel h) {
        String sql = "UPDATE hotel SET destination_id=?, hotel_name=?, location=?, rating=?, price_per_night=?, contact_number=?, description=?, image=? WHERE id=?";
        return jdbcTemplate.update(sql, 
            h.getDestinationId(), 
            h.getHotelName(), 
            h.getLocation(), 
            h.getRating(), 
            h.getPricePerNight(), 
            h.getContactNumber(), 
            h.getDescription(), 
            h.getImage(), 
            h.getId()
        );
    }

    // 4. Delete Hotel by ID
    public int deleteHotel(Long id) {
        String sql = "DELETE FROM hotel WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}