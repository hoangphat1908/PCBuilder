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
import com.cs157a.PCBuilder.model.CPU;
import com.cs157a.PCBuilder.model.Motherboard;
import com.cs157a.PCBuilder.model.RAM;
import com.cs157a.PCBuilder.model.Storage;
import com.cs157a.PCBuilder.model.User;
import com.cs157a.PCBuilder.service.BuildService;
import com.cs157a.PCBuilder.service.CPUService;
import com.cs157a.PCBuilder.service.CaseService;
import com.cs157a.PCBuilder.service.GPUService;
import com.cs157a.PCBuilder.service.MotherboardService;
import com.cs157a.PCBuilder.service.PSUService;
import com.cs157a.PCBuilder.service.RAMService;
import com.cs157a.PCBuilder.service.StorageService;
import com.cs157a.PCBuilder.service.UserService;
import com.cs157a.PCBuilder.service.impl.PostServiceImpl.PostMapper;
import com.cs157a.PCBuilder.service.CoolerService;

@Service
public class BuildServiceImpl implements BuildService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	UserService userService;
	@Autowired
	CPUService cpuService;
	@Autowired
	MotherboardService motherboardService;
	@Autowired
	GPUService gpuService;
	@Autowired
	PSUService psuService;
	@Autowired
	RAMService ramService;
	@Autowired
	StorageService storageService;
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
						pst.setInt(1, insertBuild.getUser().getId());
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
	
	public void chooseCPU(Build build, CPU cpu) {
		String sql = "UPDATE build SET cpu_id = ? WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { cpu.getId(), build.getId() });
	}
	
	public void removeCPU(Build build) {
		String sql = "UPDATE build SET cpu_id = NULL WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { build.getId() });
	}

	public void chooseMotherboard(Build build, Motherboard motherboard) {
		String sql = "UPDATE build SET motherboard_id = ? WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { motherboard.getId(), build.getId() });
	}

	public void removeMotherboard(Build build) {
		String sql = "UPDATE build SET motherboard_id = NULL WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { build.getId() });
	}
	
	public void delete(int buildId) {
		// TODO Auto-generated method stub
		
	}

	public List<Build> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<Build> selectAll(User user) {
		String sql = "SELECT * FROM build WHERE user_id = ?";		
		List<Build> buildList = jdbcTemplate.query(sql, new BuildMapper(), new Object[] {user.getId()});
		if (buildList.size() > 0)
			return buildList;
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
			build.setId(result.getInt("id"));
			build.setUser(userService.get(result.getInt("user_id")));
			build.setName(result.getString("name"));
			build.setCpu(cpuService.get(result.getInt("cpu_id")));
			build.setMotherboard(motherboardService.get(result.getInt("motherboard_id")));
			build.setGpu(gpuService.get(result.getInt("gpu_id")));
			build.setPsu(psuService.get(result.getInt("psu_id")));
			build.setRamList(ramService.selectAll(result.getInt("id")));
			build.setCooler(coolerService.get(result.getInt("cooler_id")));
			build.setComputerCase(caseService.get(result.getInt("computer_case_id")));
			return build;
		}
	}
}

