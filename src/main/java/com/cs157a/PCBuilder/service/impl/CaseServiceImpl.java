package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.Case;
import com.cs157a.PCBuilder.service.CaseService;

@Service
public class CaseServiceImpl implements CaseService{
	@Autowired
	DataSource datasource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List<Case> selectAll() {
		String sql = "SELECT * FROM computer_case";		
		List<Case> caseList = jdbcTemplate.query(sql, new CaseMapper());
		return caseList;
	}
}
class CaseMapper implements RowMapper<Case> {
	public Case mapRow(ResultSet result, int rowNum) throws SQLException {
		Case computerCase = new Case();
		computerCase.setId(result.getInt("id"));
		computerCase.setManufacturer(result.getString("manufacturer"));
		computerCase.setModel(result.getString("model"));
		computerCase.setPrice(result.getDouble("price"));
		computerCase.setType(result.getString("type"));
		computerCase.setPsuIncluded(result.getString("psu_included") != null ? result.getString("psu_included") : "None");
		return computerCase;
	}
}