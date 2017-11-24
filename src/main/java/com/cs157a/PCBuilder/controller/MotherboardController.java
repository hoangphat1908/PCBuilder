package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.Motherboard;
import com.cs157a.PCBuilder.service.MotherboardService;
import com.cs157a.PCBuilder.service.UserService;

@Controller
public class MotherboardController {
	@Autowired 
	private UserService userService;
	
	@Autowired
	private  MotherboardService motherboardService;

	@RequestMapping("/motherboard")
    public String motherboard(Model model) {
    	List<Motherboard> motherboard = motherboardService.selectAll();
        model.addAttribute("motherboardList",motherboard);
        return "component_list/motherboard_list";
    }
	@RequestMapping(value = "/motherboard/{id}", method = RequestMethod.POST)
	public String addMotherboard(@PathVariable("id") int id) {
		userService.updateCurrentBuild(motherboardService.get(id));
		return "redirect:/mybuild";
	}
}
