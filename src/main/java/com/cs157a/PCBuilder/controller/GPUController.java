package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.GPU;
import com.cs157a.PCBuilder.service.GPUService;
import com.cs157a.PCBuilder.service.UserService;

@Controller
public class GPUController {
	@Autowired 
	private UserService userService;
	
	@Autowired
	private  GPUService gpuService;

	@RequestMapping("/gpu")
    public String gpu(Model model) {
    	List<GPU> gpu = gpuService.selectAll();
        model.addAttribute("gpuList",gpu);
        return "component_list/gpu_list";
    }
	@RequestMapping(value = "/gpu/{id}", method = RequestMethod.POST)
	public String addGPU(@PathVariable("id") int id) {
		userService.updateCurrentBuild(gpuService.get(id));
		return "redirect:/mybuild";
	}
}
