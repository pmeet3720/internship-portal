package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@SpringBootApplication
public class InternshipPortalWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(InternshipPortalWebApplication.class, args);
	}
	
	@Bean
	public BCryptPasswordEncoder getPasswordEncoder() { 
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public Cloudinary cloudinary() {
		return new Cloudinary(ObjectUtils.asMap("cloud_name", "dpfizcbbv", "api_key", "596385788758666", "api_secret",
				"B8E_onQ6dSlJnMs0ZdU0-KH5oWM"));
	}

}
