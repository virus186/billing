package com.billing.service;


import java.util.List;

import org.springframework.beans.BeansException;

import org.springframework.context.ApplicationContext;

import org.springframework.context.ApplicationContextAware;

import org.springframework.jdbc.core.JdbcTemplate;

 

public class SpringContext implements ApplicationContextAware {
       protected static ApplicationContext ctx;
       public static String THEME = "blue";
       public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
             ctx = applicationContext;
       }
       public static ApplicationContext getContext() {
             return ctx;
       }
       public static JdbcTemplate getJdbcTemplate() {
             return (JdbcTemplate) ctx.getBean("jdbcTemplate");
       }
       public static String getDB_Name() {
             return (String) ctx.getBean("DB_NAME");
       }
       public static String getCoreFile() {
             return (String) ctx.getBean("coreFile");
       }
       public static List<String> getAllowExternalLinks() {
             return (List) ctx.getBean("allowExternalLinks");
       }
}
