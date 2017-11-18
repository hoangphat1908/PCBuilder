package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.PSU;
import com.cs157a.PCBuilder.service.PSUService;

@Service
public class PSUServiceImpl implements PSUService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<PSU> selectAll() {
		String sql = "SELECT * FROM psu";		
		List<PSU> psuList = jdbcTemplate.query(sql, new PSUMapper());
		return psuList;
	}
	public PSU get(int psuId) {
		String sql = "SELECT * FROM psu WHERE id = ?";		
		List<PSU> psuList = jdbcTemplate.query(sql, new PSUMapper(), new Object[] {psuId});
		if (!psuList.isEmpty())
			return psuList.get(0);
		return null;
	}
}
class PSUMapper implements RowMapper<PSU> {
	public PSU mapRow(ResultSet result, int rowNum) throws SQLException {
		PSU psu = new PSU();
		psu.setId(result.getInt("id"));
		psu.setManufacturer(result.getString("manufacturer"));
		psu.setModel(result.getString("model"));
		psu.setPrice(result.getDouble("price"));
		psu.setSeries(result.getString("series"));
		psu.setFormFactor(result.getString("form_factor"));
		psu.setWatts(result.getString("watts"));
		psu.setEfficiency(result.getString("efficiency"));
		psu.setModular(result.getString("modular"));
		return psu;
	}
}