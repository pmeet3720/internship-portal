package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.UserDetailEntity;
import com.repository.UserDetailRepository;

@Service
public class UserDetailService {

	@Autowired
	UserDetailRepository userDetailRepository;
	
	@Autowired
	UsersService usersService;

	public void saveUserDetails(UserDetailEntity userDetail) {
		
		userDetailRepository.save(userDetail);
		
	}

	public UserDetailEntity getUserDetailByUserId(Integer userId) {
		
		return userDetailRepository.findUserDetailByUser(usersService.findUserById(userId));
	}
	
}
