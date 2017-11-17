package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.Storage;
import com.cs157a.PCBuilder.service.StorageService;

@Service
public class StorageServiceImpl implements StorageService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Storage> selectAll() {
		String sql = "SELECT * FROM storage";		
		List<Storage> storageList = jdbcTemplate.query(sql, new StorageMapper());
		return storageList;
	}
}
class StorageMapper implements RowMapper<Storage> {
	public Storage mapRow(ResultSet result, int rowNum) throws SQLException {
		Storage storage = new Storage();
		storage.setId(result.getInt("id"));
		storage.setManufacturer(result.getString("manufacturer"));
		storage.setModel(result.getString("model"));
		storage.setPrice(result.getDouble("price"));
		storage.setType(result.getString("type"));
		storage.setForm(result.getString("form"));
		storage.setSeries(result.getString("series"));
		storage.setCapacity(result.getString("capacity"));
		storage.setCache(result.getString("cache")!= null? result.getString("cache") : "N/A");
		
		return storage;
	}
}