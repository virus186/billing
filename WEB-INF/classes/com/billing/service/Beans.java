package com.billing.service;

import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

public class Beans extends SpringContext {

	public static String getApplicationName() {
		return (String) ctx.getBean("app.name");
	}

	public static String getApplicationVersion() {
		return (String) ctx.getBean("app.version");
	}

	public static String getAmazonSiteURL(String countryCode) {
		return "https://mws.amazonservices.in";
	}

	public static String getImagesPath(String userId) {
		return (String) getJdbcTemplate().queryForObject("SELECT IMAGE_URL FROM PROFILE_SETTINGS WHERE USER_ID = ?",
				new String[] { userId }, String.class);
	}

	public static String getContextHome() {
		return (String) ctx.getBean("contextHome");
	}

	public static JdbcTemplate getJdbcTemplate() {
		return (JdbcTemplate) ctx.getBean("jdbcTemplate");
	}

	public static Map<String, Map> getFeildsInfoMap() {
		return (Map) ctx.getBean("feildsInfoMap");
	}
}