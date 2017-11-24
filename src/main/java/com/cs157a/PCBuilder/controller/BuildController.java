package com.cs157a.PCBuilder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.Build;
import com.cs157a.PCBuilder.model.User;
import com.cs157a.PCBuilder.service.BuildService;
import com.cs157a.PCBuilder.service.UserService;

@Controller
public class BuildController {
	@Autowired
	private  UserService userService;
	
	@Autowired
	private  BuildService buildService;

	@RequestMapping("/build/{id}")
    public String viewBuild(@PathVariable("id") int id, Model model) {
		Build build = buildService.get(id);
        model.addAttribute("build",build);
        return "build_view";
    }
	
	@RequestMapping("/mybuild")
    public String myBuild(Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			if (build == null)
				build = new Build();
			model.addAttribute("build",build);
		}
        return "my_build";
    }
	@RequestMapping(value = "/mybuild/remove/cpu", method = RequestMethod.GET)
	public String removeCPU(Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			if (build != null) {
				buildService.removeCPU(build);
			}
			
		}
		return "redirect:/mybuild";
	}
	@RequestMapping(value = "/mybuild/remove/motherboard", method = RequestMethod.GET)
	public String removeMotherboard(Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			if (build != null) {
				buildService.removeMotherboard(build);
			}
			
		}
		return "redirect:/mybuild";
	}
}
