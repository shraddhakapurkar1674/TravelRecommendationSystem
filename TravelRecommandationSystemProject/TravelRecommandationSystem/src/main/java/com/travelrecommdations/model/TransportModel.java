package com.travelrecommdations.model;

public class TransportModel {

    private int transportId;
    private String destination;
    private String transportType;
    private String transportProvider;
    private String pricingType;
    private Double pricingValue;
    private String facilities;
    private Double facilityCharge;

    // Default Constructor
    public TransportModel() {}

    // Parameterized Constructor
    public TransportModel(int transportId, String destination, String transportType, 
                          String transportProvider, String pricingType, Double pricingValue, 
                          String facilities, Double facilityCharge) {
        this.transportId = transportId;
        this.destination = destination;
        this.transportType = transportType;
        this.transportProvider = transportProvider;
        this.pricingType = pricingType;
        this.pricingValue = pricingValue;
        this.facilities = facilities;
        this.facilityCharge = facilityCharge;
    }

    // Getters and Setters
    public int getTransportId() {
        return transportId;
    }

    public void setTransportId(int transportId) {
        this.transportId = transportId;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getTransportType() {
        return transportType;
    }

    public void setTransportType(String transportType) {
        this.transportType = transportType;
    }

    public String getTransportProvider() {
        return transportProvider;
    }

    public void setTransportProvider(String transportProvider) {
        this.transportProvider = transportProvider;
    }

    public String getPricingType() {
        return pricingType;
    }

    public void setPricingType(String pricingType) {
        this.pricingType = pricingType;
    }

    public Double getPricingValue() {
        return pricingValue;
    }

    public void setPricingValue(Double pricingValue) {
        this.pricingValue = pricingValue;
    }

    public String getFacilities() {
        return facilities;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }

    public Double getFacilityCharge() {
        return facilityCharge;
    }

    public void setFacilityCharge(Double facilityCharge) {
        this.facilityCharge = facilityCharge;
    }
}