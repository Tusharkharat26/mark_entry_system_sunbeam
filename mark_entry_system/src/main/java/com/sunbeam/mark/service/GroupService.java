package com.sunbeam.mark.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sunbeam.mark.dao.GroupRepository;
import com.sunbeam.mark.pojo.Group;

@Service
public class GroupService {
	 private final GroupRepository groupRepository;

	    public GroupService(GroupRepository groupRepository) {
	        this.groupRepository = groupRepository;
	    }

	    public List<Group> getAllGroups() {
	        return groupRepository.findAll();
	    }

	    public Group getGroupById(Integer id) {
	        return groupRepository.findById(id).orElse(null);
	    }

	    public Group saveGroup(Group group) {
	        return groupRepository.save(group);
	    }

	    public void deleteGroup(Integer id) {
	        groupRepository.deleteById(id);
	    }

	    public List<Group> getGroupsByCourseId(Integer courseId) {
	        return groupRepository.findByCourse_CourseId(courseId);
	    }

}
