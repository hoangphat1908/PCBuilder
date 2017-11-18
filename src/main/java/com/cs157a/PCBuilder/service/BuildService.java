package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.Build;

public interface BuildService {
	public void insert(Build build);
	public void update(Build build);
	public void delete(int buildId);
	public void insertRAM(Build build);
	public List<Build> findAll(int userId);
	public Build get(int buildId);
}
