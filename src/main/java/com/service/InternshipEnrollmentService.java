package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.InternshipEnrollmentEntity;
import com.repository.InternshipEnrollmentRepository;
import com.repository.UsersRepository;

@Service
public class InternshipEnrollmentService {
	
	@Autowired
	InternshipEnrollmentRepository internshipEnrollmentRepository;
	
	@Autowired
	UsersRepository usersRepository;

	public InternshipEnrollmentEntity isUserAlreadyEnrolled(Integer userId) {
		
		return internshipEnrollmentRepository.findInternshipEnrollmentByUser(usersRepository.findById(userId));
	}

	public void saveEnrollment(InternshipEnrollmentEntity enrollment) {
		
		internshipEnrollmentRepository.save(enrollment);
		
	}

}
