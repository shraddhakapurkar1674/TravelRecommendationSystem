package com.travelrecommdations.serviceImpl;

import com.travelrecommdations.model.Hotel;
import com.travelrecommdations.repository.HotelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Service
public class HotelService {

    @Autowired
    private HotelRepository hotelRepository;

    // 1. Fetch All Hotels
    public List<Object> getAllHotels() {
        return hotelRepository.getAllHotels();
    }

    // 2. Business Logic for Save / Update Hotel with Image Upload
    public String saveOrUpdateHotel(Long id, Long destinationId, String hotelName, String location,
                                     Double rating, Double pricePerNight, String contactNumber,
                                     String description, String existingImage, MultipartFile imageFile) {
        try {
           
            String dbImagePath = (existingImage != null && !existingImage.trim().isEmpty()) 
                                 ? existingImage 
                                 : "images/default_hotel.jpg";

            
            if (imageFile != null && !imageFile.isEmpty()) {
                String uploadDir = System.getProperty("user.dir") 
                        + File.separator + "src" 
                        + File.separator + "main" 
                        + File.separator + "webapp" 
                        + File.separator + "images" 
                        + File.separator;

                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs(); // फोल्डर नसल्यास तयार करणे
                }

                String fileName = System.currentTimeMillis() + "_" 
                        + imageFile.getOriginalFilename().replaceAll("[^a-zA-Z0-9.-]", "_");
                File destinationFile = new File(uploadDir + fileName);

                imageFile.transferTo(destinationFile); // फाईल फोल्डरमध्ये सेव्ह करणे
                dbImagePath = "images/" + fileName;
            }

            // Hotel Object तयार करणे
            Hotel hotel = new Hotel();
            if (id != null && id > 0) {
                hotel.setId(id);
            }
            hotel.setDestinationId(destinationId);
            hotel.setHotelName(hotelName);
            hotel.setLocation(location);
            hotel.setRating(rating);
            hotel.setPricePerNight(pricePerNight);
            hotel.setContactNumber(contactNumber);
            hotel.setDescription(description);
            hotel.setImage(dbImagePath);
            hotel.setStatus("Active");

            
            if (id != null && id > 0) {
                int result = hotelRepository.updateHotel(hotel);
                return result > 0 ? "Hotel updated successfully!" : "Failed to update hotel.";
            } else {
                int result = hotelRepository.addHotel(hotel);
                return result > 0 ? "Hotel added successfully!" : "Failed to add hotel.";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "Server Error: " + e.getMessage();
        }
    }

    // 3. Delete Hotel
    public String deleteHotel(Long id) {
        int result = hotelRepository.deleteHotel(id);
        return result > 0 ? "Hotel deleted successfully!" : "Failed to delete hotel.";
    }
}