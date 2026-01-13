package com.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.InternshipEnrollmentEntity;
import com.entity.UsersEntity;

@Repository
public interface InternshipEnrollmentRepository extends JpaRepository<InternshipEnrollmentEntity, Integer>{

	InternshipEnrollmentEntity findInternshipEnrollmentByUser(Optional<UsersEntity> byId);

}
