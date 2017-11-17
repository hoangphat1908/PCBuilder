package com.cs157a.PCBuilder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cs157a.PCBuilder.model.Storage;
import com.cs157a.PCBuilder.service.StorageService;

@Controller
public class StorageController {
	@Autowired
	private  StorageService storageService;

	@RequestMapping("/storage")
    public String ram(Model model) {
    	List<Storage> storage = storageService.selectAll();
        model.addAttribute("storageList",storage);
        return "component_list/storage_list";
    }
}
