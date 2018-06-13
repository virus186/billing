package com.billing.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.billing.model.Supplier;

@Controller
public class SupplierController {
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	String s_id = null;
	
//	Logger Logger = new Logger(SupplierController.class);
	
	@RequestMapping(value = "/manage_SUPPLIER.html")
	public ModelAndView manage_SUPPLIER(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
		List<Map<String, Object>> lst = jdbcTemplate.queryForList(
				"SELECT SUPPLIER_ID,SUPPLIER_NAME,concat('<a href=\"update_SUPPLIER.html?SUPPLIER_ID=',SUPPLIER_ID,'\" >UPDATE</a> ') AS 'UPDATE' FROM SUPPLIER WHERE USER_ID=?",
				new Object[] { request.getSession().getAttribute("username").toString() });
		List<String> lstSupplier = new ArrayList<String>();
			for (Map<String, Object> lstrow : lst) {
				lstSupplier.add(lstrow.get("SUPPLIER_NAME").toString());
			}
			request.setAttribute("lst", lst);
			request.setAttribute("lstSupplier", lstSupplier);
			mav = new ModelAndView("manage_SUPPLIER");
			mav.addObject("lst", lst);
		
		return mav;
	}

	@RequestMapping(value = "/add_SUPPLIER.html",method = RequestMethod.GET)
	public ModelAndView add_SUPPLIER(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
		mav = new ModelAndView("add_SUPPLIER");
		mav.addObject("add_SUPPLIER", new Supplier());
		return mav;
	}
	
	@RequestMapping(value = "/add_SUPPLIER.html",method = RequestMethod.POST)
	public ModelAndView add_SUPPLIER(HttpServletRequest request, HttpSession session,
			@ModelAttribute("add_SUPPLIER") Supplier s) {
		ModelAndView mav = null;
		
		String address = s.getSupplier_address();
		String name = s.getSupplier_name();
		String user = request.getSession().getAttribute("username").toString();
		System.out.println(s.getSupplier_address() +" " + s.getSupplier_name());
		jdbcTemplate.update("INSERT INTO SUPPLIER(SUPPLIER_NAME,SUPPLIER_ADDRESS,USER_ID) VALUES(?,?,?)",
				new Object[] { name, address ,user});
		
		String supplier_id = jdbcTemplate.queryForObject("SELECT SUPPLIER_ID FROM SUPPLIER WHERE USER_ID=? ORDER BY SUPPLIER_ID DESC LIMIT 1",
				new Object[] { user},String.class);
		System.out.println(supplier_id+"   supplier_id");
		mav = new ModelAndView("add_SUPPLIER");
		request.setAttribute("message", "Record created supplier id " + supplier_id);
		return mav;
	}
	
	/*@RequestMapping(value = "/update_SUPPLIER/{supplier_id}",method={RequestMethod.GET})
	public ModelAndView update_SUPPLIER(HttpServletRequest request, HttpServletResponse response,@PathVariable String supplier_id) {
		ModelAndView mav = null;
		String user = request.getSession().getAttribute("username").toString();
		List<Map<String,Object>> lstResult = jdbcTemplate.queryForList("SELECT SUPPLIER_ID,SUPPLIER_NAME,SUPPLIER_ADDRESS FROM SUPPLIER WHERE SUPPLIER_ID=? AND USER_ID=?",
				new Object[] {supplier_id,user});
		s_id = supplier_id;
		request.setAttribute("lstResult", lstResult);
		mav = new ModelAndView("update_SUPPLIER");
		mav.addObject("update_SUPPLIER", new Supplier());
		return mav;
	}
	@RequestMapping(value = "/update_SUPPLIER",method = RequestMethod.POST)
	public ModelAndView update_SUPPLIER(HttpServletRequest request, HttpSession session,
			@ModelAttribute("update_SUPPLIER") Supplier s) {
		ModelAndView mav = null;
		String address = s.getSupplier_address();
		String name = s.getSupplier_name();
		String c = s_id;
		String user = request.getSession().getAttribute("username").toString();
		System.out.println(s.getSupplier_address() +" " + s.getSupplier_name());
		int supplier_id = jdbcTemplate.update("UPDATE SUPPLIER SUPPLIER_NAME = ? ,SUPPLIER_ADDRESS ? WHERE USER_ID =? AND SUPPLIER_ID=?",
				new Object[] { name, address ,user,Integer.parseInt(s_id)});
		System.out.println(supplier_id+"   supplier_id");
		mav = new ModelAndView("update_SUPPLIER");
		mav.addObject("message", "Record created supplier id " + supplier_id);
		return mav;
	}*/
}
