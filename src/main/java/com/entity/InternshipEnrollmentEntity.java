package com.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name="internship_entrollment")
@Setter
@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class InternshipEnrollmentEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer internship_enrollment_id;
	
	@OneToOne
	@JoinColumn(name="internshipId")
	InternshipsEntity internship;
	
	@OneToOne
	@JoinColumn(name="userId")
	UsersEntity user;
	
	LocalDate createdAt;
}
