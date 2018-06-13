package com.billing.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
	
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@RequestMapping(value = "/ExceptionHandler")
	public ModelAndView ExceptionHandler(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
			mav = new ModelAndView("ExceptionHandler");
		return mav;
	}
	@RequestMapping(value = "/update_user.html")
	public ModelAndView update_user(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
			mav = new ModelAndView("update_user");
		return mav;
	}
	
	@RequestMapping(value = "/manage_INVOICE.html")
	public ModelAndView manage_INVOICE(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
		mav = new ModelAndView("manage_INVOICE");
		return mav;
	}
	@RequestMapping(value = "/pnl_Report.html")
	public ModelAndView pnl_Report(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
		String query = "SELECT SUM(PO_AMOUNT) AS TOTAL_PO_AMOUNT FROM PO WHERE  USER_ID=?";
		List<Map<String,Object>> lst = jdbcTemplate.queryForList(query,new Object[] { request.getSession().getAttribute("username").toString() });
		int count = jdbcTemplate.queryForObject("SELECT COUNT(1) ["+query+" ] A", new Object[] { request.getSession().getAttribute("username").toString() },int.class);
		request.setAttribute("lst", lst);
		request.setAttribute("count", count);
		mav = new ModelAndView("pnl_Report");
		mav.addObject("lst", lst);
		mav.addObject("count", count);
		return mav;
	}
	@RequestMapping(value = "/outstanding_Report.html")
	public ModelAndView outstanding_Report(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
		String query ="SELECT IF(p.OUTSTANDING>0,p.PO_NUMBER,0) AS PO_NUMBER,IF(p.OUTSTANDING>0,s.SUPPLIER_NAME,0) AS SUPPLIER_NAME,IF(p.OUTSTANDING>0,p.PO_AMOUNT,0) AS PO_AMOUNT,IF(p.OUTSTANDING>0,p.PAID,0) AS PAID_AMOUNT,IF(p.OUTSTANDING>0,p.OUTSTANDING,0) AS OUTSTANDING_AMOUNT FROM PO p, SUPPLIER s WHERE p.SUPPLIER_ID=s.SUPPLIER_ID AND s.USER_ID= ?";
		List<Map<String,Object>> lst = jdbcTemplate.queryForList(query,
									new Object[] { request.getSession().getAttribute("username").toString() });
		int count = jdbcTemplate.queryForObject("SELECT COUNT(1) ["+query+" ] A", new Object[] { request.getSession().getAttribute("username").toString() },int.class);
		request.setAttribute("count", count);
		request.setAttribute("lst", lst);
		mav = new ModelAndView("outstanding_Report");
		mav.addObject("lst", lst);
		mav.addObject("count", count);
		return mav;
	}
}
