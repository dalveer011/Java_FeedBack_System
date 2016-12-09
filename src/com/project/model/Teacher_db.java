package com.project.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public class Teacher_db {
	private DataSource dataSource;
	   private NamedParameterJdbcTemplate jdbcTemplateObject;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	      this.jdbcTemplateObject = new NamedParameterJdbcTemplate(dataSource);
	   }
	   
	   public ArrayList<Teacher> getTeachers(){
		   String sql = "SELECT id, fname, lname, email FROM teachers";
		   ArrayList<Teacher> teachers = new ArrayList<Teacher>();
		   
		    jdbcTemplateObject.query(sql,new ResultSetExtractor<String>() {
		        @Override
		        public String extractData(ResultSet rs) throws SQLException,
		                                                       DataAccessException {
		        	while (rs.next()){
		        		Teacher teacher = new Teacher();
		        		teacher.setId(String.valueOf(rs.getInt(1)));
		        		teacher.setfName(rs.getString(2));
		        		teacher.setlName(rs.getString(3));
		        		teacher.setEmail(rs.getString(4));
		        		teachers.add(teacher);
		        	}		        	
		        	return "success";
		        }
		    });
		   return teachers;
	   }
}
