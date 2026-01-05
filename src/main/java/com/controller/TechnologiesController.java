package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.TechnologyEntity;
import com.service.TechnologiesService;

@Controller
public class TechnologiesController {
	
	@Autowired
	TechnologiesService technologiesService;
	
	@GetMapping("technologies")
	public String getTechnologyPage(Model model) {
		model.addAttribute("technologiesList", technologiesService.getAllTechnologies());
		model.addAttribute("technology", new TechnologyEntity());
		return "technologies";
	}
	
	@PostMapping("/technology/add")
	public String addNewTechnology(@ModelAttribute("technology") @Validated TechnologyEntity technology, BindingResult result, Model model, MultipartFile logoFile) {
		if(result.hasErrors()) {
			return "technologies";
		}
		
		TechnologyEntity newTechnology = technologiesService.addNewTechnology(technology, logoFile);
		
		if(newTechnology != null) {
			model.addAttribute("successMsg", "Technology added successfully");
		}
		
		return "redirect:/technologies";
	}
	
	@GetMapping("/technology/delete")
	public String deleteTechnology(@RequestParam Integer id, Model model) {
		if(id != null) {
			TechnologyEntity technology = technologiesService.findTechnologyById(id);
			technologiesService.deleteTechnology(technology);
			return "redirect:/technologies";
		}else {
			System.out.println("Id is null, try again.");
		}
		model.addAttribute("deleteError","Technology failed to delete, try again.");
		return "technologies";
	}
	
	@GetMapping("/technology/edit")
	public String editPage(@RequestParam Integer id, Model model) {
		if(id != null) {
			TechnologyEntity technologyById = technologiesService.findTechnologyById(id);
			model.addAttribute("technology", technologyById);
			model.addAttribute("editMode",true);
			model.addAttribute("technologiesList",technologiesService.getAllTechnologies());
			return "technologies";
		}
		return "technologies";
	}
	
	@PostMapping("/technology/update")
	public String updateTechnology(@ModelAttribute("technology") @Validated TechnologyEntity tech, BindingResult result, Model model, MultipartFile logoFile) {
		if(result.hasErrors()) {
			System.out.println(result.getObjectName());
	        model.addAttribute("editMode", true);
	        model.addAttribute("technologiesList", technologiesService.getAllTechnologies());
			return "technologies";
		}
		
		TechnologyEntity existingTechnology = technologiesService.findTechnologyById(tech.getTechnologyId());
		
		if(logoFile == null	|| logoFile.isEmpty()) {
			tech.setLogoUrl(existingTechnology.getLogoUrl());
		}else {
			technologiesService.uploadLogoFile(tech, logoFile);
		}
		
		TechnologyEntity editedTechnology = technologiesService.editTechnology(tech);
		
		return "redirect:/technologies";
		
	}

}
