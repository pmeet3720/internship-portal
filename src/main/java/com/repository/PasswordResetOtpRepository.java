package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.PasswordResetOtpEntity;

@Repository
public interface PasswordResetOtpRepository extends JpaRepository<PasswordResetOtpEntity, Integer>{

	PasswordResetOtpEntity findByEmail(String email);

}
