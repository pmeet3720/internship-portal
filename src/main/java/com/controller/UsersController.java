package com.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.cloudinary.Cloudinary;
import com.entity.UsersEntity;
import com.enums.Roles;
import com.service.MailService;
import com.service.OtpService;
import com.service.UsersService;

@Controller
public class UsersController {
	
	private final Cloudinary cloudinary;

	private final MailService mailService;

	@Autowired
	UsersService usersService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	OtpService otpService;

	UsersController(MailService mailService, Cloudinary cloudinary) {
		this.mailService = mailService;
		this.cloudinary = cloudinary;
	}
	
	@GetMapping("/userhomepage")
	public String userHomePage() {
		return "userhomepage";
	}
	
	@GetMapping("/admindashboard")
	public String adminDashboard(Model model) {
		model.addAttribute("user",new UsersEntity());
		model.addAttribute("rolesList", Roles.values());
		return "admindashboard";
	}

	@GetMapping("/register")
	public String registerPage(Model model) {

		model.addAttribute("rolesList", Roles.values());

		model.addAttribute("user", new UsersEntity());

		return "register";
	}

	@PostMapping("/register/new")
	public String registerUser(@ModelAttribute("user") @Validated UsersEntity user, BindingResult result, Model model,
			MultipartFile imageFile) {
		if (result.hasErrors()) {

			return "register";
		}

		Optional<UsersEntity> userEmail = usersService.getUserEmail(user.getEmail());

		if (userEmail.isPresent()) {
			model.addAttribute("emailError", "Email already registered, try to login or register with other email.");
			model.addAttribute("rolesList", Roles.values());
			model.addAttribute("user", new UsersEntity());
			return "register";
		}

		UsersEntity savedUser = usersService.addNewUser(user, imageFile);

		if (savedUser != null) {
			model.addAttribute("user", savedUser);
		}

		if (savedUser.getRoles() == Roles.INTERN) {
			return "redirect:/userhomepage";
		} else {
			return "redirect:/admindashboard";
		}
	}
	
	@GetMapping("/users")
	public String getAllUsersPage(Model model) {
		List<UsersEntity> allUsers = usersService.getAllUsers();
		model.addAttribute("user", new UsersEntity());
		model.addAttribute("rolesList", Roles.values());
		model.addAttribute("usersList",allUsers);
		return "users";
	}
	
	@PostMapping("/register/new2")
	public String registerUserByAdmin(
	        @ModelAttribute("user") @Validated UsersEntity user,
	        BindingResult result,
	        RedirectAttributes ra) {

	    if (result.hasErrors()) {
	        ra.addFlashAttribute("org.springframework.validation.BindingResult.user", result);
	        ra.addFlashAttribute("user", user);
	        ra.addFlashAttribute("openAddUserModal", true);
	        return "redirect:/users";
	    }

	    Optional<UsersEntity> userEmail = usersService.getUserEmail(user.getEmail());

	    if (userEmail.isPresent()) {
	        ra.addFlashAttribute("user", user);
	        ra.addFlashAttribute("emailError",
	                "Email already registered, try another email.");
	        ra.addFlashAttribute("openAddUserModal", true);
	        return "redirect:/users";
	    }

	    UsersEntity savedUser = usersService.addNewUserByAdmin(user);

	    if (savedUser != null) {
	        ra.addFlashAttribute("successMsg", "User added successfully!");
	    }

	    return "redirect:/users";
	}
	
	@GetMapping("/user/delete")
	public String deleteUser(@RequestParam Integer id) {
		if(id != null) {
			UsersEntity userById = usersService.findUserById(id);
			usersService.deleteUser(userById);
			return "redirect:/users";
		}
		
		System.out.println("id is null, try again.");
		return "redirect:/users";
	}
	


}
