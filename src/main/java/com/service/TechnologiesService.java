package com.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.Transformation;
import com.cloudinary.utils.ObjectUtils;
import com.entity.TechnologyEntity;
import com.repository.TechnologiesRepository;

@Service
public class TechnologiesService {
	
	@Autowired
	TechnologiesRepository technologiesRepository;
	
	@Autowired
	Cloudinary cloudinary;

	public List<TechnologyEntity> getAllTechnologies() {
		return technologiesRepository.findAll();
		
	}

	public TechnologyEntity addNewTechnology(TechnologyEntity technology, MultipartFile logoFile) {
		
		Map uploadResult;
		try {
			uploadResult = cloudinary.uploader().upload(logoFile.getBytes(), ObjectUtils.asMap("transformation", new Transformation<>().width(200).height(200).crop("fill")));
			String logoUrl = uploadResult.get("secure_url").toString();
			technology.setLogoUrl(logoUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return technologiesRepository.save(technology);
		
	}

	public TechnologyEntity findTechnologyById(Integer id) {
		return technologiesRepository.findById(id).get();
	}

	public void deleteTechnology(TechnologyEntity technology) {
		technologiesRepository.delete(technology);
	}

}
