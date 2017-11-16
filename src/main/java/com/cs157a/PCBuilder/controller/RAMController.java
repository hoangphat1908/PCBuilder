package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs157a.PCBuilder.model.RAM;
import com.cs157a.PCBuilder.service.RAMService;

@Controller
public class RAMController {
	@Autowired
	private  RAMService ramService;

	@RequestMapping("/ram")
    public String ram(Model model) {
    	List<RAM> ram = ramService.selectAll();
        model.addAttribute("ramList",ram);
        return "ram_list";
    }

}
