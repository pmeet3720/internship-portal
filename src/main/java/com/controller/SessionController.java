package com.controller;

import java.util.Arrays;
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
import org.springframework.web.multipart.MultipartFile;
import com.cloudinary.Cloudinary;
import com.dto.ChangePasswordDTO;
import com.dto.ForgotPasswordDTO;
import com.dto.LoginDTO;
import com.entity.UsersEntity;
import com.enums.Roles;
import com.repository.UsersRepository;
import com.service.MailService;
import com.service.OtpService;
import com.service.UsersService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

	private final Cloudinary cloudinary;

	private final MailService mailService;

	@Autowired
	UsersService usersService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	OtpService otpService;

	SessionController(MailService mailService, Cloudinary cloudinary) {
		this.mailService = mailService;
		this.cloudinary = cloudinary;
	}

	@GetMapping("/")
	public String indexPage() {
		return "index";
	}
	

	@GetMapping("login")
	public String login(Model model) {
		model.addAttribute("login", new LoginDTO());
		return "login";
	}

	@PostMapping("authenticate")
	public String authenticate(@ModelAttribute("login") @Validated LoginDTO loginCred, BindingResult result,
			Model model) {

		if (result.hasErrors()) {
			return "login";
		}

		System.out.println("email:-" + loginCred.getEmail());
		Optional<UsersEntity> findUser = usersService.getUserEmail(loginCred.getEmail());

		if (findUser.isEmpty()) {
			model.addAttribute("loginError", "Invalid email or password");
			return "login";
		}

		UsersEntity user = findUser.get();

		if (user.getEmail().equals(loginCred.getEmail())
				&& passwordEncoder.matches(loginCred.getPassword(), user.getPassword())) {
			model.addAttribute("user", user);
			if (user.getRoles() == Roles.INTERN) {
				return "redirect:/userhomepage";
			} else {
				return "redirect:/admindashboard";
			}
		} else {
			model.addAttribute("loginError", "Invalid email or password");
			return "login";
		}

	}

	@GetMapping("/forgotpassword")
	public String forgotPassword(Model model) {
		model.addAttribute("forgotPassword", new ForgotPasswordDTO());
		return "forgotpassword";
	}

	@PostMapping("/forgotpassword")
	public String sendOTPviaEmail(@ModelAttribute("forgotPassword") @Validated ForgotPasswordDTO dto,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "forgotpassword";
		}

		Optional<UsersEntity> findUser = usersService.getUserEmail(dto.getEmail());

		if (findUser.isEmpty()) {
			model.addAttribute("errorMsg", "Email not registered");
			return "forgotpassword";
		}

		UsersEntity user = findUser.get();

		int otp = (int) (Math.random() * 9999) + 1000;

		otpService.storeOtp(dto.getEmail(), otp);

		mailService.sendOtp(user, otp);

		return "redirect:/changepassword";
	}

	@GetMapping("changepassword")
	public String changePassword(Model model) {
		model.addAttribute("changePassword", new ChangePasswordDTO());
		return "changepassword";
	}

	@PostMapping("change-password")
	public String updatePassword(@ModelAttribute("changePassword") @Validated ChangePasswordDTO dto,
			BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "changepassword";
		}

		return "";
	}
	
	@GetMapping("/logout")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
//	@GetMapping("demo")
//	public String demoRegisterPage(Model model) {
//		model.addAttribute("rolesList",Roles.values());
//		return "demo";
//	}
//	
//	@PostMapping("demoregister")
//	public String demoRegister(@Validated UsersEntity user, BindingResult result, Model model, MultipartFile imageFile) {
//		System.out.println(imageFile.getOriginalFilename());
//		
//		if (result.hasErrors()) {
//			System.out.println(result.getFieldErrorCount());
//			model.addAttribute("fieldError",result.getFieldError());
//			return "demo";
//		}
//
//		UsersEntity savedUser = usersService.addNewUser(user, imageFile);
//
//		if (savedUser != null) {
//			model.addAttribute("user", savedUser);
//		}
//
//		if (savedUser.getRoles() == Roles.INTERN) {
//			return "userhomepage";
//		} else {
//			return "admindashboard";
//		}
////		return "demo";
//	}

}
