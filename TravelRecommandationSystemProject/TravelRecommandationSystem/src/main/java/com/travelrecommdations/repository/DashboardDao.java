package com.travelrecommdations.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.travelrecommdations.model.Destination;

import java.util.List;
import java.util.Map;

@Repository
public class DashboardDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // --- 1. COUNTS (From your actual MySQL tables) ---
    public int getTotalUsersCount() {
        return queryForIntSafely("SELECT COUNT(*) FROM users");
    }

    public int getDestinationsCount() {
        return queryForIntSafely("SELECT COUNT(*) FROM destination");
    }

    public int getHotelsCount() {
        return queryForIntSafely("SELECT COUNT(*) FROM hotel");
    }

    public int getTransportCount() {
        return queryForIntSafely("SELECT COUNT(*) FROM transport");
    }

    public int getActivitiesCount() {
        return queryForIntSafely("SELECT COUNT(*) FROM activity");
    }

    public int getUserPreferencesCount() {
        return queryForIntSafely("SELECT COUNT(*) FROM user_prefrence");
    }

    public int getAdminsCount() {
        return queryForIntSafely("SELECT COUNT(*) FROM admin");
    }

    // --- 2. TOP 5 LISTS FROM YOUR TABLES ---
    
    // Top 5 Destinations
    public List<Destination> getTop5Destinations() {
        String sql = "SELECT id, destination_name, state, country, category, budget, best_season, description, image, status " +
                     "FROM destination ORDER BY id ASC LIMIT 5";
                     
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Destination dest = new Destination();
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

    // Top 5 Hotels
    public List<Map<String, Object>> getTop5Hotels() {
        String sql = "SELECT * FROM hotel ORDER BY id ASC LIMIT 5";
        return jdbcTemplate.queryForList(sql);
    }

    // Top 5 Transport Options
    public List<Map<String, Object>> getTop5Transports() {
        String sql = "SELECT * FROM transport ORDER BY id ASC LIMIT 5";
        return jdbcTemplate.queryForList(sql);
    }

    // Top 5 Activities
    public List<Map<String, Object>> getTop5Activities() {
        String sql = "SELECT * FROM activity ORDER BY id ASC LIMIT 5";
        return jdbcTemplate.queryForList(sql);
    }

    // --- 3. RECENT REGISTERED USERS ---
    public List<Map<String, Object>> getRecentUsers() {
        String sql = "SELECT * FROM users ORDER BY id DESC LIMIT 5";
        return jdbcTemplate.queryForList(sql);
    }

    // --- 4. RECENT USER PREFERENCES ---
    public List<Map<String, Object>> getRecentUserPreferences() {
        String sql = "SELECT up.*, u.full_name, u.email " +
                     "FROM user_prefrence up " +
                     "LEFT JOIN users u ON up.user_id = u.id " +
                     "ORDER BY up.id DESC LIMIT 5";
        return jdbcTemplate.queryForList(sql);
    }

    // Helper method to catch missing table or null errors safely
    private int queryForIntSafely(String sql) {
        try {
            Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
            return count != null ? count : 0;
        } catch (Exception e) {
            return 0;
        }
    }
}