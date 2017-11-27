package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.Case;
import com.cs157a.PCBuilder.service.CaseService;
import com.cs157a.PCBuilder.service.UserService;

@Controller
public class CaseController {
	@Autowired 
	private UserService userService;
	
	@Autowired
	private  CaseService caseService;

	@RequestMapping("/case")
    public String computerCase(Model model) {
    	List<Case> computerCase = caseService.selectAll();
        model.addAttribute("caseList",computerCase);
        return "component_list/case_list";
    }
	@RequestMapping(value = "/case/{id}", method = RequestMethod.POST)
	public String addCase(@PathVariable("id") int id) {
		userService.updateCurrentBuild(caseService.get(id));
		return "redirect:/mybuild";
	}
}
