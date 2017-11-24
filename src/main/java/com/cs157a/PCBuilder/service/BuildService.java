package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.Build;
import com.cs157a.PCBuilder.model.CPU;
import com.cs157a.PCBuilder.model.Motherboard;
import com.cs157a.PCBuilder.model.User;

public interface BuildService {
	public void insert(Build build);
	public void chooseCPU(Build build, CPU cpu);
	public void removeCPU(Build build);
	public void chooseMotherboard(Build build, Motherboard motherboard);
	public void removeMotherboard(Build build);
	public void delete(int buildId);
	public void insertRAM(Build build);
	public List<Build> selectAll();
	public List<Build> selectAll(User user);
	public Build get(int buildId);
}
