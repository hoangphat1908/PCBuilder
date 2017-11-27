package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.PSU;
import com.cs157a.PCBuilder.service.PSUService;
import com.cs157a.PCBuilder.service.UserService;

@Controller
public class PSUController {
	@Autowired 
	private UserService userService;
	
	@Autowired
	private  PSUService psuService;

	@RequestMapping("/psu")
    public String psu(Model model) {
    	List<PSU> psu = psuService.selectAll();
        model.addAttribute("psuList",psu);
        return "component_list/psu_list";
    }
	@RequestMapping(value = "/psu/{id}", method = RequestMethod.POST)
	public String addPSU(@PathVariable("id") int id) {
		userService.updateCurrentBuild(psuService.get(id));
		return "redirect:/mybuild";
	}
}
