package com.cs157a.PCBuilder.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.cs157a.PCBuilder.model.User;

public class UserServiceImpl implements UserService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void insert(User user) {
		String sql = "INSERT INTO user (first_name, last_name, email, password)" + " VALUES (?, ?, ?, ?)";		
		jdbcTemplate.update(sql, new Object[] { user.getFirst(), user.getLast(), user.getEmail(), user.getPassword() });
	}

	public List<User> selectAll() {
		String sql = "SELECT * FROM user";		
		List<User> users = jdbcTemplate.query(sql, new UserMapper());
		return users;
	}

}
class UserMapper implements RowMapper<User> {
	  public User mapRow(ResultSet result, int rowNum) throws SQLException {
	    User user = new User();
	    user.setFirst(result.getString("first_name"));
	    user.setLast(result.getString("last_name"));
	    user.setEmail(result.getString("email"));
	    user.setPassword(result.getString("password"));
	    return user;
	  }
	}
