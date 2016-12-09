package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {
	@RequestMapping(value = "/logout")
	  public ModelAndView logout(HttpSession session){
	    session.invalidate();
	    ModelAndView m = new ModelAndView("Home.jsp");
	    return m;
	    }
	
	
}
