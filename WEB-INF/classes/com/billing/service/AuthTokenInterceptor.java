package com.billing.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthTokenInterceptor extends HandlerInterceptorAdapter {
    public boolean preHandle(HttpServletRequest request,
        HttpServletResponse response, Object handler) throws Exception {
    HttpSession session = request.getSession();
    System.out.println("Inside preHandle");
    if(null == request.getSession(false)){   
                        System.out.println("Inside if");
        response.sendRedirect("login.html");
        return false;
    }
    return true;
}
}