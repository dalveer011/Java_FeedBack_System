package com.project.model;

public class Course {
	private String id;
	private String coursenum;
	private String coursedescription;
	private String teacherid;
	private String active;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCourseNum() {
		return coursenum;
	}
	public void setCourseNum(String courseNum) {
		this.coursenum = courseNum;
	}
	public String getCourseDescription() {
		return coursedescription;
	}
	public void setCourseDescription(String courseDescription) {
		this.coursedescription = courseDescription;
	}
	public String getTeacherId() {
		return teacherid;
	}
	public void setTeacherId(String teacherId) {
		this.teacherid = teacherId;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	
}
