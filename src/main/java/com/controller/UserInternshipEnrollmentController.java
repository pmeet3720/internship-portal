package com.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.InternshipEnrollmentEntity;
import com.entity.UserDetailEntity;
import com.service.InternshipEnrollmentService;
import com.service.InternshipsService;
import com.service.UserDetailService;
import com.service.UsersService;

@Controller
public class UserInternshipEnrollmentController {
	
	@Autowired
	UsersService usersService;
	
	@Autowired
	InternshipsService internshipService;
	
	@Autowired
	InternshipEnrollmentService internshipEnrollmentService;
	
	@Autowired
	UserDetailService userDetailService;
	
	@PostMapping("/internship/enroll")
	public String enrollUser(Integer internshipId, Integer userId, String collageName, String courseInfo, @Validated String semester, RedirectAttributes ra) {
		
		InternshipEnrollmentEntity alreadyEnrolled = internshipEnrollmentService.isUserAlreadyEnrolled(userId);
		System.out.println(userId + ' '+internshipId);
		if(alreadyEnrolled != null) {
			ra.addFlashAttribute("enrollError", "You are already enrolled in an internship");
			return "redirect:/userhomepage";
		}
		
		// save user details in UserDetailEntity
		UserDetailEntity userDetail =
	            userDetailService.getUserDetailByUserId(userId);

	    if (userDetail == null) {
	        userDetail = new UserDetailEntity();
	        userDetail.setUser(usersService.findUserById(userId));
	    }
		userDetail.setCollageName(collageName);
		userDetail.setCourseInfo(courseInfo);
		userDetail.setSemester(semester);
		
		userDetailService.saveUserDetails(userDetail);
		
		// save enrollment
		InternshipEnrollmentEntity enrollment = new InternshipEnrollmentEntity();
		enrollment.setUser(usersService.findUserById(userId));
		enrollment.setInternship(internshipService.findInternshipById(internshipId));
		enrollment.setCreatedAt(LocalDate.now());
		
		internshipEnrollmentService.saveEnrollment(enrollment);
		
		ra.addFlashAttribute("successMsg", "Successfully enrolled in internship!");
		
		return "redirect:/userhomepage";
	}

}
