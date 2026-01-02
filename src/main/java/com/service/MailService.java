package com.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.entity.UsersEntity;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {
	
	@Autowired
	private JavaMailSender javaMailSender;

	public void sendWelcomeMail(UsersEntity user) {
		MimeMessage message = javaMailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setTo(user.getEmail());
			helper.setSubject("Welcome to Our Platform!");

			String path = "src/main/resources/templates/welcomemail.html";
			Path p = Paths.get(path);

			String htmlMsg = new String(Files.readAllBytes(p));

			htmlMsg = htmlMsg.replace("${firstName}", user.getFirstName());

			helper.setText(htmlMsg, true);

			javaMailSender.send(message);

		} catch (MessagingException | IOException e) {

			e.printStackTrace();
		}

	}

	public void sendOtp(UsersEntity user, int otp) {
		MimeMessage message = javaMailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setTo(user.getEmail());
			helper.setSubject("OTP Verification");

			String path = "src/main/resources/templates/otpmail.html";
			Path p = Paths.get(path);

			String htmlMsg = new String(Files.readAllBytes(p));

			htmlMsg = htmlMsg.replace("${otp}", String.valueOf(otp));

			helper.setText(htmlMsg, true);

			javaMailSender.send(message);

		} catch (MessagingException | IOException e) {

			e.printStackTrace();
		}
		
	}

}
