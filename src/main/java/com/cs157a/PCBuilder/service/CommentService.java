package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.Comment;
import com.cs157a.PCBuilder.model.Post;
import com.cs157a.PCBuilder.model.User;

public interface CommentService {
	public void insert(Comment comment);
	public List<Comment> selectAll(Post post);
	public List<Comment> selectAll(User user);
}
