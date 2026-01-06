package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.InternshipsEntity;
import com.repository.InternshipsRepository;

@Service
public class InternshipsService {
	
	@Autowired
	InternshipsRepository internshipsRepository;

	public List<InternshipsEntity> getAllInternships() {
		
		return internshipsRepository.findAll();
	}

	public InternshipsEntity addNewInternship(InternshipsEntity internship) {
		
		if(internship != null) {
			return internshipsRepository.save(internship);
		}
		return null;
		
	}

	public InternshipsEntity findInternshipById(Integer id) {
		return internshipsRepository.findById(id).get();
		
	}

	public void deleteInternship(InternshipsEntity internshipById) {
		
		internshipsRepository.delete(internshipById);
		
	}

	public InternshipsEntity updateInternship(InternshipsEntity internship) {
		return internshipsRepository.save(internship);
		
	}

}
