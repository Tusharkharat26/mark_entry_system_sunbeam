package com.sunbeam.mark.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunbeam.mark.pojo.Course;
import com.sunbeam.mark.repository.CourseRepository;

@Service
public class CourseService {
	 @Autowired
	    private CourseRepository courseRepository;

	    public List<Course> getAllCourses() {
	        return courseRepository.findAll();
	    }

	    public Course getCourseById(int id) {
	        return courseRepository.findById(id).orElse(null);
	    }

	    public Course addCourse(Course course) {
	        return courseRepository.save(course);
	    }

	    public Course updateCourse(int id, Course course) {
	        Optional<Course> existing = courseRepository.findById(id);
	        if (existing.isPresent()) {
	            Course updated = existing.get();
	            updated.setCourse_name(course.getCourse_name());
	            return courseRepository.save(updated);
	        }
	        return null;
	    }

	    public void deleteCourse(int id) {
	        courseRepository.deleteById(id);
	    }

}
