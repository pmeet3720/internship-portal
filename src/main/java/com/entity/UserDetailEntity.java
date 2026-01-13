package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "user_detail_entity")
@Setter
@Getter
public class UserDetailEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userDetailId;
	
	@OneToOne
	@JoinColumn(name = "userId")
	private UsersEntity user;
	
	@Column(length=100, nullable = false)
	private String collageName;
	
	@Column(length=100)
	private String courseInfo;
	
	@NotBlank(message = "Enter your semester")
	@Column(nullable = false, length=2)
	private String semester;
	

}
