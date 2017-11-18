package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.Cooler;

public interface CoolerService {
	public List<Cooler> selectAll();
	public Cooler get(int coolerId);
}
