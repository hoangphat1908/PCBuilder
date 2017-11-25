package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.RAM;
import com.cs157a.PCBuilder.service.RAMService;

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
	}
	public RAM get(int ramId) {
		String sql = "SELECT * FROM ram WHERE id = ?";		
		List<RAM> ramList = jdbcTemplate.query(sql, new RAMMapper(), new Object[] {ramId});
		if (!ramList.isEmpty())
			return ramList.get(0);
		return null;
	}
	public List<RAM> selectAll(int buildId) {
		String sql = "SELECT r.* "
				+ "FROM build_ram br INNER JOIN ram r "
				+ "ON br.ram_id = r.id "
				+ "WHERE br.build_id = ?";
		List<RAM> ramList = jdbcTemplate.query(sql, new RAMMapper(), new Object[] {buildId});
		return ramList;
	}
}
class RAMMapper implements RowMapper<RAM> {
	public RAM mapRow(ResultSet result, int rowNum) throws SQLException {
		RAM cpu = new RAM();
		cpu.setId(result.getInt("id"));
		cpu.setManufacturer(result.getString("manufacturer"));
		cpu.setModel(result.getString("model"));
		cpu.setPrice(result.getDouble("price"));
		cpu.setSize(result.getInt("size"));
		cpu.setModule(result.getString("module"));
		cpu.setType(result.getString("type"));
		cpu.setSpeed(result.getString("speed"));
		
		return cpu;
	}
}