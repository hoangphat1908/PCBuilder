package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.User;

public interface UserService {
	public void insert(User user);
	public List<User> selectAll();
	public User find(String username);
	public User get(int userId);
	public User getCurrentUser();
}
