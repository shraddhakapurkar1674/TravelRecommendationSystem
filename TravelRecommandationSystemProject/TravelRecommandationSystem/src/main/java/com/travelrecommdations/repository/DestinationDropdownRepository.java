package com.travelrecommdations.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DestinationDropdownRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getAllDestinations() {

        String sql =
                "SELECT id, name " +
                "FROM destination " +
                "ORDER BY name ASC";

        return jdbcTemplate.queryForList(sql);
    }
}