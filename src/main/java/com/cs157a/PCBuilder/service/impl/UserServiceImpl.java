package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.User;
import com.cs157a.PCBuilder.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	BCryptPasswordEncoder  bCryptPasswordEncoder;
	
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void insert(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		String sql = "INSERT INTO user (username, email, password)" + " VALUES (?, ?, ?)";		
		jdbcTemplate.update(sql, new Object[] { user.getUsername(), "", user.getPassword() });
	}

	public List<User> selectAll() {
		String sql = "SELECT * FROM user";		
		List<User> users = jdbcTemplate.query(sql, new UserMapper());
		return users;
	}

	public User find(String username) {
		String sql = "SELECT * FROM user WHERE username = ?";		
		List<User> users = jdbcTemplate.query(sql, new UserMapper(), new Object[] {username});
		if (!users.isEmpty())
			return users.get(0);
		return null;
	}

}
class UserMapper implements RowMapper<User> {
	public User mapRow(ResultSet result, int rowNum) throws SQLException {
		User user = new User();
		user.setId(result.getInt("id"));
		user.setUsername(result.getString("username"));
		user.setEmail(result.getString("email"));
		user.setPassword(result.getString("password"));
		return user;
	}
}
