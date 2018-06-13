package com.billing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HomePageController {
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	@RequestMapping(value = "/home.html")
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("home");
		return mav;
	}
	@RequestMapping(value = "/welcome.html")
	public ModelAndView welcome(HttpServletRequest request, HttpSession session) {
		System.out.println("request.getSession()--------- >       "+request.getSession());
		ModelAndView mav = null;
		String hp  = jdbcTemplate.queryForObject("SELECT ROLE_HOMMEPAGE FROM ROLE WHERE ROLE_ID ="+session.getAttribute("role_id"), String.class).toString();
		mav = new ModelAndView("welcome");
		mav.addObject("FIRSTNAME", session.getAttribute("name"));
		mav.addObject("WELCOME_PAGE", hp);
		return mav;
	}
}
