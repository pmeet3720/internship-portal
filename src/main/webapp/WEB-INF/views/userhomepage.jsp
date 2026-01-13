<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>

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
body {
	background: #f5f7fb;
}

/* Navbar profile image */
.profile-img {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	object-fit: cover;
}

/* Internship card */
.internship-card {
	border-radius: 14px;
	transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.internship-card:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
}
</style>

</head>
<body class="">

	<!-- =================== NAVBAR =================== -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
		<a class="navbar-brand fw-bold" href="#"> <i
			class="fa fa-graduation-cap me-2"></i>Internship Portal
		</a>

		<div class="ms-auto d-flex align-items-center">
			<span class="text-white me-3"> Welcome, <b>${user.firstName}</b>
			</span>

			<!-- Profile Dropdown -->
			<div class="dropdown">
				<c:choose>
					<c:when test="${not empty user.profilePicUrl}">
						<a class="dropdown-toggle text-white text-decoration-none"
							data-bs-toggle="dropdown" href="#"> <img
							src="${user.profilePicUrl}" class="profile-img me-1"
							alt="Profile">
						</a>
					</c:when>
					<c:otherwise>
						<a class="dropdown-toggle text-white text-decoration-none"
							data-bs-toggle="dropdown" href="#"> <i
							class="fa fa-user-circle fa-2x text-white"></i>
						</a>
					</c:otherwise>

				</c:choose>

				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item"
						href="${pageContext.request.contextPath}/user/profile"> <i
							class="fa fa-user me-2"></i>Profile
					</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item text-danger"
						href="${pageContext.request.contextPath}/logout"> <i
							class="fa fa-sign-out me-2"></i>Logout
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- =================== CONTENT =================== -->
	<div class="container mt-5">

		<h4 class="mb-4">
			<i class="fa fa-briefcase me-2"></i> Available Internships
		</h4>

		<!-- EMPTY STATE -->
		<c:if test="${empty listInternships}">
			<div class="alert alert-info text-center py-5">
				<i class="fa fa-info-circle fa-2x mb-3"></i>
				<h5>No internships available right now</h5>
			</div>
		</c:if>

		<!-- INTERNSHIP CARDS -->
		<div class="row g-4">
			<c:forEach items="${listInternships}" var="internship">

				<!-- Show only active internships -->
				<c:if test="${internship.active}">
					<div class="col-md-6 col-lg-4">

						<div class="card internship-card h-100">
							<div class="card-body">

								<!-- Title -->
								<h5 class="card-title fw-bold">${internship.title}</h5>

								<!-- Dates -->
								<p class="text-muted small mb-2">
									<i class="fa fa-calendar me-1"></i> ${internship.startDate} –
									${internship.endDate}
								</p>

								<!-- Description -->
								<p class="card-text small">${internship.description}</p>

								<!-- Paid / Stipend -->
								<div class="mb-2">
									<span
										class="badge ${internship.isPaid ? 'bg-success' : 'bg-secondary'}">
										${internship.isPaid ? 'Paid' : 'Unpaid'} </span>

									<c:if test="${internship.isStipend}">
										<span class="badge bg-info ms-1"> Stipend:
											₹${internship.stipendAmount} </span>
									</c:if>
								</div>

								<!-- Support / Contact Info -->
								<div class="mt-3 small">
									<hr class="my-2">
									<p class="mb-1 fw-semibold">
										<i class="fa fa-headset me-1 text-primary"></i> Support Team
									</p>

									<p class="mb-0">
										<i class="fa fa-user me-1"></i>
										${internship.contactPersonName}
									</p>

									<p class="mb-0">
										<i class="fa fa-phone me-1"></i>
										${internship.contactPersonContactNo}
									</p>
								</div>


							</div>

							<!-- Footer -->
							<div class="card-footer bg-transparent border-top-0">
								<button class="btn btn-primary w-100 myBtn-light"
									data-bs-toggle="modal" data-bs-target="#enrollModal"
									onclick="setInternshipIdUserId('${internship.internshipId}','${user.userId}')">
									<i class="fa fa-check-circle me-2"></i> Enroll Now
								</button>
								<c:if test="${userAlreadyEnrolled}">
									<button class="btn btn-secondary w-100" disabled>
										Already Enrolled</button>
								</c:if>

							</div>
						</div>

					</div>
				</c:if>

			</c:forEach>
		</div>

	</div>

	<!-- enroll modal -->
	<div class="modal fade" id="enrollModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-md">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h5 class="modal-title">
						<i class="fa fa-clipboard-list me-2"></i> Internship Enrollment
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Body -->
				<div class="modal-body">

					<!-- Error Message -->
					<c:if test="${not empty enrollError}">
						<div class="alert alert-danger">${enrollError}</div>
					</c:if>

					<form action="${pageContext.request.contextPath}/internship/enroll"
						method="post">

						<!-- Hidden Fields -->
						<input type="hidden" name="internshipId" id="internshipId">
						<input type="hidden" name="userId" id="userId">

						<!-- College -->
						<div class="mb-3">
							<label class="form-label">College Name *</label> <input
								type="text" name="collageName" class="form-control" required>
						</div>

						<!-- Course -->
						<div class="mb-3">
							<label class="form-label">Course / Branch</label> <input
								type="text" name="courseInfo" class="form-control">
						</div>

						<!-- Semester -->
						<div class="mb-3">
							<label class="form-label">Semester *</label> <input type="text"
								name="semester" class="form-control" required>
						</div>

						<!-- Submit -->
						<div class="d-grid">
							<button type="submit" class="btn btn-success">
								<i class="fa fa-paper-plane me-2"></i> Confirm Enrollment
							</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>


	<script>
		function setInternshipIdUserId(internshipId, userId) {
			document.getElementById("internshipId").value = internshipId;
			document.getElementById("userId").value = userId;
		}
	</script>


	<script
		src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>
