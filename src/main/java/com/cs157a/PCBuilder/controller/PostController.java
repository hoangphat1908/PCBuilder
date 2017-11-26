package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.Comment;
import com.cs157a.PCBuilder.model.Post;
import com.cs157a.PCBuilder.model.User;
import com.cs157a.PCBuilder.service.CommentService;
import com.cs157a.PCBuilder.service.PostService;
import com.cs157a.PCBuilder.service.UserService;

@Controller
public class PostController {
	@Autowired
	private  PostService postService;
	
	@Autowired
	private  CommentService commentService;
	
	@Autowired
	private  UserService userService;
	
	@RequestMapping("/post")
    public String post(Model model) {
    	List<Post> post = postService.selectAll();
        model.addAttribute("postList",post);
        return "post_list";
    }
	
	@RequestMapping("/post/new")
    public String newPost(Model model) {
        model.addAttribute("post",new Post());
        return "post_new";
    }
	
    @RequestMapping(value = "/post/new", method = RequestMethod.POST)
	public String createPost(@ModelAttribute("post") Post post) {
    	postService.insert(post);
		return "redirect:/post";
	}

	@RequestMapping("/post/{id}")
    public String viewPost(@PathVariable("id") int id, Model model) {
		Post post = postService.get(id);
        model.addAttribute("post",post);
        model.addAttribute("comment", new Comment());
        return "post_view";
    }
	@RequestMapping(value = "/post/{id}", method = RequestMethod.POST)
	public String createComment(@PathVariable("id") int id, @ModelAttribute("comment") Comment comment) {
		comment.setPost(postService.get(id));
		commentService.insert(comment);
		return "redirect:/post/{id}";
	}
}
