package com.billing.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.billing.service.UserService;
import com.billing.service.UserMapper;
import com.billing.model.Login;
import com.billing.model.User;

public class UserServiceImpl implements UserService {
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;

	public User register(User user) {
		String sql = "INSERT INTO USERS(USERNAME,PASSWORD,FIRSTNAME,LASTNAME,EMAIL,ROLE_ID,PHONE) VALUES(?,?,?,?,?,?,?)";
		System.out.println("getUsername - "+user.getUsername()+" getPassword - "+ user.getPassword()+" getFirstname - "+ user.getFirstname()+" getLastname - "+
				user.getLastname()+" getEmail - "+ user.getEmail()+" getRole_id - "+ user.getRole_id()+" getPhone - "+ user.getPhone() );
		jdbcTemplate.update(sql, new Object[] { user.getUsername(), user.getPassword(), user.getFirstname(),
				user.getLastname(), user.getEmail(), user.getRole_id(), user.getPhone() });
		return user;
	}

	public User validateUser(Login login) {
		String sql = "SELECT USERNAME,PASSWORD,FIRSTNAME,LASTNAME,EMAIL,ROLE_ID,PHONE FROM USERS WHERE EMAIL='" + login.getEmail() + "' AND PASSWORD='"
				+ login.getPassword() + "'";
		System.out.println("EMAIL - "+login.getEmail()+" password - "+login.getPassword());
		
		List<User> users = jdbcTemplate.query(sql, new UserMapper());
		System.out.println("user - "+users);
		return users.size() > 0 ? users.get(0) : null;
	}
}

class UserMapper implements RowMapper<User> {
	public User mapRow(ResultSet rs, int arg1) throws SQLException {
		User user = new User();
		user.setUsername(rs.getString("USERNAME"));
		user.setPassword(rs.getString("PASSWORD"));
		user.setFirstname(rs.getString("FIRSTNAME"));
		user.setLastname(rs.getString("LASTNAME"));
		user.setEmail(rs.getString("EMAIL"));
		user.setRole_id(rs.getString("ROLE_ID"));
		user.setPhone(rs.getString("PHONE"));
		return user;
	}
}
