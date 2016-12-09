package com.project.model;

public class Student {
private String studentNumber;
private String phone;
private String salt;
private String firstName;
private String lastName;
private String email;
private String password;
private String[] courseIds;
public String[] getCourseIds() {
	return courseIds;
}
public void setCourseIds(String[] courseIds) {
	this.courseIds = courseIds;
}
private int active;
public String getStudentNumber() {
	return studentNumber;
}
public void setStudentNumber(String studentNumber) {
	this.studentNumber = studentNumber;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getSalt() {
	return salt;
}
public void setSalt(String salt) {
	this.salt = salt;
}
public int getActive() {
	return active;
}
public void setActive(int active) {
	this.active = active;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}
