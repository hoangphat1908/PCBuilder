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
import com.cs157a.PCBuilder.model.User;
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
	public void insert(Comment comment) {
		if (userService.getCurrentUser() == null)
			return;
		String sql = "INSERT INTO comment (user_id, post_id, body)" + " VALUES (?, ?, ?)";		
		jdbcTemplate.update(sql, new Object[] { userService.getCurrentUser().getId(), comment.getPost().getId(), comment.getBody() });
	}
	public List<Comment> selectAll(User user) {
		String sql = "SELECT * FROM comment WHERE user_id = ?";		
		List<Comment> commentList = jdbcTemplate.query(sql, new CommentMapper(), new Object[] {user.getId()});
		if (commentList.size() > 0)
			return commentList;
		return null;
	}
	public List<Comment> selectAll(int postId) {
		String sql = "SELECT * FROM comment WHERE post_id = ?";		
		List<Comment> commentList = jdbcTemplate.query(sql, new SimpleCommentMapper(), new Object[] {postId});
		if (commentList.size() > 0)
			return commentList;
		return null;
	}
	class SimpleCommentMapper implements RowMapper<Comment> {
		public Comment mapRow(ResultSet result, int rowNum) throws SQLException {
			Comment comment = new Comment();
			comment.setId(result.getInt("id"));
			comment.setUser(userService.get(result.getInt("user_id")));
			comment.setBody(result.getString("body"));
			return comment;
		}
	}
	class CommentMapper implements RowMapper<Comment> {
		public Comment mapRow(ResultSet result, int rowNum) throws SQLException {
			Comment comment = new Comment();
			comment.setId(result.getInt("id"));
			comment.setUser(userService.get(result.getInt("user_id")));
			comment.setPost(postService.getSimple(result.getInt("post_id")));
			comment.setBody(result.getString("body"));
			return comment;
		}
	}
}
