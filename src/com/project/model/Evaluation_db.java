package com.project.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import com.sun.javafx.binding.StringFormatter;
import com.sun.org.apache.bcel.internal.generic.RETURN;

public class Evaluation_db {

	
		private DataSource dataSource;
		   private NamedParameterJdbcTemplate jdbcTemplateObject;
		   
		   public void setDataSource(DataSource dataSource) {
		      this.dataSource = dataSource;
		      this.jdbcTemplateObject = new NamedParameterJdbcTemplate(dataSource);
		   }
		   
		   
		   public boolean addResponse(Evaluation e){
				
			   String studentid = e.getStudentid();
			   String courseid =  e.getCourseid();
			   String response1 = e.getResponse1();
			   String response2 = e.getResponse2();
			   String response3 = e.getResponse3();
			   String response4 = e.getResponse4();
			   String response5 = e.getResponse5();
			   String response6 = e.getResponse6();
			   String response7 = e.getResponse7();
			   String response8 = e.getResponse8();
			   String response9 = e.getResponse9();
			   String response10 = e.getResponse10();
			   String response11 = e.getResponse11();
			   String response12 = e.getResponse12();
			   String response13 = e.getResponse13();
			   String response14 = e.getResponse14();
			   String response15 = e.getResponse15();
			   String response16 = e.getResponse16();
			   String response17 = e.getResponse17();
			  
			   
			   String sql = "insert into evaluations"
			   		+ "(studentid,courseid,response1,response2,response3,response4,response5,response6,response7,response8,response9,response10,response11,response12,response13,response14,response15,response16,response17)"
			 + "values(:studentid,:courseid,:response1,:response2,:response3,:response4,:response5,:response6,:response7,:response8,:response9,:response10,:response11,:response12,:response13,:response14,:response15,:response16,:response17)";

			   HashMap<String, String>param = new HashMap<>();
			   param.put("studentid", studentid);
			   param.put("courseid", courseid);
			   param.put("response1", response1);
			   param.put("response2", response2);
			   param.put("response3", response3);
			   param.put("response4", response4);
			   param.put("response5", response5);
			   param.put("response6", response6);
			   param.put("response7", response7);
			   param.put("response8", response8);
			   param.put("response9", response9);
			   param.put("response10", response10);
			   param.put("response11", response11);
			   param.put("response12", response12);
			   param.put("response13", response13);
			   param.put("response14", response14);
			   param.put("response15", response15);
			   param.put("response16", response16);
			   param.put("response17", response17);
			   int status = jdbcTemplateObject.update(sql, param);
			   String sqlTwo = "update coursesstudents set feedbackstatus=1 where studentid=:studentid and courseid=:courseid";

			   HashMap<String, String> paramTwo = new HashMap<String,String>();
			   paramTwo.put("studentid", studentid);
			   paramTwo.put("courseid", courseid);
			   jdbcTemplateObject.update(sqlTwo, paramTwo);
			   return true;
			   
			}
		   
		   	public String isFeedbackThere (String courseid){
		   		
		   		try{
		   		String sql = "SELECT id FROM evaluations where courseid = :courseid";
		   		HashMap<String, String> param = new HashMap<>();
		   		param.put("courseid", courseid);
		   		
		   		
		   		return jdbcTemplateObject.query(sql, param, new ResultSetExtractor<String>() {
				        @Override
				        public String extractData(ResultSet rs) throws SQLException,
				                                                       DataAccessException {
				        	
				        	return rs.next() ? rs.getString(1) : null;
				        }
		   		});
		   		}catch(Exception e){
		   			return null;
		   		}
		   		}
		   	
		   	
		   	
		   	public HashMap<String,String> generateReport(String courseid){
		   		HashMap<String,String> result = new HashMap<>();
		   		String sql = "SELECT Round((sum(response1)/(count(response1)*5))*100,2),"+
		   					"Round((sum(response2)/(count(response2)*5))*100,2),"
		   					+ "Round((sum(response3)/(count(response3)*5))*100,2),"
		   					+ "Round((sum(response4)/(count(response4)*5))*100,2),"
		   					+ "Round((sum(response5)/(count(response5)*5))*100,2),"
		   					+ "Round((sum(response6)/(count(response6)*5))*100,2),"
		   					+ "Round((sum(response7)/(count(response7)*5))*100,2),"
		   					+ "Round((sum(response8)/(count(response8)*5))*100,2),"
		   					+ "Round((sum(response9)/(count(response9)*5))*100,2),"
		   					+ "Round((sum(response10)/(count(response10)*5))*100,2),"
		   					+ "Round((sum(response11)/(count(response11)*5))*100,2),"
		   					+ "Round((sum(response12)/(count(response12)*5))*100,2),"
		   					+ "Round((sum(response13)/(count(response13)*5))*100,2),"
		   					+ "Round((sum(response14)/(count(response14)*3))*100,2),"
		   					+ "Round((sum(response15)/(count(response15)*4))*100,2)"
		   					+" from evaluations where courseid=:courseid GROUP BY courseid";
		   		
		   		HashMap<String, String> param = new HashMap<>();
		   		param.put("courseid", courseid);
		   		
		   		jdbcTemplateObject.query(sql,param, new ResultSetExtractor<String>() {
			        @Override
			        public String extractData(ResultSet rs) throws SQLException,
			                                                       DataAccessException {
			        	while (rs.next()){
			        		result.put("The professor was well prepared for each class/lab", rs.getString(1));
			        		result.put("The professor presented his/her materials in a clear manner", rs.getString(2));
			        		result.put("The pace the proferssor set for the course for appropriate for me", rs.getString(3));
			        		result.put("The professor helped me think critically about the topics in the course", rs.getString(4));
			        		result.put("The professor used a variety of teaching methods(e.g., group work,multi-media,case studies,lecture etc).", rs.getString(5));
			        		result.put("The professor treated me with courtesy.", rs.getString(6));
			        		result.put("The professor provided clear explanation about student work would be evaluated in course", rs.getString(7));
			        		result.put("The way professor taught helped me learn", rs.getString(8));
			        		result.put("The professor provided me with useful feedback about my progress", rs.getString(9));
			        		result.put("The professor managed student classroom behaviour", rs.getString(10));
			        		result.put("The professor motivated me to learn", rs.getString(11));
			        		result.put("The professor responded to my course-related voice messages or emails within 2 school days", rs.getString(12));
			        		result.put("The professor returned assignemtns and tests within 2-week period.", rs.getString(13));
			        		result.put("Compared with other courses i have taken this semester , my effort in this course was...", rs.getString(14));
			        		result.put("Overall the learning experience in this course was", rs.getString(15));
			        		
			        	}		        	
			        	return "success";
			        }
			    });
		   		
		   		return result;
		   	}
		   	public String getResponse(String percent){
		   		float percentActual = Float.parseFloat(percent);
		   		String response = "";
		   		if (percentActual <= 100 && percentActual > 80){
		   			response = "Majority of people strongly agrees with this statement";
		   		}else if (percentActual <= 80 && percentActual > 60 ){
		   			response = "Majority of people strongly agrees with this statement";
		   		}else if (percentActual <= 60 && percentActual > 40){
		   			response = "Majority of people disagree with this statement";
		   		}else if (percentActual <= 40 && percentActual > 20){
		   			response = "Majority of people strongly disagree with this statement";
		   		}else{
		   			response = "Majority of people think that it's not applicable to them";
		   		}
		   		return response;
		   	}
}
