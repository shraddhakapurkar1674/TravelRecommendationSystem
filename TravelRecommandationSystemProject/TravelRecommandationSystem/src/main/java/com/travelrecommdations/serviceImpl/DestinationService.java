package com.travelrecommdations.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelrecommdations.model.DestinationModel;
import com.travelrecommdations.repository.DestinationRepository;

@Service
public class DestinationService {

    @Autowired
    DestinationRepository repository;

    public String addDestination(DestinationModel model) {

        return repository.addDestination(model);

    }

    public List<DestinationModel> getAllDestination() {

        return repository.getAllDestination();

    }

}