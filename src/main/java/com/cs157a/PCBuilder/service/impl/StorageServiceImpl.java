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
	public Storage get(int storageId) {
		String sql = "SELECT * FROM storage WHERE id = ?";		
		List<Storage> storageList = jdbcTemplate.query(sql, new StorageMapper(), new Object[] {storageId});
		if (!storageList.isEmpty())
			return storageList.get(0);
		return null;
	}
	@Override
	public List<Storage> selectAll(int buildId) {
		String sql = "SELECT s.* "
				+ "FROM build_storage bs INNER JOIN storage s "
				+ "ON bs.storage_id = s.id "
				+ "WHERE bs.build_id = ?";
		List<Storage> storageList = jdbcTemplate.query(sql, new StorageMapper(), new Object[] {buildId});
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
		storage.setImagePath("/resources/img/component/storage/storage_"+result.getInt("id")+".jpg");
		storage.setType(result.getString("type"));
		storage.setForm(result.getString("form"));
		storage.setSeries(result.getString("series"));
		storage.setCapacity(result.getString("capacity"));
		storage.setCache(result.getString("cache")!= null? result.getString("cache") : "N/A");
		return storage;
	}
}