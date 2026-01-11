package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name="users_tech_stack")
@Setter
@Getter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class UsersTechStackEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer techStackId;
	
	@Column(length=50)
	String techStackName;
	
	// add userId as foreign key in this table
	// it has ManyToOne relationship, so you can add mapping from here or from UsersEntity class
//	@ManyToOne
//	@JoinColumn(name="userId")
//	UsersEntity user;
	
}
