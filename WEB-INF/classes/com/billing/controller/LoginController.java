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

import com.billing.model.Login;
import com.billing.model.User;
import com.billing.service.UserService;

@Controller
public class LoginController {
	@Autowired
	UserService userService;
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;

	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("login", new Login());
		return mav;
	}

	@ModelAttribute("user")
	public User setUpUserForm() {
		return new User();
	}

	@RequestMapping(value = "/loginProcess.html", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpServletRequest request, HttpSession session,
			@ModelAttribute("login") Login login) {
		ModelAndView mav = null;
		User user = userService.validateUser(login);
		if (null != user) {
			String hp = jdbcTemplate
					.queryForObject("SELECT ROLE_HOMMEPAGE FROM ROLE WHERE ROLE_ID =" + user.getRole_id(), String.class)
					.toString();
			session.setAttribute("username", user.getUsername());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("role_id", user.getRole_id());
			session.setAttribute("homepage", hp);
			session.setAttribute("phone", user.getPhone());
			session.setAttribute("name", user.getFirstname()+" "+user.getLastname());
			mav = new ModelAndView("welcome");
			mav.addObject("FIRSTNAME", user.getFirstname());
			mav.addObject("WELCOME_PAGE", hp);
		} else {
			mav = new ModelAndView("login");
			mav.addObject("message", "Username or Password is wrong!!");
		}
		return mav;
	}
}