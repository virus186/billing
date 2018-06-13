package com.billing.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@WebListener
public class ThemeControllor {

	//	private static final Logger LOGGER = Logger.getLogger(ThemeControllor.class.getName());

	public void contextInitialized(ServletContextEvent event) {
        ServletContext sc = event.getServletContext();
        sc.setAttribute("ctx", sc.getContextPath());
    }

    public void contextDestroyed(ServletContextEvent event) {}

}
