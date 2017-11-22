package com.cs157a.PCBuilder.service;

import java.util.List;

import com.cs157a.PCBuilder.model.Comment;
import com.cs157a.PCBuilder.model.Post;

public interface CommentService {
	public List<Comment> selectAll(Post post);
}
