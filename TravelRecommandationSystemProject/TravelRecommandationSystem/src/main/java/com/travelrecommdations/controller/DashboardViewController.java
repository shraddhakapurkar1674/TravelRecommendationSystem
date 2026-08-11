package com.travelrecommdations.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.travelrecommdations.serviceImpl.DashboardService;

@Controller
public class DashboardViewController {

    @Autowired
    private DashboardService dashboardService;

    // Default Dashboard Page
    @GetMapping("/adminDashboard")
    public String showAdminDashboard(Model model) {
        model.addAttribute("dashboard", dashboardService.getDashboardData());
        model.addAttribute("activePage", "dashboard");
        return "adminDashboard";
    }

    // Destinations Page
    @GetMapping("/admin/destinations")
    public String showDestinationsPage(Model model) {
        model.addAttribute("activePage", "destinations");
        return "destinations";
    }

    // Bookings Page
    @GetMapping("/admin/bookings")
    public String showBookingsPage(Model model) {
        model.addAttribute("activePage", "bookings");
        return "bookings";
    }

    // Users Page
    @GetMapping("/admin/users")
    public String showUsersPage(Model model) {
        model.addAttribute("activePage", "users");
        return "users";
    }
}