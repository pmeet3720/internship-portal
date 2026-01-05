package com.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.InternshipsEntity;
import com.service.InternshipsService;

@Controller
public class InternshipsController {
	
	@Autowired
	InternshipsService internshipsService;
	
	@GetMapping("/internships")
	public String getInternshipsPage(Model model) {
		List<InternshipsEntity> allInternships = internshipsService.getAllInternships();
		model.addAttribute("internshipsList",allInternships);
		return "internships";
	}
	
	@PostMapping("/internship/add")
	public String addInternship(@ModelAttribute InternshipsEntity internship) {
		internship.setPostedAt(LocalDate.now());
		InternshipsEntity savedInternship = internshipsService.addNewInternship(internship);
		if(savedInternship != null) {
			System.out.println("internship added successfully");
		}else {
			System.out.println("failed to add internship");
		}
		return "redirect:/internships";
	}
	
	@GetMapping("/internship/delete")
	public String deleteInternship(@RequestParam Integer id, Model model) {
		if(id != null) {
			InternshipsEntity internshipById = internshipsService.findInternshipById(id);
			internshipsService.deleteInternship(internshipById);
			return "redirect:/internships";
		}
		System.out.println("Id is null, try again.");
		return "redirect:/internships";
	}
	
	@GetMapping("/internship/view")
	public String viewInternship(@RequestParam Integer id, RedirectAttributes ra) {
		if(id != null) {
			InternshipsEntity internshipById = internshipsService.findInternshipById(id);
			ra.addFlashAttribute("internship", internshipById);
			ra.addFlashAttribute("viewMode", true);
			return "redirect:/internships";
		}
		ra.addFlashAttribute("viewMode", false);
		return "redirect:/internships";
	}
	
	@GetMapping("/internship/edit")
	public String editInternshipModal(@RequestParam Integer id, RedirectAttributes ra) {
		if(id != null) {
			InternshipsEntity internshipById = internshipsService.findInternshipById(id);
			ra.addFlashAttribute("internship", internshipById);
			ra.addFlashAttribute("editMode",true);
			return "redirect:/internships";
		}
		ra.addFlashAttribute("viewMode",false);
		return "redirect:/internships";
	}

}
