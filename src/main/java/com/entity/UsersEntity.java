package com.entity;

import java.time.LocalDate;
import java.util.List;

import com.enums.Roles;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="users")
@Getter
@Setter
public class UsersEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userId;
	
	@NotBlank(message = "FirstName is required.")
	@Column(nullable = false, length=50)
	private String firstName;
	
	@NotBlank(message = "LastName is required.")
	@Column(nullable = false, length=50)
	private String lastName;
	
	@NotBlank(message = "Gender is required.")
	@Column(nullable = false, length=50)
	private String gender;
	
	@NotBlank(message = "Email is required.")
	@Column(nullable = false, length=150)
	private String email;
	
	@NotBlank(message = "Password is required.")
	@Column(nullable=false, length=80)
	private String password;
	
	@NotBlank(message = "Contact number is required.")
	@Column(nullable=false, length=20)
	private String contactNo;
	
	@NotBlank(message = "City is required.")
	@Column(nullable=false, length=50)
	private String city;
	
	@NotBlank(message = "State is required.")
	@Column(nullable=false, length=50)
	private String state;
	
	@NotBlank(message = "Country is required.")
	@Column(nullable=false, length=50)
	private String country;
	
	@Enumerated(EnumType.STRING)
	@Column(nullable=false)
	private Roles roles = Roles.INTERN;
	
	@Column(nullable=false)
	private LocalDate createdAt;
	
	@Column(nullable=false)
	private boolean status;
	
	@Column(length=500)
	private String profilePicUrl;
	
	@OneToMany
	@JoinColumn(name="userId")
	private List<UsersTechStackEntity> technologies;
	
	
}
