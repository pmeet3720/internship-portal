<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Internship Management</title>

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
.internship-card {
	background: rgba(255, 255, 255, 0.95);
	border-radius: 16px;
	box-shadow: 0 12px 35px rgba(0, 0, 0, 0.4);
	margin-bottom: 25px;
	transition: all 0.3s ease;
}

.internship-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 18px 45px rgba(0, 0, 0, 0.55);
}

.badge-status {
	font-size: 0.85rem;
	padding: 6px 12px;
}

.action-btn {
	margin-right: 8px;
}
</style>
</head>

<body class="background-effect">

	<div class="container mt-5">

		<!-- HEADER -->
		<div class="d-flex justify-content-between align-items-center mb-4">
			<a href="${pageContext.request.contextPath}/admindashboard"
				class="btn btn-outline-light"> <i class="fa fa-arrow-left me-2"></i>
				Back to Dashboard
			</a>

			<h3 class="text-white">
				<i class="fa fa-briefcase me-2"></i> Internship Management
			</h3>

			<button class="btn myBtn-light" data-bs-toggle="modal"
				data-bs-target="#addInternshipModal">
				<i class="fa fa-plus-circle me-2"></i> Add New Internship
			</button>

		</div>

		<!-- EMPTY STATE -->
		<c:if test="${empty internshipsList}">
			<div class="alert alert-light text-center py-5">
				<i class="fa fa-info-circle fa-2x mb-3"></i>
				<h5>No internships available</h5>
				<p class="text-muted mb-0">Click "Add New Internship" to create
					one.</p>
			</div>
		</c:if>

		<!-- INTERNSHIP TABLE -->
		<c:if test="${not empty internshipsList}">
			<div class="table-responsive">
				<table
					class="table table-light table-hover align-middle text-center">
					<thead class="table-secondary text-dark">
						<tr>
							<th>Title</th>
							<th>Duration</th>
							<th>Payment</th>
							<th>Stipend</th>
							<th>Contact</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${internshipsList}" var="internship">
							<tr>
								<td class="fw-semibold">${internship.title}</td>

								<td>${internship.startDate}<br /> <small
									class="text-muted">to</small> <br /> ${internship.endDate}
								</td>

								<td><c:choose>
										<c:when test="${internship.isPaid}">
											<span class="badge bg-info"> Paid
												(${internship.amount}) </span>
										</c:when>
										<c:otherwise>
											<span class="badge bg-secondary">Unpaid</span>
										</c:otherwise>
									</c:choose></td>

								<td><c:choose>
										<c:when test="${internship.isStipend}">
											<span class="badge bg-warning text-dark"> Yes
												(${internship.stipendAmount}) </span>
										</c:when>
										<c:otherwise>
											<span class="badge bg-secondary">No</span>
										</c:otherwise>
									</c:choose></td>

								<td>${internship.contactPersonName}<br /> <small
									class="text-muted">
										${internship.contactPersonContactNo} </small>
								</td>

								<td><span
									class="badge 
                                ${internship.active ? 'bg-success' : 'bg-danger'}">
										${internship.active ? 'ACTIVE' : 'INACTIVE'} </span></td>



								<td><a href="internship/view?id=${internship.internshipId}"
									class="btn btn-info btn-sm"> <i class="fa fa-eye"></i>
								</a> <a href="internship/edit?id=${internship.internshipId}"
									class="btn btn-warning btn-sm"> <i class="fa fa-edit"></i>
								</a> <a href="internship/delete?id=${internship.internshipId}"
									class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure you want to delete this internship?');">
										<i class="fa fa-trash"></i>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>


	</div>

	<!-- ADD INTERNSHIP MODAL -->
	<div class="modal fade" id="addInternshipModal" tabindex="-1">
		<div
			class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">
						<i class="fa fa-plus-circle me-2"></i> Add Internship
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">

					<form action="${pageContext.request.contextPath}/internship/add"
						method="post">

						<!-- Title -->
						<div class="mb-3">
							<label class="form-label">Title *</label> <input type="text"
								name="title" class="form-control" required>
						</div>

						<!-- Dates -->
						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label">Start Date *</label> <input
									type="date" name="startDate" class="form-control" required>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label">End Date *</label> <input type="date"
									name="endDate" class="form-control" required>
							</div>
						</div>

						<!-- Description -->
						<div class="mb-3">
							<label class="form-label">Description</label>
							<textarea name="description" rows="3" class="form-control"></textarea>
						</div>

						<!-- Contact Info -->
						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label">Contact Person *</label> <input
									type="text" name="contactPersonName" class="form-control"
									required>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label">Contact Number *</label> <input
									type="text" name="contactPersonContactNo" class="form-control"
									required>
							</div>
						</div>

						<!-- Status -->
						<div class="row">
							<div class="col-md-4 mb-3">
								<label class="form-label">Status </label> <select name="active"
									class="form-select" required>
									<option value="">-- Select --</option>
									<option value="true">Active</option>
									<option value="false">Inactive</option>
								</select>
							</div>

							<div class="col-md-4 mb-3">
								<label class="form-label">Paid </label> <select name="isPaid"
									id="isPaid" class="form-select" required>
									<option value="">-- Select --</option>
									<option value="true">Yes</option>
									<option value="false">No</option>
								</select>

							</div>

							<div class="col-md-4 mb-3">
								<label class="form-label">Stipend </label> <select
									name="isStipend" id="isStipend" class="form-select" required>
									<option value="">-- Select --</option>
									<option value="true">Yes</option>
									<option value="false">No</option>
								</select>

							</div>
						</div>

						<!-- Amounts -->
						<div class="row">
							<div class="col-md-6 mb-3" id="paidAmountSection"
								style="display: none;">
								<label class="form-label">Paid Amount</label> <input type="text"
									name="amount" id="paidAmount" class="form-control">
							</div>

							<div class="col-md-6 mb-3" id="stipendAmountSection"
								style="display: none;">
								<label class="form-label">Stipend Amount</label> <input
									type="text" name="stipendAmount" id="stipendAmount"
									class="form-control">
							</div>

						</div>

						<!-- Submit -->
						<div class="d-grid mt-3">
							<button type="submit" class="btn myBtn-light">
								<i class="fa fa-save me-2"></i> Save Internship
							</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- View Internship Modal -->

	<c:if test="${viewMode}">
		<div class="modal fade show" id="viewInternshipModal"
			style="display: block;" tabindex="-1">
			<div
				class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
				<div class="modal-content">

					<!-- Header -->
					<div class="modal-header">
						<h5 class="modal-title">
							<i class="fa fa-eye me-2"></i> Internship Details
						</h5>
						<a href="${pageContext.request.contextPath}/internships"
							class="btn-close"></a>
					</div>

					<!-- Body -->
					<div class="modal-body">

						<div class="row mb-2">
							<div class="col-md-6">
								<strong>Title:</strong>
								<p>${internship.title}</p>
							</div>
							<div class="col-md-6">
								<strong>Status:</strong> <span
									class="badge ${internship.active ? 'bg-success' : 'bg-danger'}">
									${internship.active ? 'ACTIVE' : 'INACTIVE'} </span>
							</div>
						</div>

						<hr>

						<strong>Description:</strong>
						<p>${internship.description}</p>

						<hr>

						<div class="row mb-2">
							<div class="col-md-6">
								<strong>Start Date:</strong>
								<p>${internship.startDate}</p>
							</div>
							<div class="col-md-6">
								<strong>End Date:</strong>
								<p>${internship.endDate}</p>
							</div>
						</div>

						<div class="row mb-2">
							<div class="col-md-6">
								<strong>Posted At:</strong>
								<p>${internship.postedAt}</p>
							</div>
						</div>

						<hr>

						<div class="row mb-2">
							<div class="col-md-6">
								<strong>Contact Person:</strong>
								<p>${internship.contactPersonName}</p>
							</div>
							<div class="col-md-6">
								<strong>Contact Number:</strong>
								<p>${internship.contactPersonContactNo}</p>
							</div>
						</div>

						<hr>

						<div class="row mb-2">
							<div class="col-md-6">
								<strong>Paid Internship:</strong>
								<p>
									<c:choose>
										<c:when test="${internship.isPaid}">
                  Yes (₹ ${internship.amount})
                </c:when>
										<c:otherwise>
                  No
                </c:otherwise>
									</c:choose>
								</p>
							</div>

							<div class="col-md-6">
								<strong>Stipend:</strong>
								<p>
									<c:choose>
										<c:when test="${internship.isStipend}">
                  Yes (₹ ${internship.stipendAmount})
                </c:when>
										<c:otherwise>
                  No
                </c:otherwise>
									</c:choose>
								</p>
							</div>
						</div>

					</div>

					<!-- Footer -->
					<div class="modal-footer">
						<a href="${pageContext.request.contextPath}/internships"
							class="btn btn-secondary"> Close </a>
					</div>

				</div>
			</div>
		</div>

		<!-- Backdrop -->
		<div class="modal-backdrop fade show"></div>
	</c:if>

	<!-- Edit Internship Modal -->
	<c:if test="${editMode}">
		<div class="modal fade show" id="editInternshipModal"
			style="display: block;" tabindex="-1">
			<div
				class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
				<div class="modal-content">

					<!-- Header -->
					<div class="modal-header">
						<h5 class="modal-title">
							<i class="fa fa-edit me-2"></i> Edit Internship
						</h5>
						<a href="${pageContext.request.contextPath}/internships"
							class="btn-close"></a>
					</div>

					<!-- Body -->
					<div class="modal-body">

						<form
							action="${pageContext.request.contextPath}/internship/update"
							method="post">

							<!-- Hidden ID -->
							<input type="hidden" name="internshipId"
								value="${internship.internshipId}" />

							<!-- Title -->
							<div class="mb-3">
								<label class="form-label">Title *</label> <input type="text"
									name="title" class="form-control" value="${internship.title}"
									required>
							</div>

							<!-- Dates -->
							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label">Start Date *</label> <input
										type="date" name="startDate" class="form-control"
										value="${internship.startDate}" required>
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label">End Date *</label> <input type="date"
										name="endDate" class="form-control"
										value="${internship.endDate}" required>
								</div>
							</div>

							<!-- Description -->
							<div class="mb-3">
								<label class="form-label">Description</label>
								<textarea name="description" rows="3" class="form-control">${internship.description}</textarea>
							</div>

							<!-- Contact -->
							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label">Contact Person *</label> <input
										type="text" name="contactPersonName" class="form-control"
										value="${internship.contactPersonName}" required>
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label">Contact Number *</label> <input
										type="text" name="contactPersonContactNo" class="form-control"
										value="${internship.contactPersonContactNo}" required>
								</div>
							</div>

							<!-- Status / Paid / Stipend -->
							<div class="row">
								<div class="col-md-4 mb-3">
									<label class="form-label">Status</label> <select name="active"
										class="form-select" required>
										<option value="true" ${internship.active ? 'selected' : ''}>Active</option>
										<option value="false" ${!internship.active ? 'selected' : ''}>Inactive</option>
									</select>
								</div>

								<div class="col-md-4 mb-3">
									<label class="form-label">Paid</label> <select name="isPaid"
										id="editIsPaid" class="form-select" required>
										<option value="true" ${internship.isPaid ? 'selected' : ''}>Yes</option>
										<option value="false" ${!internship.isPaid ? 'selected' : ''}>No</option>
									</select>
								</div>

								<div class="col-md-4 mb-3">
									<label class="form-label">Stipend</label> <select
										name="isStipend" id="editIsStipend" class="form-select"
										required>
										<option value="true" ${internship.isStipend ? 'selected' : ''}>Yes</option>
										<option value="false"
											${!internship.isStipend ? 'selected' : ''}>No</option>
									</select>
								</div>
							</div>

							<!-- Amounts -->
							<div class="row">
								<div class="col-md-6 mb-3" id="editPaidAmountSection"
									style="display:${internship.isPaid ? 'block' : 'none'};">
									<label class="form-label">Paid Amount</label> <input
										type="text" name="amount" id="editPaidAmount"
										class="form-control" value="${internship.amount}">
								</div>

								<div class="col-md-6 mb-3" id="editStipendAmountSection"
									style="display:${internship.isStipend ? 'block' : 'none'};">
									<label class="form-label">Stipend Amount</label> <input
										type="text" name="stipendAmount" id="editStipendAmount"
										class="form-control" value="${internship.stipendAmount}">
								</div>
							</div>

							<!-- Submit -->
							<div class="d-grid mt-3">
								<button type="submit" class="btn myBtn-light">
									<i class="fa fa-save me-2"></i> Update Internship
								</button>
							</div>

						</form>

					</div>

				</div>
			</div>
		</div>

		<div class="modal-backdrop fade show"></div>
	</c:if>



	<%-- <c:if test="${viewMode}">
		<script>
			document.addEventListener("DOMContentLoaded", function() {
				new bootstrap.Modal(document
						.getElementById("viewInternshipModal")).show();
			});
		</script>
	</c:if> --%>

	<script>
		document.addEventListener("DOMContentLoaded", function() {

			const isPaid = document.getElementById("isPaid");
			const paidSection = document.getElementById("paidAmountSection");
			const paidAmount = document.getElementById("paidAmount");

			const isStipend = document.getElementById("isStipend");
			const stipendSection = document
					.getElementById("stipendAmountSection");
			const stipendAmount = document.getElementById("stipendAmount");

			isPaid.addEventListener("change", function() {
				if (this.value === "true") {
					paidSection.style.display = "block";
					paidAmount.required = true;
				} else {
					paidSection.style.display = "none";
					paidAmount.value = "";
					paidAmount.required = false;
				}
			});

			isStipend.addEventListener("change", function() {
				if (this.value === "true") {
					stipendSection.style.display = "block";
					stipendAmount.required = true;
				} else {
					stipendSection.style.display = "none";
					stipendAmount.value = "";
					stipendAmount.required = false;
				}
			});

		});
	</script>



	<script
		src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>
