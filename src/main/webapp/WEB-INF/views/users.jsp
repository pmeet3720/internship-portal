<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>

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
.user-table {
	background: rgba(255, 255, 255, 0.95);
	border-radius: 14px;
	box-shadow: 0 12px 35px rgba(0, 0, 0, 0.35);
}
</style>
</head>

<body class="background-effect">

	<div class="container mt-5">

		<!-- HEADER -->
		<div class="d-flex justify-content-between align-items-center mb-4">

			<!-- Back -->
			<a href="${pageContext.request.contextPath}/admindashboard"
				class="btn btn-outline-light"> <i class="fa fa-arrow-left me-2"></i>
				Back to Dashboard
			</a>

			<!-- Title -->
			<h3 class="text-white mb-0">
				<i class="fa fa-users me-2"></i> User Management
			</h3>

			<!-- Add User Button -->
			<button class="btn myBtn-light" data-bs-toggle="modal"
				data-bs-target="#addUserModal">
				<i class="fa fa-user-plus me-2"></i> Add New User
			</button>

		</div>


		<!-- EMPTY STATE -->
		<c:if test="${empty usersList}">
			<div class="alert alert-light text-center py-5">
				<i class="fa fa-info-circle fa-2x mb-3"></i>
				<h5>No users found</h5>
			</div>
		</c:if>

		<!-- USERS TABLE -->
		<c:if test="${not empty usersList}">
			<div class="table-responsive user-table p-3">
				<table class="table table-hover align-middle text-center">
					<thead class="table-secondary text-dark">
						<tr>
							<th>Name</th>
							<th>Gender</th>
							<th>Email</th>
							<th>Contact No.</th>
							<th>Role</th>
							<th>Joined At</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${usersList}" var="user">
							<tr>
								<td class="fw-semibold">${user.firstName} ${user.lastName}</td>
								<td>${user.gender}</td>
								<td>${user.email}</td>
								<td>${user.contactNo}</td>
								<td><span class="badge bg-primary">${user.roles}</span></td>
								<td>${user.createdAt}</td>
								<td><span
									class="badge ${user.status ? 'bg-success' : 'bg-danger'}">
										${user.status ? 'Active' : 'InActive'} </span></td>
								<td><a href="user/view?id=${user.userId}"
									class="btn btn-info btn-sm"> <i class="fa fa-eye"></i>
								</a> <a href="user/edit?id=${user.userId}"
									class="btn btn-warning btn-sm"> <i class="fa fa-edit"></i>
								</a> <a href="user/delete?id=${user.userId}"
									class="btn btn-danger btn-sm"
									onclick="return confirm('Delete this user?');"> <i
										class="fa fa-trash"></i>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</c:if>
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
					<a href="${pageContext.request.contextPath}/users"
							class="btn-close"></a>
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

	<c:if test="${openAddUserModal}">
		<script>
			document.addEventListener("DOMContentLoaded", function() {
				var modal = new bootstrap.Modal(document
						.getElementById("addUserModal"));
				modal.show();
			});
		</script>
	</c:if>


	<script
		src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>