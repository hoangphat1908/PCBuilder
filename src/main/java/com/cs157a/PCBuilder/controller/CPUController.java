package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs157a.PCBuilder.model.CPU;
import com.cs157a.PCBuilder.service.CPUService;

@Controller
public class CPUController {
	@Autowired
	private  CPUService cpuService;

	@RequestMapping("/cpu")
    public String cpu(Model model) {
    	List<CPU> users = cpuService.selectAll();
        model.addAttribute("userList",users);
        return "cpu_list";
    }
    
}
