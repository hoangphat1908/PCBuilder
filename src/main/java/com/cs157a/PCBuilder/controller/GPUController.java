package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs157a.PCBuilder.model.GPU;
import com.cs157a.PCBuilder.service.GPUService;

@Controller
public class GPUController {
	@Autowired
	private  GPUService gpuService;

	@RequestMapping("/gpu")
    public String gpu(Model model) {
    	List<GPU> gpu = gpuService.selectAll();
        model.addAttribute("gpuList",gpu);
        return "component_list/gpu_list";
    }
}
