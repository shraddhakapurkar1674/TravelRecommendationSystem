package com.travelrecommdations.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.travelrecommdations.model.DestinationModel;

@Repository
public class DestinationRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public String addDestination(DestinationModel model) {

        String sql = "insert into destination(destination_name,state,country,category,budget,best_season,description,image,status) values(?,?,?,?,?,?,?,?,?)";

        int value = jdbcTemplate.update(sql,

                model.getDestinationName(),
                model.getState(),
                model.getCountry(),
                model.getCategory(),
                model.getBudget(),
                model.getBestSeason(),
                model.getDescription(),
                model.getImage(),
                model.getStatus());

        if (value > 0) {
            return "Destination Added Successfully";
        }

        return "Destination Not Added";
    }

    public List<DestinationModel> getAllDestination() {

        String sql = "select * from destination";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            DestinationModel d = new DestinationModel();

            d.setId(rs.getLong("id"));
            d.setDestinationName(rs.getString("destination_name"));
            d.setState(rs.getString("state"));
            d.setCountry(rs.getString("country"));
            d.setCategory(rs.getString("category"));
            d.setBudget(rs.getDouble("budget"));
            d.setBestSeason(rs.getString("best_season"));
            d.setDescription(rs.getString("description"));
            d.setImage(rs.getString("image"));
            d.setStatus(rs.getString("status"));

            return d;

        });

    }

}