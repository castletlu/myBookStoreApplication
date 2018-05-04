package com.javasampleapproach.jspresource.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebController {

	@RequestMapping("/home")
	ModelAndView home(ModelAndView modelAndView) {
		
		modelAndView.setViewName("home");
		modelAndView.getModel().put("name", "John");

		return modelAndView;
	}
	@RequestMapping("/login")
	ModelAndView login(ModelAndView modelAndView) {
		
		modelAndView.setViewName("login");
//		modelAndView.getModel().put("name", "John");

		return modelAndView;
	}
	
	@RequestMapping("/check")
	ModelAndView checkLogin(ModelAndView modelAndView) {
		
		modelAndView.setViewName("checkLogin");
//		modelAndView.getModel().put("name", "John");

		return modelAndView;
	}
	
	@RequestMapping("/logout")
	ModelAndView logout(ModelAndView modelAndView) {
		
		modelAndView.setViewName("logout");
//		modelAndView.getModel().put("name", "John");

		return modelAndView;
	}
	
	
	
	
}
