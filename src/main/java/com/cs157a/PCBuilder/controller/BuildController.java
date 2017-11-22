package com.cs157a.PCBuilder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.Build;
import com.cs157a.PCBuilder.service.BuildService;

@Controller
public class BuildController {
	@Autowired
	private  BuildService buildService;

	@RequestMapping(value = "/build/{id}", method=RequestMethod.GET)
    public String viewBuild(@PathVariable("id") int id, Model model) {
		Build build = buildService.get(id);
        model.addAttribute("build",build);
        return "build_view";
    }
}
