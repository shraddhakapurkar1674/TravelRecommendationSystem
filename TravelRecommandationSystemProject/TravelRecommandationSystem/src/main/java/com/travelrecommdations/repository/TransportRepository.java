package com.travelrecommdations.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.travelrecommdations.model.TransportModel;

import java.util.List;

@Repository
public class TransportRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<TransportModel> rowMapper = (rs, rowNum) -> new TransportModel(
            rs.getInt("transport_id"),
            rs.getString("destination"),
            rs.getString("transport_type"),
            rs.getString("transport_provider"),
            rs.getString("pricing_type"),
            rs.getDouble("pricing_value"),
            rs.getString("facilities"),
            rs.getDouble("facility_charge")
    );

    public int save(TransportModel transport) {
        String sql = "INSERT INTO transport (destination, transport_type, transport_provider, pricing_type, pricing_value, facilities, facility_charge) VALUES (?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                transport.getDestination(),
                transport.getTransportType(),
                transport.getTransportProvider(),
                transport.getPricingType(),
                transport.getPricingValue() != null ? transport.getPricingValue() : 0.0,
                transport.getFacilities() != null ? transport.getFacilities() : "",
                transport.getFacilityCharge() != null ? transport.getFacilityCharge() : 0.0);
    }

    public List<TransportModel> findAll() {
        String sql = "SELECT * FROM transport ORDER BY transport_id DESC";
        return jdbcTemplate.query(sql, rowMapper);
    }

    public List<TransportModel> findPaginated(int page, int size) {
        int offset = page * size;
        String sql = "SELECT * FROM transport ORDER BY transport_id DESC LIMIT ? OFFSET ?";
        return jdbcTemplate.query(sql, rowMapper, size, offset);
    }

    public int getTotalCount() {
        String sql = "SELECT COUNT(*) FROM transport";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
        return (count != null) ? count : 0;
    }

    public TransportModel findById(int id) {
        String sql = "SELECT * FROM transport WHERE transport_id = ?";
        List<TransportModel> list = jdbcTemplate.query(sql, rowMapper, id);
        return list.isEmpty() ? null : list.get(0);
    }

    public int update(TransportModel transport) {
        String sql = "UPDATE transport SET destination=?, transport_type=?, transport_provider=?, pricing_type=?, pricing_value=?, facilities=?, facility_charge=? WHERE transport_id=?";
        return jdbcTemplate.update(sql,
                transport.getDestination(),
                transport.getTransportType(),
                transport.getTransportProvider(),
                transport.getPricingType(),
                transport.getPricingValue() != null ? transport.getPricingValue() : 0.0,
                transport.getFacilities() != null ? transport.getFacilities() : "",
                transport.getFacilityCharge() != null ? transport.getFacilityCharge() : 0.0,
                transport.getTransportId());
    }

    public int deleteById(int id) {
        String sql = "DELETE FROM transport WHERE transport_id = ?";
        return jdbcTemplate.update(sql, id);
    }
}