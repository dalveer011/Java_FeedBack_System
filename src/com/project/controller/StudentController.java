package com.project.controller;

import java.util.ArrayList;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.Course;
import com.project.model.Course_db;
import com.project.model.Evaluation;
import com.project.model.Evaluation_db;
import com.project.model.Student;
import com.project.model.Student_db;

@Controller
public class StudentController {
	@RequestMapping(value = "/startfeedback")
	public ModelAndView startFeedback(@RequestParam("studentid")String studentid,@RequestParam("courseid") String courseid){
		ModelAndView m = new ModelAndView("paging.jsp");
		m.addObject("studentid",studentid);
		m.addObject("courseid",courseid);
		return m;
		}
	@RequestMapping(value="/addresponse",method=RequestMethod.POST)
	public ModelAndView addingResponse(@ModelAttribute("response")Evaluation evaluation)
	{
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Evaluation_db a = (Evaluation_db)context.getBean("evaluationdb");
		 Course_db course_db = (Course_db)context.getBean("coursedb");
		 a.addResponse(evaluation);
		 ArrayList<Course> list = course_db.getCoursesForAStudent(evaluation.getStudentid());
		 ModelAndView m = new ModelAndView("Student.jsp");
		 m.addObject("message","Feedback submitted successfully");
		 m.addObject("courses", list);
		 context.close();
		 return m;
	}	
	
}
