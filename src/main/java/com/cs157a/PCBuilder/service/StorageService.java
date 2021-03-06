package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.Storage;

public interface StorageService {
	public List<Storage> selectAll();
	public Storage get(int storageId);
	public List<Storage> selectAll(int buildId);
}
