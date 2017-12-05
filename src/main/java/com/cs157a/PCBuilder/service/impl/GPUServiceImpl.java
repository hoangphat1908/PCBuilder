package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.GPU;
import com.cs157a.PCBuilder.service.GPUService;

@Service
public class GPUServiceImpl implements GPUService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<GPU> selectAll() {
		String sql = "SELECT * FROM gpu";		
		List<GPU> gpuList = jdbcTemplate.query(sql, new GPUMapper());
		return gpuList;
	}
	public GPU get(int gpuId) {
		String sql = "SELECT * FROM gpu WHERE id = ?";		
		List<GPU> gpuList = jdbcTemplate.query(sql, new GPUMapper(), new Object[] {gpuId});
		if (!gpuList.isEmpty())
			return gpuList.get(0);
		return null;
	}
}
class GPUMapper implements RowMapper<GPU> {
	public GPU mapRow(ResultSet result, int rowNum) throws SQLException {
		GPU gpu = new GPU();
		gpu.setId(result.getInt("id"));
		gpu.setManufacturer(result.getString("manufacturer"));
		gpu.setModel(result.getString("model"));
		gpu.setPrice(result.getDouble("price"));
		gpu.setImagePath("/resources/img/component/gpu/gpu_"+result.getInt("id")+".jpg");
		gpu.setSeries(result.getString("series"));
		gpu.setChipset(result.getString("chipset"));
		gpu.setMemory(result.getInt("memory"));
		gpu.setCoreClock(result.getDouble("core_clock"));
		
		return gpu;
	}
}