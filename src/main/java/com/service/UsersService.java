package com.service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.Transformation;
import com.cloudinary.utils.ObjectUtils;
import com.entity.UsersEntity;
import com.enums.Roles;
import com.repository.UsersRepository;

@Service
public class UsersService {
	
	@Autowired
	UsersRepository usersRepository;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	Cloudinary cloudinary;
	
	@Autowired
	MailService mailService;

	public Optional<UsersEntity> getUserEmail(String email) {
		
		return usersRepository.findByEmail(email);
		
	}

	public UsersEntity addNewUser(UsersEntity user, MultipartFile profilePic) {
		
		user.setStatus(true);
		user.setCreatedAt(LocalDate.now());
		user.setRoles(Roles.INTERN);
		
		// encode password
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		// set profilePicUrl
		
		Map uploadResult;
		try {
			uploadResult = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.asMap("transformation", new Transformation<>().width(200).height(200).crop("fill")));
			String profilePicUrl = uploadResult.get("secure_url").toString();
			user.setProfilePic(profilePicUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		UsersEntity savedUser = usersRepository.save(user);
		
		// send mail to user to welcome on-board
		mailService.sendWelcomeMail(savedUser);
		
		return savedUser;
	}

	public UsersEntity addNewUserByAdmin(UsersEntity user) {
		user.setStatus(true);
		user.setCreatedAt(LocalDate.now());
		
		String userPassword = user.getPassword();
		
		// encode password
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		UsersEntity savedUser = usersRepository.save(user);

		// send mail to user with password to login on his registered email
		mailService.sendUserMailWithPassword(user, userPassword);
		
		
		return savedUser;
	}
	
	

}
