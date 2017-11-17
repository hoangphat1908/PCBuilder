package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs157a.PCBuilder.model.PSU;
import com.cs157a.PCBuilder.service.PSUService;

@Controller
public class PSUController {
	@Autowired
	private  PSUService psuService;

	@RequestMapping("/psu")
    public String psu(Model model) {
    	List<PSU> psu = psuService.selectAll();
        model.addAttribute("psuList",psu);
        return "component_list/psu_list";
    }
}
