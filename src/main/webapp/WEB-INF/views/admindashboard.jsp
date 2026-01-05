<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/css/bootstrap.min.css" />

<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css" />

<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/styles.css" />

<style>

/* Transparent Top Navbar */
.admin-navbar {
    background: rgba(0, 0, 0, 0.35);   /* transparent */
    backdrop-filter: blur(6px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.4);
    height: 64px;
}

.admin-navbar .navbar-brand {
    font-size: 1.1rem;
    letter-spacing: 0.5px;
}

.admin-navbar .btn-outline-light {
    border-radius: 30px;
    padding: 6px 18px;
    font-weight: 600;
}


.admin .card {
	background: rgba(255, 255, 255, 0.92); /* slightly transparent */
	border: 1px solid rgba(255, 255, 255, 0.35);
	border-radius: 14px;
	box-shadow: 0 12px 35px rgba(0, 0, 0, 0.45);
	transition: all 0.3s ease;
	backdrop-filter: blur(6px); /* subtle glass effect */
}

.admin .card:hover {
	background: rgba(255, 255, 255, 0.97);
	/* slightly more solid on hover */
	transform: translateY(-6px);
	box-shadow: 0 18px 50px rgba(0, 0, 0, 0.6);
}

/* Dashboard spacing */
.dashboard-container {
	padding-top: 120px;
	padding-left: 60px;
	padding-right: 40px;
}

/* Card styling for dark backgrounds */
.dashboard-card {
	background: rgba(255, 255, 255, 0.95);
	border-radius: 16px;
	border: 1px solid rgba(255, 255, 255, 0.4);
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.45);
	transition: transform 0.25s ease, box-shadow 0.25s ease;
}

.dashboard-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 22px 55px rgba(0, 0, 0, 0.6);
}

.dashboard-card img {
	width: 110px;
	height: 110px;
	object-fit: contain;
	margin: 25px auto 15px;
}

.dashboard-title {
	font-weight: 700;
	color: #333;
}

.dashboard-desc {
	font-size: 0.9rem;
	color: #666;
}

.dashboard-btn {
	border-radius: 30px;
	padding: 10px 30px;
	font-weight: 600;
}
</style>
</head>

<body class="background">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top admin-navbar">
		<div class="container-fluid px-4">

			<!-- LEFT : Brand / Dashboard -->
			<a class="navbar-brand fw-bold"
				href="${pageContext.request.contextPath}/admindashboard"> <i
				class="fa fa-shield me-2"></i> Admin Dashboard
			</a>

			<!-- RIGHT : Logout -->
			<div class="ms-auto">
				<a href="${pageContext.request.contextPath}/logout"
					class="btn btn-outline-light btn-sm"> <i
					class="fa fa-sign-out me-2"></i> Logout
				</a>
			</div>

		</div>
	</nav>


	<div class="container admin dashboard-container">
		<c:if test="${not empty successMsg}">
			<div class="alert alert-success alert-dismissible fade show mt-3"
				role="alert">
				<i class="fa fa-check-circle me-2"></i> ${successMsg}
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
		</c:if>
		<div class="row g-4 mt-5">
			<!-- g-4 = spacing between cards -->


			<!-- CARD 1 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img src="${pageContext.request.contextPath}/assets/user.png"
								alt="User Management">
						</div>
						<h5 class="dashboard-title mt-2">User Management</h5>
						<p class="dashboard-desc">Add, view, and manage platform users
							securely.</p>

						<button type="button" class="btn btn-primary dashboard-btn"
							data-bs-toggle="modal" data-bs-target="#addUserModal">
							<i class="fa fa-user-plus me-2"></i> Add New User
						</button>

					</div>
				</div>
			</div>

			<!-- CARD 2 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img
								src="${pageContext.request.contextPath}/assets/online-training.png"
								alt="User Management">
						</div>
						<h5 class="dashboard-title mt-2">Technology Management</h5>
						<p class="dashboard-desc">Add, view, and manage technology
							securely.</p>

						<a href="technologies" class="btn btn-primary dashboard-btn">
							<i class="fa fa-user-plus me-2"></i> Manage Technology
						</a>
					</div>
				</div>
			</div>

			<!-- CARD 3 -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img
								src="${pageContext.request.contextPath}/assets/internship.png"
								alt="User Management">
						</div>
						<h5 class="dashboard-title mt-2">Internship Management</h5>
						<p class="dashboard-desc">Add, view, and manage platform
							internships securely.</p>

						<a href="internships" class="btn btn-primary dashboard-btn"> <i
							class="fa fa-user-plus me-2"></i> Manage Internship
						</a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- ADD USER MODAL -->
	<div class="modal fade" id="addUserModal" tabindex="-1"
		aria-labelledby="addUserModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title" id="addUserModalLabel">
						<i class="fa fa-user-plus me-2"></i> Add New User
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">

					<form:form
						action="${pageContext.request.contextPath}/register/new2"
						method="post" modelAttribute="user">

						<!-- Email Exists Error -->
						<c:if test="${not empty emailError}">
							<div class="alert alert-danger py-2 mb-3">${emailError}</div>
						</c:if>

						<div class="row">

							<!-- First Name -->
							<div class="col-md-6 mb-2">
								<form:input path="firstName" class="form-control"
									placeholder="First Name" />
								<form:errors path="firstName" cssClass="text-danger small" />
							</div>

							<!-- Last Name -->
							<div class="col-md-6 mb-2">
								<form:input path="lastName" class="form-control"
									placeholder="Last Name" />
								<form:errors path="lastName" cssClass="text-danger small" />
							</div>

							<!-- Gender -->
							<div class="col-md-12 mb-2">
								<label class="form-label d-block">Gender</label>

								<div class="form-check form-check-inline">
									<form:radiobutton path="gender" value="Male"
										class="form-check-input" />
									<label class="form-check-label">Male</label>
								</div>

								<div class="form-check form-check-inline">
									<form:radiobutton path="gender" value="Female"
										class="form-check-input" />
									<label class="form-check-label">Female</label>
								</div>

								<div class="form-check form-check-inline">
									<form:radiobutton path="gender" value="Other"
										class="form-check-input" />
									<label class="form-check-label">Other</label>
								</div>

								<form:errors path="gender" cssClass="text-danger small" />
							</div>

							<!-- Email -->
							<div class="col-md-6 mb-2">
								<form:input path="email" type="email" class="form-control"
									placeholder="Email" />
								<form:errors path="email" cssClass="text-danger small" />
							</div>

							<!-- Password -->
							<div class="col-md-6 mb-2">
								<form:password path="password" class="form-control"
									placeholder="Password" />
								<form:errors path="password" cssClass="text-danger small" />
							</div>

							<!-- Contact -->
							<div class="col-md-6 mb-2">
								<form:input path="contactNo" class="form-control"
									placeholder="Contact Number" />
								<form:errors path="contactNo" cssClass="text-danger small" />
							</div>

							<!-- Role Dropdown -->
							<div class="col-md-6 mb-2">
								<form:select path="roles" class="form-select">
									<form:option value="">-- Select Role --</form:option>

									<c:forEach items="${rolesList}" var="role">
										<form:option value="${role}">${role}</form:option>
									</c:forEach>

								</form:select>

								<form:errors path="roles" cssClass="text-danger small" />
							</div>


							<!-- City -->
							<div class="col-md-4 mb-2">
								<form:input path="city" class="form-control" placeholder="City" />
							</div>

							<!-- State -->
							<div class="col-md-4 mb-2">
								<form:input path="state" class="form-control"
									placeholder="State" />
							</div>

							<!-- Country -->
							<div class="col-md-4 mb-2">
								<form:input path="country" class="form-control"
									placeholder="Country" />
							</div>

						</div>

						<!-- Submit -->
						<div class="d-grid">
							<button type="submit" class="btn btn-success">
								<i class="fa fa-save me-2"></i> Register User
							</button>
						</div>

					</form:form>

				</div>

			</div>
		</div>
	</div>



	<script
		src="${pageContext.request.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>


</body>
</html>
