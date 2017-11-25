package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.RAM;

public interface RAMService {
	public List<RAM> selectAll();
	public RAM get(int ramId);
	public List<RAM> selectAll(int buildId);
}
