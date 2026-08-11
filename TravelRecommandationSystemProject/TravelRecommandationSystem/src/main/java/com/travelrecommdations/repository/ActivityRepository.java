package com.travelrecommdations.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.travelrecommdations.model.ActivityModel;

import java.math.BigDecimal;
import java.util.List;

@Repository
public class ActivityRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<ActivityModel> rowMapper = (rs, rowNum) -> {
        ActivityModel model = new ActivityModel();
        
        model.setActivityId(rs.getInt("activity_id"));
        
        // Handle BIGINT safely from DB to Integer in Java
        long destId = rs.getLong("destination_id");
        model.setDestinationId((int) destId);

        // Safe destination_name lookup from SQL JOIN
        try {
            String destName = rs.getString("destination_name");
            model.setDestinationName(destName != null ? destName : "N/A");
        } catch (Exception e) {
            model.setDestinationName("N/A");
        }

        model.setActivityName(rs.getString("activity_name"));
        model.setCategory(rs.getString("category"));
        model.setDescription(rs.getString("description"));

        // Safe Double/Decimal mapping
        BigDecimal priceVal = rs.getBigDecimal("price");
        model.setPrice(priceVal != null ? priceVal.doubleValue() : 0.0);

        model.setDuration(rs.getString("duration"));
        model.setImage(rs.getString("image"));
        model.setStatus(rs.getString("status") != null ? rs.getString("status") : "Active");

        return model;
    };

    public int save(ActivityModel activity) {
        String sql = "INSERT INTO activity (destination_id, activity_name, category, description, price, duration, image, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                activity.getDestinationId(),
                activity.getActivityName(),
                activity.getCategory(),
                activity.getDescription(),
                activity.getPrice() != null ? activity.getPrice() : 0.0,
                activity.getDuration(),
                activity.getImage(),
                activity.getStatus() != null ? activity.getStatus() : "Active"
        );
    }

    public List<ActivityModel> findAllWithDestination() {
        String sql = "SELECT a.*, d.destination_name AS destination_name " +
                     "FROM activity a " +
                     "LEFT JOIN destination d ON a.destination_id = d.destination_id " +
                     "ORDER BY a.activity_id DESC";
        return jdbcTemplate.query(sql, rowMapper);
    }

    public List<ActivityModel> findPaginated(int page, int size) {
        int offset = page * size;
        String sql = "SELECT a.*, d.destination_name AS destination_name " +
                     "FROM activity a " +
                     "LEFT JOIN destination d ON a.destination_id = d.destination_id " +
                     "ORDER BY a.activity_id DESC LIMIT ? OFFSET ?";
        return jdbcTemplate.query(sql, rowMapper, size, offset);
    }

    public int getTotalCount() {
        String sql = "SELECT COUNT(*) FROM activity";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
        return (count != null) ? count : 0;
    }

    public ActivityModel findById(int id) {
        String sql = "SELECT a.*, d.destination_name AS destination_name " +
                     "FROM activity a " +
                     "LEFT JOIN destination d ON a.destination_id = d.destination_id " +
                     "WHERE a.activity_id = ?";
        List<ActivityModel> list = jdbcTemplate.query(sql, rowMapper, id);
        return list.isEmpty() ? null : list.get(0);
    }

    public List<ActivityModel> findActiveByDestinationId(int destinationId) {
        String sql = "SELECT a.*, d.destination_name AS destination_name " +
                     "FROM activity a " +
                     "LEFT JOIN destination d ON a.destination_id = d.destination_id " +
                     "WHERE a.destination_id = ? AND a.status = 'Active'";
        return jdbcTemplate.query(sql, rowMapper, destinationId);
    }

    public List<String> findCategoriesByDestinationId(int destinationId) {
        String sql = "SELECT DISTINCT category FROM activity WHERE destination_id = ? AND status = 'Active'";
        return jdbcTemplate.queryForList(sql, String.class, destinationId);
    }

    public int update(ActivityModel activity) {
        String sql = "UPDATE activity SET destination_id = ?, activity_name = ?, category = ?, description = ?, price = ?, duration = ?, image = ?, status = ? " +
                     "WHERE activity_id = ?";
        return jdbcTemplate.update(sql,
                activity.getDestinationId(),
                activity.getActivityName(),
                activity.getCategory(),
                activity.getDescription(),
                activity.getPrice() != null ? activity.getPrice() : 0.0,
                activity.getDuration(),
                activity.getImage(),
                activity.getStatus(),
                activity.getActivityId()
        );
    }

    public int deleteById(int id) {
        String sql = "DELETE FROM activity WHERE activity_id = ?";
        return jdbcTemplate.update(sql, id);
    }
}