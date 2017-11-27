package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cs157a.PCBuilder.model.Storage;
import com.cs157a.PCBuilder.service.StorageService;
import com.cs157a.PCBuilder.service.UserService;

@Controller
public class StorageController {
	@Autowired 
	private UserService userService;
	
	@Autowired
	private  StorageService storageService;

	@RequestMapping("/storage")
    public String storage(Model model) {
    	List<Storage> storage = storageService.selectAll();
        model.addAttribute("storageList",storage);
        return "component_list/storage_list";
    }
	@RequestMapping(value = "/storage/{id}", method = RequestMethod.POST)
	public String addStorage(@PathVariable("id") int id) {
		userService.updateCurrentBuild(storageService.get(id));
		return "redirect:/mybuild";
	}
}
