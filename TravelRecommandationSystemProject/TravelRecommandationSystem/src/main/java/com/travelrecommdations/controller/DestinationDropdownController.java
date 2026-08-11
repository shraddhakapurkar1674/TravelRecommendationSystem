package com.travelrecommdations.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.travelrecommdations.repository.DestinationDropdownRepository;

@RestController
@RequestMapping("/api/admin/destinations")
@CrossOrigin(origins = "*")
public class DestinationDropdownController {

    @Autowired
    private DestinationDropdownRepository destinationRepository;

    @GetMapping
    public ResponseEntity<?> getDestinations() {

        try {

            List<Map<String, Object>> destinations =
                    destinationRepository.getAllDestinations();

            return ResponseEntity.ok(destinations);

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .internalServerError()
                    .body(Map.of(
                            "error",
                            "Failed to load destinations: "
                                    + e.getMessage()
                    ));
        }
    }
}