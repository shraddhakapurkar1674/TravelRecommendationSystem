package com.travelrecommdations.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.travelrecommdations.model.TransportModel;
import com.travelrecommdations.serviceImpl.TransportService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/admin/transports")
@CrossOrigin(origins = "*")
public class TransportController {

    @Autowired
    private TransportService transportService;

    @PostMapping
    public ResponseEntity<Map<String, String>> createTransport(@RequestBody TransportModel transport) {
        try {
            transportService.addTransport(transport);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Transport saved successfully!");
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        } catch (Exception e) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "Failed to save transport: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
        }
    }

    @GetMapping
    public ResponseEntity<List<TransportModel>> getAllTransports() {
        return ResponseEntity.ok(transportService.getAllTransports());
    }

    @GetMapping("/page")
    public ResponseEntity<Map<String, Object>> getTransportsPaginated(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size) {

        List<TransportModel> transports = transportService.getTransportsPaginated(page, size);
        int totalItems = transportService.getTotalTransportCount();
        int totalPages = (int) Math.ceil((double) totalItems / size);

        Map<String, Object> response = new HashMap<>();
        response.put("transports", transports);
        response.put("currentPage", page);
        response.put("totalItems", totalItems);
        response.put("totalPages", totalPages);
        response.put("pageSize", size);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TransportModel> getTransportById(@PathVariable int id) {
        TransportModel transport = transportService.getTransportById(id);
        if (transport == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(transport);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Map<String, String>> updateTransport(@PathVariable int id, @RequestBody TransportModel transport) {
        try {
            transport.setTransportId(id);
            transportService.updateTransport(transport);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Transport updated successfully!");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "Failed to update transport: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, String>> deleteTransport(@PathVariable int id) {
        try {
            transportService.deleteTransport(id);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Transport deleted successfully!");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "Failed to delete transport: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
        }
    }
}