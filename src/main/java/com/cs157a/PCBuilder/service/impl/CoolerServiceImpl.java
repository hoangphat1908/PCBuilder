package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.Cooler;
import com.cs157a.PCBuilder.service.CoolerService;

@Service
public class CoolerServiceImpl implements CoolerService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Cooler> selectAll() {
		String sql = "SELECT * FROM cooler";		
		List<Cooler> coolerList = jdbcTemplate.query(sql, new CoolerMapper());
		return coolerList;
	}
	public Cooler get(int coolerId) {
		String sql = "SELECT * FROM cooler WHERE id = ?";		
		List<Cooler> coolerList = jdbcTemplate.query(sql, new CoolerMapper(), new Object[] {coolerId});
		if (!coolerList.isEmpty())
			return coolerList.get(0);
		return null;
	}
}
class CoolerMapper implements RowMapper<Cooler> {
	public Cooler mapRow(ResultSet result, int rowNum) throws SQLException {
		Cooler cooler = new Cooler();
		cooler.setId(result.getInt("id"));
		cooler.setManufacturer(result.getString("manufacturer"));
		cooler.setModel(result.getString("model"));
		cooler.setPrice(result.getDouble("price"));
		cooler.setImagePath("resources/img/cooler/cooler_"+result.getInt("id")+".jpg");
		cooler.setRpm(result.getString("rpm"));
		cooler.setNoise(result.getString("noise"));
		return cooler;
	}
}