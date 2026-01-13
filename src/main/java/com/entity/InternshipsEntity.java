package com.entity;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "internships")
@Data
public class InternshipsEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer internshipId;

	@NotBlank(message = "Title is required")
	@Column(nullable = false, length = 100)
	private String title;

	@Column(nullable = false)
	private LocalDate startDate;

	@Column(nullable = false)
	private LocalDate endDate;

	@Column(length = 650)
	private String description;

	@NotBlank(message = "Contact person name is required")
	@Column(nullable = false, length = 50)
	private String contactPersonName;

	@NotBlank(message = "Contact number of support person is required")
	@Column(nullable = false, length = 15)
	private String contactPersonContactNo;

	@NotNull(message = "Select status for internship")
	@Column(nullable = false)
	private Boolean active;

	@NotNull(message = "Select internship is paid or unpaid")
	@Column(nullable = false)
	private Boolean isPaid;

	private String amount;

	@NotNull(message = "Select internship pays stipend or not")
	@Column(nullable = false)
	private Boolean isStipend;

	private String stipendAmount;

	@Column(nullable = false)
	private LocalDate postedAt;

	@ManyToMany
	@JoinTable(name = "internship_technology", 
			   joinColumns = @JoinColumn(name = "internship_id"), 
			   inverseJoinColumns = @JoinColumn(name = "technology_id")
	)
	private List<TechnologyEntity> technologies;

}
