package com.project.controller;

import java.util.ArrayList;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.Course;
import com.project.model.Course_db;
import com.project.model.SendingEmail;
import com.project.model.Student;
import com.project.model.Student_db;

@SessionAttributes("studentNum")
@Controller
public class HomeController {

	@RequestMapping(value = "/home")
	public ModelAndView homePage() {
		ModelAndView m = new ModelAndView("Home.jsp");
		return m;
	}

	@RequestMapping(value = "/about")
	public ModelAndView AboutPage() {
		ModelAndView m = new ModelAndView("About.jsp");
		return m;
	}

	@RequestMapping(value = "/authentication", method = RequestMethod.POST)
	public ModelAndView authentication(@RequestParam("studentNumber") String num,
			@RequestParam("password") String pass) {
		Student student = new Student();
		student.setStudentNumber(num);
		student.setPassword(pass);
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
		Student_db student_db = (Student_db) context.getBean("studentdb");
		// for return purpose
		if (student_db.isStudentThere(student.getStudentNumber()) != null) {
			if ((student_db.isStudentActive(student.getStudentNumber())).equals("1")) {
				if (student_db.isCredentialsRight(student.getStudentNumber(), student.getPassword()) == "true") {
					String studentid = student_db.getStudentIdByStudentNum(student.getStudentNumber());
					Course_db course_db = (Course_db) context.getBean("coursedb");
					ArrayList<Course> list = course_db.getCoursesForAStudent(studentid);
					ModelAndView m = new ModelAndView("Student.jsp");
					m.addObject("studentNum", num);
					m.addObject("courses", list);
					m.addObject("studentid",studentid);
					context.close();
					return m;
				} else {
					ModelAndView m = new ModelAndView("Home.jsp");
					m.addObject("message", "invalid password");
					context.close();
					return m;
				}
			} else {
				ModelAndView m = new ModelAndView("Home.jsp");
				m.addObject("message", "please register first and create a password");
				context.close();
				return m;
			}
		} else {
			ModelAndView m = new ModelAndView("Home.jsp");
			m.addObject("message", "You are not registered with us. Please contact admin");
			context.close();
			return m;
		}

	}

	@RequestMapping("/forgotPassword")
	public ModelAndView forgotPasswordPage() {
		ModelAndView modelAndView = new ModelAndView("ForgotPassword.jsp");
		return modelAndView;
	}

	@RequestMapping(value = "/sendemail", method = RequestMethod.POST)
	public ModelAndView sendEmail(@RequestParam("studentid") String studentid) {
		ModelAndView modelAndView = new ModelAndView();
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
		Student_db student_db = (Student_db) context.getBean("studentdb");
		if (student_db.isStudentThere(studentid) != null) {
			String studentEmail = student_db.getStudentEmailByStudentNum(studentid);
			String token = student_db.addForgotPasswordToken(studentEmail);
			SendingEmail.sendEmail(studentEmail,token);
			modelAndView = new ModelAndView("Home.jsp");
			modelAndView.addObject("message", "An email has been sent with link to reset password");
		} else {
			modelAndView = new ModelAndView("ForgotPassword.jsp");
			modelAndView.addObject("message", "This student id is not registered with us");
		}
		context.close();
		return modelAndView;
	}
	@RequestMapping("/resetPasword")
	public ModelAndView resetPasswordPage(@RequestParam("email") String email) {
		ModelAndView modelAndView = new ModelAndView();
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
		Student_db student_db = (Student_db) context.getBean("studentdb");
		if (student_db.verifyToken(email)) {
			modelAndView = new ModelAndView("ResetPassword.jsp");
			modelAndView.addObject("email", email);
		} else {
			modelAndView = new ModelAndView("Home.jsp");
			modelAndView.addObject("message", "Sorry Can not update password Right Now");
		}
		context.close();
		return modelAndView;

	}

	@RequestMapping("/studentregister")
	public ModelAndView student() {
		ModelAndView modelAndView = new ModelAndView("StudentAccount.jsp");
		return modelAndView;

	}

	@RequestMapping("/activateStudent")
	public ModelAndView activatingStudent(@RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("studentnum") String studentnum) {
		ModelAndView modelAndView = new ModelAndView();
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
		Student_db student_db = (Student_db) context.getBean("studentdb");
		if (student_db.isStudentThere(studentnum) != null) {
			     if(student_db.isStudentActive(studentnum).equals("0")){
				    if (student_db.getStudentEmailByStudentNum(studentnum).equals(email)) {
					String hashPass = BCrypt.hashpw(password, BCrypt.gensalt());
					student_db.updateStudentPasswordRegistration(hashPass, email);
					modelAndView = new ModelAndView("Home.jsp");
					modelAndView.addObject("message", "Your account has been created successfully");
				} else {
					modelAndView = new ModelAndView("StudentAccount.jsp");
					modelAndView.addObject("message", "Email does not match. Please enter correct email");
				}

		}else{
			modelAndView = new ModelAndView("StudentAccount.jsp");
			modelAndView.addObject("message", "Student already registered. You can not register this student again");
		      }
			     }else {      
			modelAndView = new ModelAndView("StudentAccount.jsp");
			modelAndView.addObject("message", "You are not registered! please contact admin using contact US");
		}
		context.close();
		return modelAndView;
	}

	@RequestMapping("/resetProcessing")
	public ModelAndView resetPasswordProcessing(@RequestParam("newPassword") String newPassword,
			@RequestParam("email") String email) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
		Student_db student_db = (Student_db) context.getBean("studentdb");
			student_db.updateStudentPassword(newPassword, email);
			ModelAndView modelAndView = new ModelAndView("Home.jsp");
			modelAndView.addObject("message", "Password has been changed enjoy!!");
			context.close();
			return modelAndView;
	}
}
