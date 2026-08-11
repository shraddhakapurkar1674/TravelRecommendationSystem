package com.travelrecommdations.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelrecommdations.model.TransportModel;
import com.travelrecommdations.repository.TransportRepository;

@Service
public class TransportService {

    @Autowired
    private TransportRepository transportRepository;

    public void addTransport(TransportModel transport) {
        transportRepository.save(transport);
    }

    public List<TransportModel> getAllTransports() {
        return transportRepository.findAll();
    }

    public List<TransportModel> getTransportsPaginated(int page, int size) {
        return transportRepository.findPaginated(page, size);
    }

    public int getTotalTransportCount() {
        return transportRepository.getTotalCount();
    }

    public TransportModel getTransportById(int id) {
        return transportRepository.findById(id);
    }

    public void updateTransport(TransportModel transport) {
        transportRepository.update(transport);
    }

    public void deleteTransport(int id) {
        transportRepository.deleteById(id);
    }
}