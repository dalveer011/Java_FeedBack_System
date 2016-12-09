package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.project.model.Teacher;
import com.project.model.Teacher_db;

@Controller
public class AdminController {
	@RequestMapping(value = "/admin")
	public ModelAndView homePage(){
		ModelAndView m = new ModelAndView("Admin.jsp");
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Course_db course_db = (Course_db)context.getBean("coursedb");
		 ArrayList<Course> list = course_db.getCourses();
			m.addObject("courses", list);
			context.close();
		    return m;
		}
	@RequestMapping(value = "/adminAuthentication", method=RequestMethod.POST)
	public ModelAndView adminAuthenticate(@RequestParam("adminId") String adminId, 
			@RequestParam("adminPassword")String password ){
			if(adminId.trim().isEmpty() || password.trim().isEmpty()){
				ModelAndView modelAndView = new ModelAndView("AdminLogin.jsp");
				modelAndView.addObject("message", "Empty Fields");
				return modelAndView;
			}else if(!((adminId.trim().equals("admin") && password.trim().equals("password"))))
			{
				ModelAndView modelAndView = new ModelAndView("AdminLogin.jsp");
				modelAndView.addObject("message", "Wrong Credentials");
				return modelAndView;
			}else{
				ModelAndView modelAndView = new ModelAndView("Admin.jsp");
				ClassPathXmlApplicationContext context = 
			             new ClassPathXmlApplicationContext("Beans.xml");
				 Course_db course_db = (Course_db)context.getBean("coursedb");
				 ArrayList<Course> list = course_db.getCourses();
				 modelAndView.addObject("courses", list);
					context.close();
				return modelAndView;
			}
	}
	@RequestMapping(value = "/adminlogin")
	public ModelAndView adminLogin(){
			ModelAndView m = new ModelAndView("AdminLogin.jsp");
		    return m;
		}
	@RequestMapping(value = "/admin/register",method=RequestMethod.GET)
	public ModelAndView sendingRegistrationForm(){
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Course_db course_db = (Course_db)context.getBean("coursedb");
		 ArrayList<Course> list = course_db.getCourses();
		ModelAndView m = new ModelAndView("Register.jsp");
		m.addObject("courses", list);
		context.close();
		return m;
		}
	
	@RequestMapping(value = "/admin/addCourseDetails", method=RequestMethod.GET)
	public ModelAndView sendingAddCoursesForm(){
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Teacher_db teacher_db = (Teacher_db)context.getBean("teacherdb");
		 ArrayList<Teacher> list = teacher_db.getTeachers();
		 ModelAndView m = new ModelAndView("AddCourse.jsp");
		 m.addObject("teachers", list);
		 context.close();
		 return m;
	}
	
	@RequestMapping(value = "/admin/search")
	public ModelAndView searchPage(){
		ModelAndView m = new ModelAndView("Search.jsp");
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Student_db a = (Student_db)context.getBean("studentdb");
		 ArrayList<Student> listOfStudents = a.getAllStudents();
		 System.out.println(listOfStudents.size());
		 m.addObject("listOfStudents",listOfStudents);
		 context.close();
		return m;
		}
	
	@RequestMapping(value = "/admin/searchCourses")
	public ModelAndView searchCoursePage(){
		ModelAndView m = new ModelAndView("SearchCourses.jsp");
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Course_db a = (Course_db)context.getBean("coursedb");
		 ArrayList<Course> listOfCourses = a.getCourses();
		 m.addObject("listOfCourses",listOfCourses);
		 context.close();
		return m;
		}
	
	@RequestMapping(value = "/admin/addstudent",method=RequestMethod.POST)
	public ModelAndView addingStudent(@ModelAttribute("student")Student student){
		ModelAndView modelAndView = new ModelAndView();
		//loading corresponding Bean file
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Student_db a = (Student_db)context.getBean("studentdb");
		//received password
		 if(a.isStudentThere(student.getStudentNumber()) == null){
			 if(a.isEmailThere(student.getEmail())== null){
		 //adding student
		 a.addStudent(student);
		 modelAndView  = new ModelAndView("Register.jsp");
		 modelAndView.addObject("message", "Account Created successfully");
		 }else{
			 modelAndView  = new ModelAndView("Register.jsp");
			 modelAndView.addObject("message", "Email already exists! Please enter another");	  
		 }
	     }else{
			 modelAndView  = new ModelAndView("Register.jsp");
			 modelAndView.addObject("message", "This student number is already registered with this application. Please enter another one."); 
		 }
		 context.close();
		 return modelAndView;
		}
	
	@RequestMapping(value = "/admin/addcourse",method=RequestMethod.POST)
	public ModelAndView addingCourse(@ModelAttribute("course")Course course){
		ModelAndView modelAndView = new ModelAndView();
		//loading corresponding Bean file
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Course_db a = (Course_db)context.getBean("coursedb");
		 
		 if(a.isCourseThere(course.getCourseNum()) == null){
			 //adding course
			 a.addCourse(course);
			 modelAndView  = new ModelAndView("AddCourse.jsp");
			 modelAndView.addObject("message", "Course added successfully");
	     }else{
			 modelAndView  = new ModelAndView("AddCourse.jsp");
			 modelAndView.addObject("message", "This course number already exists!"); 
		 }
		 context.close();
		 return modelAndView;
		}
	
	@RequestMapping(value = "/makeAvailable")
	public String updatingCourse(@RequestParam("id") String id){
	ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Course_db course_db = (Course_db)context.getBean("coursedb");
		  course_db.makeCourseAvailableForFeedback(id);
		  context.close();
		  return "redirect: ./admin";
		}
	
	@RequestMapping(value = "/makeUnavailable")
	public String makingCourseUnavailable(@RequestParam("id") String id){
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		  Course_db course_db = (Course_db)context.getBean("coursedb");
		  course_db.makeCourseUnavailable(id);
		  context.close();
		  return "redirect: ./admin";
		}
	
//	@RequestMapping(value = "/admin/delete")
//	public String deletingstudent(@RequestParam("num") String num){
//		ClassPathXmlApplicationContext context = 
//	             new ClassPathXmlApplicationContext("Beans.xml");
//		  Student_db student_db = (Student_db)context.getBean("studentdb");
//		  student_db.deleteStudent(num);
//		  context.close();
//		  return "redirect: ../admin/search";
//		}
	
	
	@RequestMapping(value = "/admin/delete")
	public ModelAndView deleteStudent(@RequestParam("num") String num){
		
		ModelAndView modelAndView = new ModelAndView("Search.jsp");
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		  Student_db student_db = (Student_db)context.getBean("studentdb");
		 		
		  student_db.deleteStudent(num);
		  ArrayList<Student> listOfStudents = student_db.getAllStudents();
		  modelAndView.addObject("listOfStudents",listOfStudents);
		  modelAndView.addObject("message", "Students deleted successfully");
		  context.close();

		  return modelAndView;
		}
	
	@RequestMapping(value = "/admin/deleteCourse")
	public ModelAndView deleteCourse(@RequestParam("num") String num){
		
		ModelAndView modelAndView = new ModelAndView("SearchCourses.jsp");
		ClassPathXmlApplicationContext context = 
	             new ClassPathXmlApplicationContext("Beans.xml");
		 Course_db course_db = (Course_db)context.getBean("coursedb");
		 		
		  String s = course_db.deleteCourse(num);
		  ArrayList<Course> listOfCourses = course_db.getCourses();
		  modelAndView.addObject("listOfCourses",listOfCourses);
		  context.close();
		  
		  if (s.equals("success")){
			  modelAndView.addObject("message", "Course deleted successfully");
		  }else{
			  modelAndView.addObject("message", "Students are enrolled in this course, so cannot delete");
		  }
		  
		  return modelAndView;
		}
		
		@RequestMapping("/generateReport")
		public ModelAndView generateReport (@RequestParam("id") String courseid){
			
			ModelAndView modelAndView = new ModelAndView();
			ClassPathXmlApplicationContext context = 
		             new ClassPathXmlApplicationContext("Beans.xml");
			 Evaluation_db evaluation_db = (Evaluation_db)context.getBean("evaluationdb");
			 if(evaluation_db.isFeedbackThere(courseid) == null){
				 System.out.println(evaluation_db.isFeedbackThere(courseid));
				 modelAndView = new ModelAndView("Admin.jsp");
				 Course_db course_db = (Course_db)context.getBean("coursedb");
				 ArrayList<Course> list = course_db.getCourses();
				 modelAndView.addObject("courses", list);
				 modelAndView.addObject("message" , "No student has provided feedback for this course yet");
			 }else{
				 modelAndView = new ModelAndView("GenerateReport.jsp");
				 HashMap<String,String> result = evaluation_db.generateReport(courseid);
				 modelAndView.addObject("result", result);
			 }
			 return modelAndView;
		}
}
