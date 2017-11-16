package com.cs157a.PCBuilder.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.RAM;

@Service
public class RAMServiceImpl implements RAMService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<RAM> selectAll() {
		String sql = "SELECT * FROM ram";		
		List<RAM> ramList = jdbcTemplate.query(sql, new RAMMapper());
		return ramList;
	}}
class RAMMapper implements RowMapper<RAM> {
	public RAM mapRow(ResultSet result, int rowNum) throws SQLException {
		RAM cpu = new RAM();
		cpu.setId(result.getInt("id"));
		cpu.setName(result.getString("name"));
		cpu.setManufacturer(result.getString("manufacturer"));
		cpu.setPrice(result.getDouble("price"));
		cpu.setSize(result.getInt("size"));
		cpu.setModule(result.getString("module"));
		cpu.setType(result.getString("type"));
		cpu.setSpeed(result.getString("speed"));
		
		return cpu;
	}
}