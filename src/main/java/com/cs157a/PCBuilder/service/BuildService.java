package com.cs157a.PCBuilder.service;

import java.util.List;

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

public interface BuildService {
	public void newBuild();
	public void editName(Build build, String name);
	
	public void chooseCPU(Build build, CPU cpu);
	public void removeCPU(Build build);
	public void chooseMotherboard(Build build, Motherboard motherboard);
	public void removeMotherboard(Build build);
	public void chooseGPU(Build build, GPU gpu);
	public void removeGPU(Build build);
	public void choosePSU(Build build, PSU psu);
	public void removePSU(Build build);
	public void chooseCooler(Build build, Cooler cooler);
	public void removeCooler(Build build);
	public void chooseCase(Build build, Case computerCase);
	public void removeCase(Build build);
	
	public void insertRAM(Build build, RAM ram);
	public void removeRAM(Build build, RAM ram);
	public void insertStorage(Build build, Storage storage);
	public void removeStorage(Build build, Storage storage);
	
	public void delete(int buildId);
	public List<Build> selectAll();
	public List<Build> selectAll(User user);
	public Build get(int buildId);
}
