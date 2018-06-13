package com.billing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.billing.model.User;
import com.billing.service.UserService;

@Controller
public class RegistrationController {
	@Autowired
	UserService userService;
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Hi Register page open");
		ModelAndView mav = new ModelAndView("register");
		mav.addObject("user", new User());
		return mav;
	}

	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request, HttpSession session,
			@ModelAttribute("user") User user) {
		System.out.println("Hi Register Process started");
		
		ModelAndView mav = null;
		String hp = jdbcTemplate
				.queryForObject("SELECT ROLE_HOMMEPAGE FROM ROLE WHERE ROLE_ID =" + user.getRole_id(), String.class)
				.toString();
		session.setAttribute("username", user.getUsername());
		session.setAttribute("email", user.getEmail());
		session.setAttribute("role_id", user.getRole_id());
		session.setAttribute("homepage", hp);
		session.setAttribute("phone", user.getPhone());
		session.setAttribute("name", user.getFirstname()+" "+user.getLastname());
		user = userService.register(user);
		mav = new ModelAndView("welcome");
		mav.addObject("FIRSTNAME", request.getSession().getAttribute("name"));
		mav.addObject("WELCOME_PAGE", hp);
		return mav;
	}
}
