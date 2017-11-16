package com.cs157a.PCBuilder.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.CPU;
@Service
public class CPUServiceImpl implements CPUService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<CPU> selectAll() {
		String sql = "SELECT * FROM cpu";		
		List<CPU> cpuList = jdbcTemplate.query(sql, new CPUMapper());
		return cpuList;
	}
}
class CPUMapper implements RowMapper<CPU> {
	public CPU mapRow(ResultSet result, int rowNum) throws SQLException {
		CPU cpu = new CPU();
		cpu.setId(result.getInt("id"));
		cpu.setName(result.getString("name"));
		cpu.setManufacturer(result.getString("manufacturer"));
		cpu.setPrice(result.getDouble("price"));
		cpu.setCores(result.getInt("cores"));
		cpu.setClockSpeed(result.getDouble("clock_speed"));
		cpu.setTDP(result.getInt("TDP"));
		return cpu;
	}
}