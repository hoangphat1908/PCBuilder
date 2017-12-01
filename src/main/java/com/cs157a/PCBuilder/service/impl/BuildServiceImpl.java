package com.cs157a.PCBuilder.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
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
import com.cs157a.PCBuilder.model.Case;
import com.cs157a.PCBuilder.model.Cooler;
import com.cs157a.PCBuilder.model.GPU;
import com.cs157a.PCBuilder.model.Motherboard;
import com.cs157a.PCBuilder.model.PSU;
import com.cs157a.PCBuilder.model.RAM;
import com.cs157a.PCBuilder.model.Storage;
import com.cs157a.PCBuilder.model.User;
import com.cs157a.PCBuilder.service.BuildService;
import com.cs157a.PCBuilder.service.CPUService;
import com.cs157a.PCBuilder.service.CaseService;
import com.cs157a.PCBuilder.service.GPUService;
import com.cs157a.PCBuilder.service.MotherboardService;
import com.cs157a.PCBuilder.service.PSUService;
import com.cs157a.PCBuilder.service.PostService;
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
	PostService postService;
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
	
	public void newBuild() {
		User user = userService.getCurrentUser();
		if (user != null) {
			final String sql1 = "INSERT INTO build (user_id, name)" + " VALUES (?, ?)";		
			KeyHolder keyHolder = new GeneratedKeyHolder();
			jdbcTemplate.update(
					new PreparedStatementCreator() {
						public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
							PreparedStatement pst = 
									con.prepareStatement(sql1, new String[] {"id"});
							pst.setInt(1, user.getId());
							pst.setString(2, "");
							return pst;
						}
						
					}, 
					keyHolder);
			int buildId = (int) (long) keyHolder.getKey();
			String sql2 = "UPDATE build SET name = ? WHERE id = ?";		
			jdbcTemplate.update(sql2, new Object[] { "Build #"+buildId, buildId });
			userService.setCurrentBuild(buildId);
		}
	}
	
	public void editName(Build build, String name) {
		String sql = "UPDATE build SET name = ? WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { name, build.getId() });
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
	
	
	
	@Override
	public void chooseGPU(Build build, GPU gpu) {
		String sql = "UPDATE build SET gpu_id = ? WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { gpu.getId(), build.getId() });
	}

	@Override
	public void removeGPU(Build build) {
		String sql = "UPDATE build SET gpu_id = NULL WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { build.getId() });
	}

	@Override
	public void choosePSU(Build build, PSU psu) {
		String sql = "UPDATE build SET psu_id = ? WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { psu.getId(), build.getId() });
	}

	@Override
	public void removePSU(Build build) {
		String sql = "UPDATE build SET psu_id = NULL WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { build.getId() });
	}

	@Override
	public void chooseCooler(Build build, Cooler cooler) {
		String sql = "UPDATE build SET cooler_id = ? WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { cooler.getId(), build.getId() });
	}

	@Override
	public void removeCooler(Build build) {
		String sql = "UPDATE build SET cooler_id = NULL WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { build.getId() });
	}

	@Override
	public void chooseCase(Build build, Case computerCase) {
		String sql = "UPDATE build SET computer_case_id = ? WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { computerCase.getId(), build.getId() });
	}

	@Override
	public void removeCase(Build build) {
		String sql = "UPDATE build SET computer_case_id = NULL WHERE id = ?";		
		jdbcTemplate.update(sql, new Object[] { build.getId() });
	}
	
	public void insertRAM(Build build, RAM ram) {
		String sql = "INSERT INTO build_ram (build_id, ram_id)" + " VALUES (?, ?)";		
		jdbcTemplate.update(sql, new Object[] { build.getId(), ram.getId() });
	}

	public void removeRAM(Build build, RAM ram) {
		String sql = "DELETE FROM build_ram WHERE build_id = ? AND ram_id = ? LIMIT 1";		
		jdbcTemplate.update(sql, new Object[] { build.getId(), ram.getId() });
	}

	@Override
	public void insertStorage(Build build, Storage storage) {
		String sql = "INSERT INTO build_storage (build_id, storage_id)" + " VALUES (?, ?)";		
		jdbcTemplate.update(sql, new Object[] { build.getId(), storage.getId() });
	}

	@Override
	public void removeStorage(Build build, Storage storage) {
		String sql = "DELETE FROM build_storage WHERE build_id = ? AND storage_id = ? LIMIT 1";		
		jdbcTemplate.update(sql, new Object[] { build.getId(), storage.getId() });
	}
	
	public void delete(int buildId) {
		User user = userService.getCurrentUser();
		
		postService.deleteBuild(buildId);
		if (user != null) {
			String sql1 = "DELETE FROM build_ram WHERE build_id = ?";		
			jdbcTemplate.update(sql1, new Object[] { buildId });
			
			String sql2 = "DELETE FROM build_storage WHERE build_id = ?";		
			jdbcTemplate.update(sql2, new Object[] { buildId });	
		
			if (user.getCurrentBuildId() == buildId) {
				String sql3 = "UPDATE user SET current_build_id = NULL WHERE id = ?";		
				jdbcTemplate.update(sql3, new Object[] { user.getId() });
			}
			
			String sql4 = "DELETE FROM build WHERE id = ?";		
			jdbcTemplate.update(sql4, new Object[] { buildId });
			
		}
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
	
	class BuildMapper implements RowMapper<Build> {
		
		public Build mapRow(ResultSet result, int rowNum) throws SQLException {
			Build build = new Build();
			build.setId(result.getInt("id"));
			build.setUser(userService.get(result.getInt("user_id")));
			build.setName(result.getString("name"));
			build.setPublic(result.getBoolean("public"));
			build.setCpu(cpuService.get(result.getInt("cpu_id")));
			build.setMotherboard(motherboardService.get(result.getInt("motherboard_id")));
			build.setGpu(gpuService.get(result.getInt("gpu_id")));
			build.setPsu(psuService.get(result.getInt("psu_id")));
			List<RAM> ramList = ramService.selectAll(result.getInt("id"));
			Collections.sort(ramList, (a, b) -> a.getModel().compareTo(b.getModel()));
			build.setRamList(ramList);
			List<Storage> storageList = storageService.selectAll(result.getInt("id"));
			Collections.sort(storageList, (a, b) -> a.getModel().compareTo(b.getModel()));
			build.setStorageList(storageList);
			build.setCooler(coolerService.get(result.getInt("cooler_id")));
			build.setComputerCase(caseService.get(result.getInt("computer_case_id")));
			build.calculateCost();
			return build;
		}
	}
}

