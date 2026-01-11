package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="technologies")
@Setter
@Getter
public class TechnologyEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer technologyId;
	
	@NotBlank(message= "Technology name is required")
	@Column(nullable = false, length=50)
	private String technologyName;
	
	@NotBlank(message = "Description is required")
	@Column(nullable = false, length=350)
	private String description;
	
	@Column(length = 500)
	private String logoUrl;
	
	@NotNull(message = "Select appropriate status")
	@Column(nullable = false)
	private Boolean active;
	
	

}
