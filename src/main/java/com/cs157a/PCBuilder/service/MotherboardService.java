package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.Motherboard;

public interface MotherboardService {
	public List<Motherboard> selectAll();
	public Motherboard get(int motherBoardId);
}
