package com.cs157a.PCBuilder.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.Build;
import com.cs157a.PCBuilder.model.RAM;
import com.cs157a.PCBuilder.model.Storage;
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
		if (!build.isPublic()) {
			User user = userService.getCurrentUser();
			if (user != null && user.getId() == build.getUser().getId()) {
				model.addAttribute("build",build);
			}
		}
		else {
			model.addAttribute("build",build);
		}
        return "build_view";
    }
	
	@RequestMapping("/mybuild")
    public String myBuild(Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			if (build == null) {
				return newBuild(model);
			}
			model.addAttribute("build",build);
			
		}
        return "my_build";
    }
	
	@RequestMapping("/mybuild/new")
    public String newBuild(Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			buildService.newBuild();
		}
        return "redirect:/mybuild";
    }
	
	@RequestMapping("/mybuild/set/{id}")
    public String setCurrentBuild(@PathVariable("id") int id, Model model) {
		userService.setCurrentBuild(id);
        return "redirect:/profile";
    }
	
	@RequestMapping(value = "/mybuild/edit/name", method = RequestMethod.POST)
    public String setBuildName(@ModelAttribute("build") Build build, Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build currentBuild = buildService.get(user.getCurrentBuildId());
			if (build != null) {
				buildService.editName(currentBuild, build.getName());
			}
		}
        return "redirect:/mybuild";
    }
	
	@RequestMapping(value = "/mybuild/remove/cpu", method = RequestMethod.POST)
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
	@RequestMapping(value = "/mybuild/remove/motherboard", method = RequestMethod.POST)
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
	@RequestMapping(value = "/mybuild/remove/gpu", method = RequestMethod.POST)
	public String removeGPU(Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			if (build != null) {
				buildService.removeGPU(build);
			}
		}
		return "redirect:/mybuild";
	}
	@RequestMapping(value = "/mybuild/remove/psu", method = RequestMethod.POST)
	public String removePSU(Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			if (build != null) {
				buildService.removePSU(build);
			}
		}
		return "redirect:/mybuild";
	}
	@RequestMapping(value = "/mybuild/remove/cooler", method = RequestMethod.POST)
	public String removeCooler(Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			if (build != null) {
				buildService.removeCooler(build);
			}
		}
		return "redirect:/mybuild";
	}
	@RequestMapping(value = "/mybuild/remove/case", method = RequestMethod.POST)
	public String removeCase(Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			if (build != null) {
				buildService.removeCase(build);
			}
		}
		return "redirect:/mybuild";
	}
	@RequestMapping(value = "/mybuild/remove/ram/{id}", method = RequestMethod.POST)
	public String removeRAM(@PathVariable("id") int id, Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			RAM ram = build.getRamList().get(id);
			if (build != null) {
				buildService.removeRAM(build, ram);
			}
		}
		return "redirect:/mybuild";
	}
	@RequestMapping(value = "/mybuild/remove/storage/{id}", method = RequestMethod.POST)
	public String removeStorage(@PathVariable("id") int id, Model model) {
		User user = userService.getCurrentUser();
		if (user != null) {
			Build build = buildService.get(user.getCurrentBuildId());
			Storage storage = build.getStorageList().get(id);
			if (build != null) {
				buildService.removeStorage(build, storage);
			}
		}
		return "redirect:/mybuild";
	}
}
