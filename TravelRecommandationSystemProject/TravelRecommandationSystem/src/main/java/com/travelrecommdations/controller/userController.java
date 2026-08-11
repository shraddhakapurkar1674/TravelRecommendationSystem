package com.travelrecommdations.controller;

import com.travelrecommdations.model.user;
import com.travelrecommdations.repository.userRepo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(
    origins = "http://localhost:8088", 
    allowCredentials = "true", 
    allowedHeaders = "*", 
    methods = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE, RequestMethod.OPTIONS}
)
public class userController {

    @Autowired
    private userRepo userRepo;

    // LOGIN (Admin & User)
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> loginData, HttpServletRequest request) {

        String email = loginData.get("email") != null ? loginData.get("email").trim().toLowerCase() : "";
        String password = loginData.get("password") != null ? loginData.get("password").trim() : "";

        System.out.println("--> Received Login Request for Email: '" + email + "' with Password: '" + password + "'");

        Optional<user> userOpt = userRepo.findByEmail(email);

        if (userOpt.isEmpty()) {
            System.out.println("--> ERROR: Email not found in DB!");
            Map<String, String> error = new HashMap<>();
            error.put("message", "Invalid email or password!");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(error);
        }

        user userObj = userOpt.get();
        System.out.println("--> Found User in DB: " + userObj.getEmail() + " | DB Password: '" + userObj.getPassword() + "'");

        // Plain Text Password Check
        if (!userObj.getPassword().equals(password)) {
            System.out.println("--> ERROR: Password mismatch!");
            Map<String, String> error = new HashMap<>();
            error.put("message", "Invalid email or password!");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(error);
        }

        // Store logged-in user in session
        HttpSession session = request.getSession(true);
        session.setAttribute("currentUser", userObj);

        Map<String, Object> response = new HashMap<>();
        response.put("message", "Login successful!");
        response.put("user", userObj);

        return ResponseEntity.ok(response);
    }    // REGISTER
    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody user newUser) {

        if (userRepo.findByEmail(newUser.getEmail().trim().toLowerCase()).isPresent()) {
            Map<String, String> error = new HashMap<>();
            error.put("message", "Email is already registered!");
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(error);
        }

        newUser.setPassword(newUser.getPassword().trim());
        newUser.setEmail(newUser.getEmail().trim().toLowerCase());

        if (newUser.getRole() == null || newUser.getRole().isEmpty()) {
            newUser.setRole("ROLE_USER");
        }

        userRepo.save(newUser);

        Map<String, String> response = new HashMap<>();
        response.put("message", "User registered successfully!");
        return ResponseEntity.ok(response);
    }

    // LOGOUT
    @GetMapping("/logout")
    public ResponseEntity<?> logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return ResponseEntity.ok("Logged out successfully");
    }
}