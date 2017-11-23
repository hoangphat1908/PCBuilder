package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.CPU;
import com.cs157a.PCBuilder.service.CPUService;
import com.cs157a.PCBuilder.service.UserService;

@Controller
public class CPUController {
	@Autowired
	private  CPUService cpuService;
	
	@Autowired UserService userService;

	@RequestMapping("/cpu")
    public String cpu(Model model) {
    	List<CPU> cpu = cpuService.selectAll();
        model.addAttribute("cpuList",cpu);
        return "component_list/cpu_list";
    }
	@RequestMapping(value = "/cpu/{id}", method = RequestMethod.POST)
	public String addCPU(@PathVariable("id") int id) {
		userService.updateCurrentBuild(cpuService.get(id));
		return "redirect:/mybuild";
	}
}
