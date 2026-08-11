package com.travelrecommdations.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travelrecommdations.model.ActivityModel;
import com.travelrecommdations.repository.ActivityRepository;

@Service
public class ActivityService {

    @Autowired
    private ActivityRepository activityRepository;

    public void addActivity(ActivityModel activity) {
        activityRepository.save(activity);
    }

    public List<ActivityModel> getAllActivities() {
        return activityRepository.findAllWithDestination();
    }

    public List<ActivityModel> getActivitiesPaginated(int page, int size) {
        return activityRepository.findPaginated(page, size);
    }

    public int getTotalActivityCount() {
        return activityRepository.getTotalCount();
    }

    public ActivityModel getActivityById(int id) {
        return activityRepository.findById(id);
    }

    public List<ActivityModel> getActiveActivitiesByDestination(int destinationId) {
        return activityRepository.findActiveByDestinationId(destinationId);
    }

    public List<String> getActivityCategoriesForDestination(int destinationId) {
        return activityRepository.findCategoriesByDestinationId(destinationId);
    }

    public void updateActivity(ActivityModel activity) {
        activityRepository.update(activity);
    }

    public void deleteActivity(int id) {
        activityRepository.deleteById(id);
    }
}