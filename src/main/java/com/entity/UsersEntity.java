package com.entity;

import java.time.LocalDate;

import com.enums.Roles;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.EnumeratedValue;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
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
	
	

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Roles getRoles() {
		return roles;
	}

	public void setRoles(Roles roles) {
		this.roles = roles;
	}

	public LocalDate getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}

	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getProfilePic() {
		return profilePicUrl;
	}

	public void setProfilePic(String profilePicUrl) {
		this.profilePicUrl = profilePicUrl;
	}

	@Override
	public String toString() {
		return "UsersEntity [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", gender="
				+ gender + ", email=" + email + ", password=" + password + ", contactNo=" + contactNo + ", city=" + city
				+ ", state=" + state + ", country=" + country + ", roles=" + roles + ", createdAt=" + createdAt
				+ ", status=" + status + ", profilePicUrl=" + profilePicUrl + "]";
	}
	
	
}
