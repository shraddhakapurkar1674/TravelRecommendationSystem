package com.travelrecommdations.model;



public class DashboardModel {

    private int users;
    private int destination;
    private int hotel;
    private int booking;

    public DashboardModel() {
    }

    public DashboardModel(int users, int destination, int hotel, int booking) {
        this.users = users;
        this.destination = destination;
        this.hotel = hotel;
        this.booking = booking;
    }

    public int getUsers() {
        return users;
    }

    public void setUsers(int users) {
        this.users = users;
    }

    public int getDestination() {
        return destination;
    }

    public void setDestination(int destination) {
        this.destination = destination;
    }

    public int getHotel() {
        return hotel;
    }

    public void setHotel(int hotel) {
        this.hotel = hotel;
    }

    public int getBooking() {
        return booking;
    }

    public void setBooking(int booking) {
        this.booking = booking;
    }
}
