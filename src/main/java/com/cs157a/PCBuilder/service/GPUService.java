package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.GPU;

public interface GPUService {
	public List<GPU> selectAll();
	public GPU get(int gpuId);
}
