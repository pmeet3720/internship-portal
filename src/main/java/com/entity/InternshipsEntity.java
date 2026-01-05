package com.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "internships")
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

	public Integer getInternshipId() {
		return internshipId;
	}

	public void setInternshipId(Integer internshipId) {
		this.internshipId = internshipId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContactPersonName() {
		return contactPersonName;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}

	public String getContactPersonContactNo() {
		return contactPersonContactNo;
	}

	public void setContactPersonContactNo(String contactPersonContactNo) {
		this.contactPersonContactNo = contactPersonContactNo;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public Boolean getIsPaid() {
		return isPaid;
	}

	public void setIsPaid(Boolean isPaid) {
		this.isPaid = isPaid;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public Boolean getIsStipend() {
		return isStipend;
	}

	public void setIsStipend(Boolean isStipend) {
		this.isStipend = isStipend;
	}

	public String getStipendAmount() {
		return stipendAmount;
	}

	public void setStipendAmount(String stipendAmount) {
		this.stipendAmount = stipendAmount;
	}

	public LocalDate getPostedAt() {
		return postedAt;
	}

	public void setPostedAt(LocalDate postedAt) {
		this.postedAt = postedAt;
	}

	@Override
	public String toString() {
		return "InternshipsEntity [internshipId=" + internshipId + ", title=" + title + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", description=" + description + ", contactPersonName=" + contactPersonName
				+ ", contactPersonContactNo=" + contactPersonContactNo + ", active=" + active + ", isPaid=" + isPaid
				+ ", amount=" + amount + ", isStipend=" + isStipend + ", stipendAmount=" + stipendAmount + ", postedAt="
				+ postedAt + "]";
	}
	
	

}
