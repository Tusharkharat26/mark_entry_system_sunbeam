package com.sunbeam.mark.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sunbeam.mark.pojo.Group;

public interface GroupRepository extends JpaRepository<Group, Integer>{
	List<Group> findByCourse_CourseId(Integer courseId);

}
