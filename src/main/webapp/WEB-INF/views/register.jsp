<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate Registration</title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/css/bootstrap.min.css" />

<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css" />

<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css" />

<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
</head>

<body>

<section class="container-fluid vh-100">
	<div class="row h-100">

		<!-- LEFT SECTION -->
		<div class="col-md-6 d-none d-md-flex coffee_mug_background align-items-start">
			<div class="mt-4 ms-5">
				<h2 class="logo text-white">
					hotdevinternships <span class="logo_com">.com</span>
				</h2>
			</div>
		</div>

		<!-- RIGHT SECTION -->
		<div class="col-md-6 d-flex align-items-center justify-content-center bg-light">
			<div class="card shadow p-4 w-75 register-card">

				<h3 class="text-center mb-3">Create Account</h3>

				<form:form action="${pageContext.request.contextPath}/register/new"
						   method="post"
						   modelAttribute="user"
						   enctype="multipart/form-data">

					<!-- Email Exists Error -->
					<c:if test="${not empty emailError}">
						<div class="alert alert-danger py-2 mb-2">
							${emailError}
							<a href="${pageContext.request.contextPath}/login">Login here</a>
						</div>
					</c:if>

					<!-- First Name -->
					<div class="mb-2">
						<form:input path="firstName" class="form-control"
									placeholder="First Name" />
						<div class="error-box">
							<form:errors path="firstName" cssClass="text-danger small"/>
						</div>
					</div>

					<!-- Last Name -->
					<div class="mb-2">
						<form:input path="lastName" class="form-control"
									placeholder="Last Name" />
						<div class="error-box">
							<form:errors path="lastName" cssClass="text-danger small"/>
						</div>
					</div>

					<!-- Gender -->
					<div class="mb-2">
						<label class="form-label d-block">Gender</label>

						<div class="form-check form-check-inline">
							<form:radiobutton path="gender" value="Male"
								class="form-check-input" id="male"/>
							<label class="form-check-label" for="male">Male</label>
						</div>

						<div class="form-check form-check-inline">
							<form:radiobutton path="gender" value="Female"
								class="form-check-input" id="female"/>
							<label class="form-check-label" for="female">Female</label>
						</div>

						<div class="form-check form-check-inline">
							<form:radiobutton path="gender" value="Other"
								class="form-check-input" id="other"/>
							<label class="form-check-label" for="other">Other</label>
						</div>

						<div class="error-box">
							<form:errors path="gender" cssClass="text-danger small"/>
						</div>
					</div>

					<!-- Email -->
					<div class="mb-2">
						<form:input path="email" type="email"
									class="form-control"
									placeholder="Email"/>
						<div class="error-box">
							<form:errors path="email" cssClass="text-danger small"/>
						</div>
					</div>

					<!-- Password -->
					<div class="mb-2">
						<form:password path="password" class="form-control"
									   placeholder="Password"/>
						<div class="error-box">
							<form:errors path="password" cssClass="text-danger small"/>
						</div>
					</div>

					<!-- Contact -->
					<div class="mb-2">
						<form:input path="contactNo" class="form-control"
									placeholder="Contact Number"/>
						<div class="error-box">
							<form:errors path="contactNo" cssClass="text-danger small"/>
						</div>
					</div>

					<!-- City -->
					<div class="mb-2">
						<form:input path="city" class="form-control"
									placeholder="City"/>
						<div class="error-box">
							<form:errors path="city" cssClass="text-danger small"/>
						</div>
					</div>

					<!-- State -->
					<div class="mb-2">
						<form:input path="state" class="form-control"
									placeholder="State"/>
						<div class="error-box">
							<form:errors path="state" cssClass="text-danger small"/>
						</div>
					</div>

					<!-- Country -->
					<div class="mb-2">
						<form:input path="country" class="form-control"
									placeholder="Country"/>
						<div class="error-box">
							<form:errors path="country" cssClass="text-danger small"/>
						</div>
					</div>

					<!-- Profile Picture -->
					<div class="mb-2">
						<label class="form-label">Profile Picture</label>
						<input type="file" name="imageFile" class="form-control"/>
					</div>

					<!-- Submit -->
					<div class="d-grid mt-3">
						<button type="submit" class="myBtn">Register</button>
					</div>

				</form:form>
			</div>
		</div>

	</div>
</section>

<script src="${pageContext.request.contextPath}/webjars/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
