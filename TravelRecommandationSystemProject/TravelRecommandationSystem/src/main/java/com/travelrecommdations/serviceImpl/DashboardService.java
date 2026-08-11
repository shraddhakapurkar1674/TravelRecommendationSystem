package com.travelrecommdations.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DashboardService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Map<String, Object> getDashboardData() {
        Map<String, Object> data = new HashMap<>();

        // 1. Metric Counts
        data.put("totalUsers", getCount("SELECT COUNT(*) FROM user"));
        data.put("totalDestinations", getCount("SELECT COUNT(*) FROM destinations"));
        data.put("totalHotels", getCount("SELECT COUNT(*) FROM hotels"));
        data.put("totalTransport", getCount("SELECT COUNT(*) FROM transports"));
        data.put("totalActivities", getCount("SELECT COUNT(*) FROM activities"));
        data.put("totalReviews", getCount("SELECT COUNT(*) FROM reviews"));

        data.put("totalBookings", getCount("SELECT COUNT(*) FROM bookings"));
        data.put("confirmedBookings", getCount("SELECT COUNT(*) FROM bookings WHERE LOWER(status) = 'confirmed'"));
        data.put("pendingBookings", getCount("SELECT COUNT(*) FROM bookings WHERE LOWER(status) = 'pending'"));

        // 2. Rankings & Data Lists
        data.put("topDestinations", fetchList("SELECT name, rating, views FROM destinations ORDER BY views DESC LIMIT 5"));
        data.put("topHotels", fetchList("SELECT name, rating, bookings_count AS bookings FROM hotels ORDER BY bookings_count DESC LIMIT 5"));
        data.put("topTransport", fetchList("SELECT name, rating, bookings_count AS bookings FROM transports ORDER BY bookings_count DESC LIMIT 5"));
        data.put("topActivities", fetchList("SELECT name, rating, bookings_count AS bookings FROM activities ORDER BY bookings_count DESC LIMIT 5"));

        // 3. Feeds
        data.put("recentReviews", fetchList("SELECT user_name AS user, location, comment, created_at AS date FROM reviews ORDER BY id DESC LIMIT 5"));
        data.put("recentUsers", fetchList("SELECT name, email, created_at AS date FROM user ORDER BY id DESC LIMIT 5"));
        data.put("latestBookings", fetchList("SELECT id, user_name AS user, destination, booking_date AS date, amount, status FROM bookings ORDER BY id DESC LIMIT 5"));

        return data;
    }

    private long getCount(String sql) {
        try {
            Long count = jdbcTemplate.queryForObject(sql, Long.class);
            return count != null ? count : 0;
        } catch (Exception e) {
            return 0;
        }
    }

    private List<Map<String, Object>> fetchList(String sql) {
        try {
            return jdbcTemplate.queryForList(sql);
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }
}