package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.CPU;
import com.cs157a.PCBuilder.service.CPUService;
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
	public CPU get(int cpuId) {
		String sql = "SELECT * FROM cpu WHERE id = ?";		
		List<CPU> cpuList = jdbcTemplate.query(sql, new CPUMapper(), new Object[] {cpuId});
		if (!cpuList.isEmpty())
			return cpuList.get(0);
		return null;
	}
}
class CPUMapper implements RowMapper<CPU> {
	public CPU mapRow(ResultSet result, int rowNum) throws SQLException {
		CPU cpu = new CPU();
		cpu.setId(result.getInt("id"));
		cpu.setManufacturer(result.getString("manufacturer"));
		cpu.setModel(result.getString("model"));
		cpu.setPrice(result.getDouble("price"));
		cpu.setImagePath("resources/img/cpu/cpu_"+result.getInt("id")+".jpg");
		cpu.setCores(result.getInt("cores"));
		cpu.setClockSpeed(result.getDouble("clock_speed"));
		cpu.setTDP(result.getInt("TDP"));
		return cpu;
	}
}