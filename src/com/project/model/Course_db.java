package com.project.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.project.controller.BCrypt;

public class Course_db {
	private DataSource dataSource;
	   private NamedParameterJdbcTemplate jdbcTemplateObject;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	      this.jdbcTemplateObject = new NamedParameterJdbcTemplate(dataSource);
	   }
	   
	   public ArrayList<Course> getCourses(){
		   String sql = "SELECT id,coursenum, coursedescription, active FROM courses";
		   ArrayList<Course> courses = new ArrayList<Course>();
		    jdbcTemplateObject.query(sql,new ResultSetExtractor<String>() {
		        @Override
		        public String extractData(ResultSet rs) throws SQLException,
		                                                       DataAccessException {
		        	while (rs.next()){
		        		Course course = new Course();
		        		course.setId(String.valueOf(rs.getInt(1)));
		        		course.setCourseNum(rs.getString(2));
		        		course.setCourseDescription(rs.getString(3));
		        		course.setActive(rs.getString(4));
		        		courses.add(course);
		        	}		        	
		        	return "success";
		        }
		    });
		   return courses;
	   }
	   
	   public ArrayList<Course> getCoursesForAStudent(String studentid){
		   String sql = "SELECT courses.id,courses.coursenum,courses.coursedescription,courses.active from courses "
		   		+ "join coursesstudents on courses.id = coursesstudents.courseid where coursesstudents.studentid=:studentid and feedbackstatus=0";
		   HashMap<String, String> param = new HashMap<String,String>();
		   param.put("studentid",studentid);
		   ArrayList<Course> courses = new ArrayList<Course>();
		    jdbcTemplateObject.query(sql,param,new ResultSetExtractor<String>() {
		        @Override
		        public String extractData(ResultSet rs) throws SQLException,
		                                                       DataAccessException {
		        	while (rs.next()){
		        		Course course = new Course();
		        		course.setId(String.valueOf(rs.getInt(1)));
		        		course.setCourseNum(rs.getString(2));
		        		course.setCourseDescription(rs.getString(3));
		        		course.setActive(rs.getString(4));
		        		courses.add(course);
		        	}		        	
		        	return "success";
		        }
		    });
		   return courses;
	   }
	   public void makeCourseAvailableForFeedback(String courseid){
			String sql = "update courses set active=1 where id=:id";
			HashMap<String, String> param = new HashMap<>();
			param.put("id", courseid);
			jdbcTemplateObject.update(sql,param);
			
		}
		public void makeCourseUnavailable(String courseid){
			String sql = "update courses set active=0 where id=:id";
			HashMap<String, String> param = new HashMap<>();
			param.put("id", courseid);
			jdbcTemplateObject.update(sql,param);
			
		}
		
		//Two new methods for adding and deleting courses
		
		public boolean addCourse(Course c){
			String courseNum = c.getCourseNum();
			String courseDescription = c.getCourseDescription();
			String teacherId = c.getTeacherId();
			
			String sql = "insert into courses(coursenum,coursedescription,teacherid,active) "
					+ "values(:coursenum,:coursedescription,:teacherid,:active)";
			
			HashMap<String, String> param = new HashMap<>();
			
			param.put("coursenum", courseNum);
			param.put("coursedescription", courseDescription);
			param.put("teacherid", teacherId);
			param.put("active", "0");
			
			jdbcTemplateObject.update(sql,param);
			
			return true;
		}
		
		public String deleteCourse(String num){
			
		
			String courseId = getCourseIdByCourseNum(num);
			if (isStudentEnrolledForCourseNum(courseId) != null){
				return "failure";
			}else{
				try{
					String sql1 = "delete from evaluation where courseid=:courseid";
					
					HashMap<String, String> param1 = new HashMap<>();
					param1.put("courseid", courseId);
					
					jdbcTemplateObject.update(sql1,param1);

				}catch (Exception e) {
					return "Course not in evaluation";
				}finally {
					String sql2 = "delete from courses where coursenum=:num";
					
					HashMap<String, String> param2 = new HashMap<>();
					param2.put("num", num);
					
					jdbcTemplateObject.update(sql2,param2);
					return "success";
				}
			}
				
		}
		
		public String getCourseIdByCourseNum (String coursenum){   
			String sql = "SELECT id FROM courses where coursenum=:coursenum";
			   HashMap<String,String> a = new HashMap<String,String>();
			   a.put("coursenum", coursenum);
			   String id = jdbcTemplateObject.query(sql,a,new ResultSetExtractor<String>() {
			        @Override
			        public String extractData(ResultSet rs) throws SQLException,
			                                                       DataAccessException {
			        	if (rs.next()){
			        		return String.valueOf(rs.getInt(1));
			        	}
			        	
			        	return "failure";
			        }
			    });
			   return id;
		}
		
		public String isCourseThere(String courseNum){
			HashMap<String, String> param = new HashMap<>();
			
			String sql = "SELECT coursenum FROM courses WHERE coursenum = :coursenum";
			param.put("coursenum",courseNum);
			return jdbcTemplateObject.query(sql,param,new ResultSetExtractor<String>() {
		        @Override
		        public String extractData(ResultSet rs) throws SQLException,
		                                                       DataAccessException {
		            return rs.next() ? rs.getString(1) : null;
		        }
		    });
		}
		
		public String isStudentEnrolledForCourseNum(String courseId){
			HashMap<String, String> param = new HashMap<>();
			
			String sql = "SELECT courseid FROM coursesstudents WHERE courseid = :courseid";
			param.put("courseid",courseId);
			return jdbcTemplateObject.query(sql,param,new ResultSetExtractor<String>() {
		        @Override
		        public String extractData(ResultSet rs) throws SQLException,
		                                                       DataAccessException {
		            return rs.next() ? rs.getString(1) : null;
		        }
		    });
		}
}
