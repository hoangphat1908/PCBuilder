package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs157a.PCBuilder.model.Cooler;
import com.cs157a.PCBuilder.service.CoolerService;

@Controller
public class CoolerController {
	@Autowired
	private  CoolerService coolerService;

	@RequestMapping("/cooler")
    public String cooler(Model model) {
    	List<Cooler> cooler = coolerService.selectAll();
        model.addAttribute("coolerList",cooler);
        return "component_list/cooler_list";
    }
}
