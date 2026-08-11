package com.travelrecommdations.controller;

import com.travelrecommdations.model.Hotel;
import com.travelrecommdations.serviceImpl.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/hotels")
@CrossOrigin(origins = "*")
public class HotelController {

    @Autowired
    private HotelService hotelService; // Clean architecture: Inject Service instead of Repository

    // 1. GET: http://localhost:8091/api/hotels
    @GetMapping
    public List<Object> getAllHotels() {
        return hotelService.getAllHotels();
    }

    // 2. POST: http://localhost:8091/api/hotels/upload
    @PostMapping("/upload")
    public String saveOrUpdateHotel(
            @RequestParam(value = "id", required = false) Long id,
            @RequestParam("destinationId") Long destinationId,
            @RequestParam("hotelName") String hotelName,
            @RequestParam("location") String location,
            @RequestParam(value = "rating", defaultValue = "0.0") Double rating,
            @RequestParam(value = "pricePerNight", defaultValue = "0.0") Double pricePerNight,
            @RequestParam(value = "contactNumber", defaultValue = "") String contactNumber,
            @RequestParam(value = "description", defaultValue = "") String description,
            @RequestParam(value = "existingImage", required = false) String existingImage,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile) {

        return hotelService.saveOrUpdateHotel(
                id, destinationId, hotelName, location, 
                rating, pricePerNight, contactNumber, 
                description, existingImage, imageFile
        );
    }

    // 3. DELETE: http://localhost:8091/api/hotels/{id}
    @DeleteMapping("/{id}")
    public String deleteHotel(@PathVariable Long id) {
        return hotelService.deleteHotel(id);
    }
    
    
 // POST: http://localhost:8091/api/hotels/json
    @PostMapping("/json")
    public String addHotelViaJson(@RequestBody Hotel hotel) {
        return hotelService.saveOrUpdateHotel(
                hotel.getId(),
                hotel.getDestinationId(),
                hotel.getHotelName(),
                hotel.getLocation(),
                hotel.getRating(),
                hotel.getPricePerNight(),
                hotel.getContactNumber(),
                hotel.getDescription(),
                hotel.getImage(),
                null 
        );
    }
}