package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs157a.PCBuilder.model.Motherboard;
import com.cs157a.PCBuilder.service.MotherboardService;

@Controller
public class MotherboardController {
	@Autowired
	private  MotherboardService motherboardService;

	@RequestMapping("/motherboard")
    public String motherboard(Model model) {
    	List<Motherboard> motherboard = motherboardService.selectAll();
        model.addAttribute("motherboardList",motherboard);
        return "component_list/motherboard_list";
    }
}
