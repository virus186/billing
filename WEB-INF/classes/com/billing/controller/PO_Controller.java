package com.billing.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.billing.model.PO;

@Controller
public class PO_Controller {

	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;

	@RequestMapping(value = "/manage_PO.html")
	public ModelAndView manage_PO(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
		List<Map<String, Object>> lst = jdbcTemplate.queryForList(
				"SELECT PO_NUMBER,SUPPLIER_ID,PO_AMOUNT,PAID,OUTSTANDING FROM PO WHERE USER_ID=?",
				new Object[] { request.getSession().getAttribute("username").toString() });
		request.setAttribute("lst", lst);
		
		mav = new ModelAndView("manage_PO");
		mav.addObject("lst", lst);
		return mav;
	}

	@RequestMapping(value = "/add_PO.html", method = RequestMethod.GET)
	public ModelAndView add_SUPPLIER(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = null;
		List<Map<String, Object>> lst = jdbcTemplate.queryForList(
				"SELECT SUPPLIER_ID,SUPPLIER_NAME FROM SUPPLIER WHERE USER_ID=?",
				new Object[] { request.getSession().getAttribute("username").toString() });
		request.setAttribute("lst", lst);
		mav = new ModelAndView("add_PO");
		mav.addObject("add_PO", new PO());
		return mav;
	}

	@RequestMapping(value = "/add_PO.html", method = RequestMethod.POST)
	public ModelAndView add_SUPPLIER(HttpServletRequest request, HttpSession session, @ModelAttribute("add_PO") PO po) {
		ModelAndView mav = null;

		String po_number = po.getPo_number();
		String supplier_id = po.getSupplier_id();
		String items_data = po.getPo_item_data();
		String amount = po.getPo_amount();
		String paid = po.getPo_paid();
		String outstanding = po.getPo_balance();
		String user = request.getSession().getAttribute("username").toString();
		int po_id = jdbcTemplate.update(
				"INSERT INTO PO(PO_NUMBER,SUPPLIER_ID,PO_AMOUNT,PAID,OUTSTANDING,ITEM_DATA,USER_ID) VALUES(?,?,?,?,?,?,?)",
				new Object[] { po_number, supplier_id, amount, paid, outstanding, items_data, user });
		po_id = jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID();", int.class);
		System.out.println(po_id + "   po_id");
		mav = new ModelAndView("add_PO");
		mav.addObject("message", "Record created po id " + po_id);
		return mav;
	}
	
	@RequestMapping(value = "/generatePONumber")
	public ModelAndView generatePONumber(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String po = "PO10000";
		int count = jdbcTemplate.queryForObject("SELECT COUNT(0) FROM PO WHERE USER_ID=?", new Object[] {request.getSession().getAttribute("username").toString()},int.class);
		if(count==0) {
			po = po+1;
		}else {
			po = po+(count+1);
		}
		response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(po);
		return null;
	}

}
