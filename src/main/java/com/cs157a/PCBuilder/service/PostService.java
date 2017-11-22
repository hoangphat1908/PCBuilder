package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.Post;

public interface PostService {
	public void insert(Post post);
	public void update(Post post);
	public Post get(int postId);
	public List<Post> selectAll();
}
