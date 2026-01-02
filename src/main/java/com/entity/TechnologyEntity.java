package com.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name="technologies")
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

	public int getTechnologyId() {
		return technologyId;
	}

	public void setTechnologyId(int technologyId) {
		this.technologyId = technologyId;
	}

	public String getTechnologyName() {
		return technologyName;
	}

	public void setTechnologyName(String technologyName) {
		this.technologyName = technologyName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "TechnologyEntity [technologyId=" + technologyId + ", technologyName=" + technologyName
				+ ", description=" + description + ", logoUrl=" + logoUrl + ", active=" + active + "]";
	}
	
	

}
