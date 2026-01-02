package com.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

@Service
public class OtpService {
	
	private final Map<String, Integer> otpStore = new ConcurrentHashMap<>();

	public void storeOtp(String email, int otp) {
		
		otpStore.put(email, otp);
	}
	
	public String getOtp(String email) {
		return otpStore.get(email).toString();
	}
	

}
