package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.Comment;
import com.cs157a.PCBuilder.model.Post;
import com.cs157a.PCBuilder.service.CommentService;
import com.cs157a.PCBuilder.service.PostService;
import com.cs157a.PCBuilder.service.UserService;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	UserService userService;
	
	@Autowired
	PostService postService;
	public List<Comment> selectAll(Post post) {
		String sql = "SELECT * FROM comment WHERE post_id = ?";		
		List<Comment> commentList = jdbcTemplate.query(sql, new CommentMapper(), new Object[] {post.getId()});
		if (commentList.size() > 0)
			return commentList;
		return null;
	}
	class CommentMapper implements RowMapper<Comment> {
		public Comment mapRow(ResultSet result, int rowNum) throws SQLException {
			Comment comment = new Comment();
			comment.setId(result.getInt("id"));
			comment.setUser(userService.get(result.getInt("user_id")));
			comment.setPost(postService.get(result.getInt("post_id")));
			comment.setBody(result.getString("body"));
			return comment;
		}
	}
}
