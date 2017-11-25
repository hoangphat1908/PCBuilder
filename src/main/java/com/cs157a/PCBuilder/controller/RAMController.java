package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.RAM;
import com.cs157a.PCBuilder.service.RAMService;
import com.cs157a.PCBuilder.service.UserService;

@Controller
public class RAMController {
	@Autowired 
	private UserService userService;
	
	@Autowired
	private  RAMService ramService;

	@RequestMapping("/ram")
    public String ram(Model model) {
    	List<RAM> ram = ramService.selectAll();
        model.addAttribute("ramList",ram);
        return "component_list/ram_list";
    }
	@RequestMapping(value = "/ram/{id}", method = RequestMethod.POST)
	public String addRAM(@PathVariable("id") int id) {
		userService.updateCurrentBuild(ramService.get(id));
		return "redirect:/mybuild";
	}
}
