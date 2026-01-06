package com.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.PasswordResetOtpEntity;
import com.repository.PasswordResetOtpRepository;

@Service
public class OtpService {
	
	@Autowired
	PasswordResetOtpRepository passwordResetOtpRepository;

	public void saveOtp(PasswordResetOtpEntity pwdOtpReset) {
		passwordResetOtpRepository.save(pwdOtpReset);
	}

	public PasswordResetOtpEntity getPwdOtpResetEntityByEmail(String email) {
		
		return passwordResetOtpRepository.findByEmail(email);
		
	}

}
