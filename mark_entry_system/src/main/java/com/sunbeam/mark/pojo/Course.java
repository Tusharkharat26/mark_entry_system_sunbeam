package com.sunbeam.mark.pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name ="courses")
public class Course {
	@Id
	@Column(name = "course_id")
	private int courseId;
	
	private String course_name;

	public int getCourse_id() {
		 return courseId;
	}

	public void setCourse_id(int course_id) {
		this.courseId = courseId;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", course_name=" + course_name + "]";
	}
  
	
}
