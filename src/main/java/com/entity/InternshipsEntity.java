package com.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "internships")
@Setter
@Getter
public class InternshipsEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer internshipId;
	
	@NotBlank(message= "Title is required")
	@Column(nullable = false, length=100)
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

	@Override
	public String toString() {
		return "InternshipsEntity [internshipId=" + internshipId + ", title=" + title + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", description=" + description + ", contactPersonName=" + contactPersonName
				+ ", contactPersonContactNo=" + contactPersonContactNo + ", active=" + active + ", isPaid=" + isPaid
				+ ", amount=" + amount + ", isStipend=" + isStipend + ", stipendAmount=" + stipendAmount + ", postedAt="
				+ postedAt + "]";
	}
	
	

}
