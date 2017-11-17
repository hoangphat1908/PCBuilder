package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs157a.PCBuilder.model.Case;
import com.cs157a.PCBuilder.service.CaseService;

@Controller
public class CaseController {
	@Autowired
	private  CaseService caseService;

	@RequestMapping("/case")
    public String computerCase(Model model) {
    	List<Case> computerCase = caseService.selectAll();
        model.addAttribute("caseList",computerCase);
        return "component_list/case_list";
    }
}
