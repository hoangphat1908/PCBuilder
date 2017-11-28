package com.cs157a.PCBuilder.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cs157a.PCBuilder.model.Post;
import com.cs157a.PCBuilder.model.User;
import com.cs157a.PCBuilder.service.BuildService;
import com.cs157a.PCBuilder.service.CommentService;
import com.cs157a.PCBuilder.service.PostService;
import com.cs157a.PCBuilder.service.UserService;
import com.cs157a.PCBuilder.service.impl.BuildServiceImpl.BuildMapper;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	DataSource dataSource;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	UserService userService;
	@Autowired
	CommentService commentService;
	@Autowired
	BuildService buildService;
	public void insert(Post post) {
		if (userService.getCurrentUser() == null)
			return;
		if (post.getBuildId() > 0) {
			String sql = "INSERT INTO post (user_id, title, body, build_id)" + " VALUES (?, ?, ?, ?)";		
			jdbcTemplate.update(sql, new Object[] { userService.getCurrentUser().getId(), post.getTitle(), post.getBody(), post.getBuildId() });
		}
		else {
			String sql = "INSERT INTO post (user_id, title, body)" + " VALUES (?, ?, ?)";		
			jdbcTemplate.update(sql, new Object[] { userService.getCurrentUser().getId(), post.getTitle(), post.getBody() });			
		}
	}

	public void update(Post post) {
		// TODO Auto-generated method stub
		
	}

	public Post get(int postId) {
		String sql = "SELECT * FROM post WHERE id = ?";		
		List<Post> postList = jdbcTemplate.query(sql, new PostMapper(), new Object[] {postId});
		if (!postList.isEmpty())
			return postList.get(0);
		return null;
	}
	public Post getSimple(int postId) {
		String sql = "SELECT * FROM post WHERE id = ?";		
		List<Post> postList = jdbcTemplate.query(sql, new PostMapper(), new Object[] {postId});
		if (!postList.isEmpty())
			return postList.get(0);
		return null;
	}
	public List<Post> selectAll() {
		String sql = "SELECT * FROM post";		
		List<Post> postList = jdbcTemplate.query(sql, new PostMapper());
		return postList;
	}
	public List<Post> selectAll(User user) {
		String sql = "SELECT * FROM post WHERE user_id = ?";		
		List<Post> postList = jdbcTemplate.query(sql, new PostMapper(), new Object[] {user.getId()});
		if (postList.size() > 0)
			return postList;
		return null;
	}
	class PostMapper implements RowMapper<Post> {
		public Post mapRow(ResultSet result, int rowNum) throws SQLException {
			Post post = new Post();
			post.setId(result.getInt("id"));
			post.setUser(userService.get(result.getInt("user_id")));
			post.setTitle(result.getString("title"));
			post.setBody(result.getString("body"));
			post.setCommentList(commentService.selectAll(result.getInt("id")));
			post.setBuildId(result.getInt("build_id"));
			return post;
		}
	}
}
