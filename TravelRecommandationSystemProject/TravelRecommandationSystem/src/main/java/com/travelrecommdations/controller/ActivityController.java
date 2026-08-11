package com.travelrecommdations.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.travelrecommdations.model.ActivityModel;
import com.travelrecommdations.serviceImpl.ActivityService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/admin/activities")
@CrossOrigin(origins = "*")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @PostMapping
    public ResponseEntity<Map<String, String>> createActivity(@RequestBody ActivityModel activity) {
        try {
            if (activity.getPrice() != null && activity.getPrice() < 0) {
                Map<String, String> error = new HashMap<>();
                error.put("error", "Price cannot be negative");
                return ResponseEntity.badRequest().body(error);
            }
            activityService.addActivity(activity);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Activity saved successfully!");
            return ResponseEntity.status(HttpStatus.CREATED).body(response);
        } catch (Exception e) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "Failed to save activity: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
        }
    }

    @GetMapping
    public ResponseEntity<List<ActivityModel>> getAllActivities() {
        return ResponseEntity.ok(activityService.getAllActivities());
    }

    @GetMapping("/page")
    public ResponseEntity<Map<String, Object>> getActivitiesPaginated(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size) {

        List<ActivityModel> activities = activityService.getActivitiesPaginated(page, size);
        int totalItems = activityService.getTotalActivityCount();
        int totalPages = size > 0 ? (int) Math.ceil((double) totalItems / size) : 0;

        Map<String, Object> response = new HashMap<>();
        response.put("activities", activities);
        response.put("currentPage", page);
        response.put("totalItems", totalItems);
        response.put("totalPages", totalPages);
        response.put("pageSize", size);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<ActivityModel> getActivityById(@PathVariable int id) {
        ActivityModel activity = activityService.getActivityById(id);
        if (activity == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(activity);
    }

    @GetMapping("/destination/{destinationId}")
    public ResponseEntity<List<ActivityModel>> getActivitiesByDestination(@PathVariable int destinationId) {
        return ResponseEntity.ok(activityService.getActiveActivitiesByDestination(destinationId));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Map<String, String>> updateActivity(@PathVariable int id, @RequestBody ActivityModel activity) {
        try {
            if (activity.getPrice() != null && activity.getPrice() < 0) {
                Map<String, String> error = new HashMap<>();
                error.put("error", "Price cannot be negative");
                return ResponseEntity.badRequest().body(error);
            }
            activity.setActivityId(id);
            activityService.updateActivity(activity);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Activity updated successfully!");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "Failed to update activity: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Map<String, String>> deleteActivity(@PathVariable int id) {
        try {
            activityService.deleteActivity(id);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Activity deleted successfully!");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "Failed to delete activity: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
        }
    }
}