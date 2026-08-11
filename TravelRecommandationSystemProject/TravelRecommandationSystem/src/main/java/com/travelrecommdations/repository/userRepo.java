package com.travelrecommdations.repository;

import com.travelrecommdations.model.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

@Repository
public class userRepo {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // RowMapper to map DB rows directly to the User object
    private final RowMapper<user> userRowMapper = new RowMapper<user>() {
        @Override
        public user mapRow(ResultSet rs, int rowNum) throws SQLException {
            user user = new user();
            user.setId(rs.getLong("id"));
            user.setFullName(rs.getString("full_name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            return user;
        }
    };

    // Find User by Email
 // Find User by Email (Case-Insensitive)
    public Optional<user> findByEmail(String email) {
        String sql = "SELECT * FROM users WHERE LOWER(email) = LOWER(?)";
        return jdbcTemplate.query(sql, userRowMapper, email).stream().findFirst();
    }
   
    // Save New User
    public int save(user user) {
        String sql = "INSERT INTO users (full_name, email, password, role) VALUES (?, ?, ?, ?)";
        return jdbcTemplate.update(sql, user.getFullName(), user.getEmail(), user.getPassword(), user.getRole());
    }

    // Optional: Find User by ID
    public Optional<user> findById(Long id) {
        String sql = "SELECT * FROM users WHERE id = ?";
        return jdbcTemplate.query(sql, userRowMapper, id).stream().findFirst();
    }
}