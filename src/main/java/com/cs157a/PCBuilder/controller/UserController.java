package com.cs157a.PCBuilder.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cs157a.PCBuilder.model.Build;
import com.cs157a.PCBuilder.model.Comment;
import com.cs157a.PCBuilder.model.Post;
import com.cs157a.PCBuilder.model.User;
import com.cs157a.PCBuilder.service.BuildService;
import com.cs157a.PCBuilder.service.CommentService;
import com.cs157a.PCBuilder.service.PostService;
import com.cs157a.PCBuilder.service.SecurityService;
import com.cs157a.PCBuilder.service.UserService;
import com.cs157a.PCBuilder.service.impl.UserServiceImpl;

 
@Controller
public class UserController {
	@Autowired
	private  UserService userService;
	
	@Autowired
	private SecurityService securityService;
	
	@Autowired
	private BuildService buildService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private CommentService commentService;

	@RequestMapping("/")
    public String home(Model model) {
    	List<User> users = userService.selectAll();
        
        model.addAttribute("userList",users);
        return "homepage";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user) {
    	userService.insert(user);
    	securityService.autologin(user.getUsername(), user.getPasswordConfirm());
		return "redirect:/profile";
	}
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
    
    @RequestMapping(value = {"/profile"}, method = RequestMethod.GET)
    public String profile(Model model) {
    	User user = userService.getCurrentUser();
    	List<Post> posts = postService.selectAll(user);
    	List<Comment> comments = commentService.selectAll(user);
    	Build build = buildService.get(user.getCurrentBuildId());
    	List<Build> builds = buildService.selectAll(user);
    	model.addAttribute("postList",posts);
    	model.addAttribute("commentList",comments); 
    	model.addAttribute("currentBuild", build);
    	model.addAttribute("buildList", builds);
        return "profile";
    }	
    
    @RequestMapping(value = {"/profile/remove/build/{id}"}, method = RequestMethod.GET)
    public String deleteBuild(@PathVariable("id") int id, Model model) {
    	buildService.delete(id);
        return "redirect:/profile";
    }
}