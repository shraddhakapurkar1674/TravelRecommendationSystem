package com.travelrecommdations.repository;




import com.travelrecommdations.model.Destination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DestinationDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Fetch all destinations
    public List<Object> getAllDestinations() {
        String sql = "SELECT * FROM destination ORDER BY id DESC";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            com.travelrecommdations.model.Destination dest = new com.travelrecommdations.model.Destination();
            dest.setId(rs.getLong("id"));
            dest.setDestinationName(rs.getString("destination_name"));
            dest.setState(rs.getString("state"));
            dest.setCountry(rs.getString("country"));
            dest.setCategory(rs.getString("category"));
            dest.setBudget(rs.getDouble("budget"));
            dest.setBestSeason(rs.getString("best_season"));
            dest.setDescription(rs.getString("description"));
            dest.setImage(rs.getString("image"));
            dest.setStatus(rs.getString("status"));
            return dest;
        });
    }

    // Insert new destination
    public int addDestination(Destination d) {
        String sql = "INSERT INTO destination (destination_name, state, country, category, budget, best_season, description, image, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                     
        // Prevent truncation error if image URL exceeds typical VARCHAR limits
        String imageUrl = d.getImage();
        if (imageUrl != null && imageUrl.length() > 255) {
            imageUrl = imageUrl.substring(0, 255);
        }

        return jdbcTemplate.update(sql, 
            d.getDestinationName(), 
            d.getState(), 
            d.getCountry(), 
            d.getCategory(), 
            d.getBudget(), 
            d.getBestSeason(), 
            d.getDescription(), 
            imageUrl, 
            d.getStatus()
        );
    }
    public int updateDestination(Destination d) {
        String sql = "UPDATE destination SET destination_name=?, state=?, country=?, category=?, budget=?, best_season=?, description=?, image=? WHERE id=?";
        return jdbcTemplate.update(sql, d.getDestinationName(), d.getState(), d.getCountry(), d.getCategory(), d.getBudget(), d.getBestSeason(), d.getDescription(), d.getImage(), d.getId());
    }
    // Delete destination by ID
    public int deleteDestination(Long id) {
        String sql = "DELETE FROM destination WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}