package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.Motherboard;
import com.cs157a.PCBuilder.service.MotherboardService;

@Service
public class MotherboardServiceImpl implements MotherboardService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Motherboard> selectAll() {
		String sql = "SELECT * FROM motherboard";		
		List<Motherboard> motherboardList = jdbcTemplate.query(sql, new MotherboardMapper());
		return motherboardList;
	}
	public Motherboard get(int motherboardId) {
		String sql = "SELECT * FROM motherboard WHERE id = ?";		
		List<Motherboard> motherboardList = jdbcTemplate.query(sql, new MotherboardMapper(), new Object[] {motherboardId});
		if (!motherboardList.isEmpty())
			return motherboardList.get(0);
		return null;
	}
}
class MotherboardMapper implements RowMapper<Motherboard> {
	public Motherboard mapRow(ResultSet result, int rowNum) throws SQLException {
		Motherboard motherboard = new Motherboard();
		motherboard.setId(result.getInt("id"));
		motherboard.setManufacturer(result.getString("manufacturer"));
		motherboard.setModel(result.getString("model"));
		motherboard.setPrice(result.getDouble("price"));
		motherboard.setImagePath("resources/img/motherboard/motherboard_"+result.getInt("id")+".jpg");
		motherboard.setFormFactor(result.getString("form_factor"));
		motherboard.setSocket(result.getString("socket"));
		motherboard.setRamSlots(result.getInt("ram_slots"));
		motherboard.setRamMax(result.getInt("ram_max"));
		
		return motherboard;
	}
}