package com.cs157a.PCBuilder.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.Build;
import com.cs157a.PCBuilder.model.RAM;
import com.cs157a.PCBuilder.model.Storage;
import com.cs157a.PCBuilder.service.BuildService;
import com.cs157a.PCBuilder.service.CPUService;
import com.cs157a.PCBuilder.service.CaseService;
import com.cs157a.PCBuilder.service.GPUService;
import com.cs157a.PCBuilder.service.MotherboardService;
import com.cs157a.PCBuilder.service.PSUService;
import com.cs157a.PCBuilder.service.CoolerService;

@Service
public class BuildServiceImpl implements BuildService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	CPUService cpuService;
	@Autowired
	MotherboardService motherboardService;
	@Autowired
	GPUService gpuService;
	@Autowired
	PSUService psuService;
	@Autowired
	CoolerService coolerService;
	@Autowired
	CaseService caseService;
	
	public void insert(Build build) {
		final String sql1 = "INSERT INTO build (user_id, name, cpu_id, motherboard_id, gpu_id, psu_id, cooler_id, computer_case_id)" + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";		
		final Build insertBuild = build;
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(
				new PreparedStatementCreator() {
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						PreparedStatement pst = 
								con.prepareStatement(sql1, new String[] {"id"});
						pst.setString(1, insertBuild.getUsername());
						pst.setString(2, insertBuild.getName());
						pst.setInt(3, insertBuild.getCpu().getId());
						pst.setInt(4, insertBuild.getMotherboard().getId());
						pst.setInt(5, insertBuild.getGpu().getId());
						pst.setInt(6, insertBuild.getPsu().getId());
						pst.setInt(7, insertBuild.getCooler().getId());
						pst.setInt(8, insertBuild.getComputerCase().getId());
						return pst;
					}
					
				}, 
				keyHolder);
		int buildId = (Integer) keyHolder.getKey();
		
		String sql2 = "INSERT INTO build_ram (build_id, ram_id)" + " VALUES (?, ?)";		
		for (RAM ram : insertBuild.getRamList())
			jdbcTemplate.update(sql2, new Object[] { buildId, ram.getId() });

		String sql3 = "INSERT INTO build_storage (build_id, storage_id)" + " VALUES (?, ?)";		
		for (Storage storage : insertBuild.getStorageList())
			jdbcTemplate.update(sql3, new Object[] { buildId, storage.getId() });
	}

	public void update(Build build) {
		// TODO Auto-generated method stub
		
	}

	public void delete(int buildId) {
		// TODO Auto-generated method stub
		
	}

	public List<Build> findAll(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Build get(int buildId) {
		String sql = "SELECT * FROM build WHERE id = ?";		
		List<Build> caseList = jdbcTemplate.query(sql, new BuildMapper(), new Object[] {buildId});
		if (!caseList.isEmpty())
			return caseList.get(0);
		return null;
	}

	public void insertRAM(Build buid) {
		// TODO Auto-generated method stub
		
	}
	class BuildMapper implements RowMapper<Build> {
		
		public Build mapRow(ResultSet result, int rowNum) throws SQLException {
			Build build = new Build();
			build.setUsername(result.getString("username"));
			build.setName(result.getString("name"));
			build.setCpu(cpuService.get(result.getInt("cpu_id")));
			build.setMotherboard(motherboardService.get(result.getInt("motherboard_id")));
			build.setGpu(gpuService.get(result.getInt("gpu_id")));
			build.setPsu(psuService.get(result.getInt("psu_id")));
			build.setCooler(coolerService.get(result.getInt("cooler_id")));
			build.setComputerCase(caseService.get(result.getInt("computer_case_id")));
			return build;
		}
	}
}

