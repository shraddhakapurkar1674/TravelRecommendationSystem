package com.travelrecommdations.controller;

import com.travelrecommdations.serviceImpl.DashboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/admin/dashboard")
@CrossOrigin(origins = "http://localhost:8088")
public class AdminDashboardController {

    @Autowired
    private DashboardService dashboardService;

    @GetMapping("/stats")
    public ResponseEntity<Map<String, Object>> getDashboardStats() {
        // Change return type to Map and call getDashboardData()
        Map<String, Object> stats = dashboardService.getDashboardData();
        return ResponseEntity.ok(stats);
    }
}