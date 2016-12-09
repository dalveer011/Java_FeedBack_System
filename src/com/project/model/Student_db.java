package com.project.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.project.controller.BCrypt;
import com.sun.javafx.collections.MappingChange.Map;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;


public class Student_db {
	private DataSource dataSource;
	   private NamedParameterJdbcTemplate jdbcTemplateObject;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	      this.jdbcTemplateObject = new NamedParameterJdbcTemplate(dataSource);
	   }
public boolean addStudent(Student s){
	String firstname = s.getFirstName();
	String lastname = s.getLastName();
	String email = s.getEmail();
	String studentNo = s.getStudentNumber();
	String password = s.getPassword();
	String[] courseIds = s.getCourseIds();
	
	String sql = "insert into students(firstname,lastname,email,studentnum,password,active,forgotpasswordtoken) "
			+ "values(:firstname,:lastname,:email,:studentnum,:password,:active,:forgotpasswordtoken)";
	HashMap<String, String> param = new HashMap<>();
	param.put("firstname", firstname);
	param.put("lastname", lastname);
	param.put("email", email);
	param.put("studentnum", studentNo);
	param.put("password", password);
	param.put("active", "0");
	param.put("forgotpasswordtoken", "none");
	jdbcTemplateObject.update(sql,param);
	String id = getStudentIdByStudentNum(studentNo);
	//adding students and courses to table
	for (String courseId : courseIds) {
		String sqlTwo = "insert into coursesstudents(studentid,courseid) values(:studentnum,:courseid)";
		HashMap<String, String> paramCourses = new HashMap<>();
		paramCourses.put("studentnum", id);
		paramCourses.put("courseid", courseId);
		jdbcTemplateObject.update(sqlTwo, paramCourses);
		}
	return true;
}
public String isStudentThere(String studentNum){
	HashMap<String, String> param = new HashMap<>();
	String sql = "SELECT studentnum,email FROM students WHERE studentnum = :studentnum";
	param.put("studentnum",studentNum);
	return jdbcTemplateObject.query(sql,param,new ResultSetExtractor<String>() {
        @Override
        public String extractData(ResultSet rs) throws SQLException,
                                                       DataAccessException {
            return rs.next() ? rs.getString(1) : null;
        }
    });
}
public String isEmailThere(String email){
	HashMap<String, String> param = new HashMap<>();
	String sql = "SELECT email FROM students WHERE email = :email";
	param.put("email",email);
	return jdbcTemplateObject.query(sql,param,new ResultSetExtractor<String>() {
        @Override
        public String extractData(ResultSet rs) throws SQLException,
                                                       DataAccessException {
            return rs.next() ? rs.getString(1) : null;
        }
    });
}
public String isStudentActive(String studentNum){
	HashMap<String, String> param = new HashMap<>();
	String sql = "SELECT active FROM students WHERE studentnum = :studentnum";
	param.put("studentnum",studentNum);
	return jdbcTemplateObject.query(sql,param,new ResultSetExtractor<String>() {
        @Override
        public String extractData(ResultSet rs) throws SQLException,
                                                       DataAccessException {
            return rs.next() ? rs.getString(1) : null;
        }
    });
}
public String isCredentialsRight(String studentNum,String password){
	HashMap<String, String> param = new HashMap<>();
	String sql = "SELECT password FROM students WHERE studentnum = :studentnum";
	param.put("studentnum",studentNum);
	param.put("password", password);
	return jdbcTemplateObject.query(sql,param,new ResultSetExtractor<String>() {
        @Override
        public String extractData(ResultSet rs) throws SQLException,
                                                       DataAccessException {
            return rs.next() ? Boolean.toString(BCrypt.checkpw(password,rs.getString(1))) : null;
        }
    });
}
public ArrayList<Student> getAllStudents (){
	   String sql = "SELECT * FROM students";
	   ArrayList<Student> students = new ArrayList<Student>();
	   jdbcTemplateObject.query(sql,new ResultSetExtractor<String>() {
	        @Override
	        public String extractData(ResultSet rs) throws SQLException,
	                                                       DataAccessException {
	        	while (rs.next()){
	        		Student student = new Student();
	        		student.setStudentNumber(rs.getString(2));
	        		student.setFirstName(rs.getString(4));
	        		student.setLastName(rs.getString(5));
	        		student.setEmail(rs.getString(6));
	        		students.add(student);
	        	}
	        	
	        	return "success";
	        }
	    });
	   
	   return students;
}
public String getStudentEmailByStudentNum (String id){   
	String sql = "SELECT email FROM students where studentnum=:studentnum";
	   HashMap<String,String> a = new HashMap<String,String>();
	   a.put("studentnum",id);
	   String email = jdbcTemplateObject.query(sql,a,new ResultSetExtractor<String>() {
	        @Override
	        public String extractData(ResultSet rs) throws SQLException,
	                                                       DataAccessException {
	        	if (rs.next()){
	        		return rs.getString(1);
	        	}
	        	
	        	return "failure";
	        }
	    });
	   return email;
}
public String getStudentIdByStudentNum (String num){   
	String sql = "SELECT id FROM students where studentnum=:studentnum";
	   HashMap<String,String> a = new HashMap<String,String>();
	   a.put("studentnum",num);
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
public String addForgotPasswordToken(String email){
	String hash = BCrypt.hashpw(email, BCrypt.gensalt());
	String sql = "update students set forgotpasswordtoken=:forgotpasswordtoken where email=:email";
	HashMap<String, String> param = new HashMap<>();
	param.put("forgotpasswordtoken", hash);
	param.put("email", email);
	jdbcTemplateObject.update(sql,param);
	return hash;
}
public void updateStudentPassword(String password,String email){
	String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());
	String sql = "update students set password=:password,forgotpasswordtoken=0 where email=:email";
	HashMap<String, String> param = new HashMap<>();
	param.put("email", email);
	param.put("password", hashPassword);
	jdbcTemplateObject.update(sql,param);
	
}
public void updateStudentPasswordRegistration(String password,String email){
	String sql = "update students set password=:password,active=1 where email=:email";
	HashMap<String, String> param = new HashMap<>();
	param.put("email", email);
	param.put("password", password);
	jdbcTemplateObject.update(sql,param);
	
}

public boolean verifyToken(String email){   
	String sql = "SELECT forgotpasswordtoken FROM students where email=:email";
	   HashMap<String,String> a = new HashMap<String,String>();
	   a.put("email",email);
	   String tokenFromDB = jdbcTemplateObject.query(sql,a,new ResultSetExtractor<String>() {
	        @Override
	        public String extractData(ResultSet rs) throws SQLException,
	                                                       DataAccessException {
	        	if (rs.next()){
	        		return rs.getString(1);
	        	}else{
	        	return "failure";
	        	}
	        	}
	    });
	   try{
	   if(tokenFromDB.equals("failure")){
		   return false;
	   }else{
		   if(BCrypt.checkpw(email,tokenFromDB)){
			   return true;
		   }else{
			   return false;
		   }
	   }
	   }catch(Exception e){
		   System.out.println("Error occured in token verification");
		  return false; 
	   }
}
public void deleteStudent(String num){
	String sqlThree = "delete from evaluations where studentid=:id";
	HashMap<String, String> paramThree = new HashMap<>();
	paramThree.put("id", getStudentIdByStudentNum(num));
	
	String sqlTwo = "delete from coursesstudents where studentid=:id";
	HashMap<String, String> paramTwo = new HashMap<>();
	paramTwo.put("id", getStudentIdByStudentNum(num));
	
	String sql = "delete from students where studentnum=:num";
	HashMap<String, String> param = new HashMap<>();
	param.put("num", num);
	
	jdbcTemplateObject.update(sqlTwo,paramTwo);
	jdbcTemplateObject.update(sqlThree,paramThree);
	jdbcTemplateObject.update(sql,param);	
}
}
