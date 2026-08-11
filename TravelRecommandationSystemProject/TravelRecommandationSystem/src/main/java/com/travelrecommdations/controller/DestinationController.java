package com.travelrecommdations.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.travelrecommdations.model.Destination;
import com.travelrecommdations.repository.DestinationDao;

import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/destinations")
@CrossOrigin(origins = "http://localhost:8088") // Cross-origin Access
public class DestinationController {

    @Autowired
    private DestinationDao destinationDao;

    // 1. GET: http://localhost:8091/api/destinations
    @GetMapping
    public List<Object> getAllDestinations() {
        return destinationDao.getAllDestinations();
    }

    // 2. POST: http://localhost:8091/api/destinations/upload (Image file + Form Data)
    @PostMapping("/upload")
    public String saveOrUpdateDestinationWithImage(
            @RequestParam(value = "id", required = false) Long id,
            @RequestParam("destinationName") String destinationName,
            @RequestParam("state") String state,
            @RequestParam("country") String country,
            @RequestParam("category") String category,
            @RequestParam(value = "budget", defaultValue = "0.0") Double budget,
            @RequestParam(value = "bestSeason", defaultValue = "") String bestSeason,
            @RequestParam(value = "description", defaultValue = "") String description,
            @RequestParam(value = "existingImage", required = false) String existingImage,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile) {

        try {
            // जर जुनी इमेज असेल तर तीच ठेवा, नसेल तर default path
            String dbImagePath = (existingImage != null && !existingImage.trim().isEmpty()) ? existingImage : "images/default.jpg";

            // जर युजरने नवीन इमेज फाइल सेलेक्ट केली असेल:
            if (imageFile != null && !imageFile.isEmpty()) {
                String uploadDir = System.getProperty("user.dir") + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + "images" + File.separator;
                
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs(); // फोल्डर नसल्यास बनवेल
                }

                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename().replaceAll("[^a-zA-Z0-9.-]", "_");
                File destinationFile = new File(uploadDir + fileName);

                imageFile.transferTo(destinationFile); // फाईल फोल्डरमध्ये सेव्ह केली
                dbImagePath = "images/" + fileName; // डेटाबेससाठी path
            }

            Destination destination = new Destination();
            if (id != null && id > 0) {
                destination.setId(id);
            }
            destination.setDestinationName(destinationName);
            destination.setState(state);
            destination.setCountry(country);
            destination.setCategory(category);
            destination.setBudget(budget);
            destination.setBestSeason(bestSeason);
            destination.setDescription(description);
            destination.setImage(dbImagePath);
            destination.setStatus("Active");

            if (id != null && id > 0) {
                // UPDATE
                int result = destinationDao.updateDestination(destination);
                return result > 0 ? "Destination updated successfully!" : "Failed to update destination.";
            } else {
                // INSERT
                int result = destinationDao.addDestination(destination);
                return result > 0 ? "Destination added successfully!" : "Failed to add destination.";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "Server Error: " + e.getMessage();
        }
    }

    // 3. DELETE: http://localhost:8091/api/destinations/{id}
    @DeleteMapping("/{id}")
    public String deleteDestination(@PathVariable Long id) {
        int result = destinationDao.deleteDestination(id);
        return result > 0 ? "Destination deleted successfully!" : "Failed to delete destination.";
    }
}