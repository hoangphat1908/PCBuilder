package com.cs157a.PCBuilder.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cs157a.PCBuilder.model.User;
import com.cs157a.PCBuilder.service.UserService;
import com.cs157a.PCBuilder.service.UserServiceImpl;

 
@Controller
public class HelloWorldController {
	@Autowired
	private  UserService userService;

 
    @RequestMapping("/hello")
    public String hello(Model model) {
    	List<User> users = userService.selectAll();
        
        model.addAttribute("userList",users);
        model.addAttribute("user", new User());
        return "helloworld";
    }
    
    @RequestMapping(value = "/hello", method = RequestMethod.POST)
	public String addUser(HttpServletRequest request, HttpServletResponse response,
  		  @ModelAttribute("user") User user) {
    	userService.insert(user);
		return "redirect:/hello";
	}
}