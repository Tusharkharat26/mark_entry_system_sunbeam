package com.sunbeam.mark.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sunbeam.mark.pojo.Course;

public interface CourseRepository extends  JpaRepository<Course, Integer>{

}
