<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Technology Management</title>

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
.tech-card {
	background: rgba(255, 255, 255, 0.95);
	border-radius: 16px;
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.45);
}

.table thead {
	background: #343a40;
	color: #fff;
}

.action-btn i {
	margin-right: 4px;
}
</style>
</head>

<body class="background-effect">

	<div class="container mt-5">

		<!-- PAGE HEADER -->
		<div class="d-flex justify-content-between align-items-center mb-4">

			<a href="${pageContext.request.contextPath}/admindashboard"
				class="btn btn-outline-light"> <i class="fa fa-arrow-left me-2"></i>
				Back to Dashboard
			</a>

			<h3 class="text-white">
				<i class="fa fa-cogs me-2"></i> Technology Management
			</h3>

			<button class="btn btn-success myBtn-light" data-bs-toggle="modal"
				data-bs-target="#addTechnologyModal">
				<i class="fa fa-plus-circle me-2"></i> Add Technology
			</button>
		</div>

		<!-- SUCCESS MESSAGE -->
		<c:if test="${not empty successMsg}">
			<div class="alert alert-success alert-dismissible fade show">
				<i class="fa fa-check-circle me-2"></i> ${successMsg}
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
		</c:if>

		<!-- TECHNOLOGY TABLE -->
		<div class="card tech-card">
			<div class="card-body">

				<table class="table table-hover table-bordered align-middle">
					<thead class="text-center">
						<tr>
							<th>#</th>
							<th>Logo</th>
							<th>Technology Name</th>
							<th>Description</th>
							<th>Status</th>
							<th width="220px">Actions</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${empty technologiesList}">
							<tr>
								<td colspan="5" class="text-center text-muted">No
									technologies added yet.</td>
							</tr>
						</c:if>

						<c:forEach items="${technologiesList}" var="tech" varStatus="loop">
							<tr>
								<td class="text-center">${loop.index + 1}</td>
								<td class="text-center"><img src="${tech.logoUrl}"
									width="70px" height="70px"></td>
								<td>${tech.technologyName}</td>
								<td>${tech.description}</td>
								<td class="text-center"><span class="badge bg-success">
										${tech.active == true ? "ACTIVE" : "INACTIVE"} </span></td>

								<td class="text-center"><%-- <a
									href="technology/view?id=${tech.getTechnologyId()}"
									class="btn btn-info btn-sm action-btn mx-2"> <i
										class="fa fa-eye"></i> View
								</a> --%> <a href="technology/edit?id=${tech.getTechnologyId()}"
									class="btn btn-warning btn-sm action-btn mx-2"> <i
										class="fa fa-edit"></i> Edit
								</a> <a href="technology/delete?id=${tech.getTechnologyId()}"
									class="btn btn-danger btn-sm action-btn"
									onclick="return confirm('Are you sure you want to delete this technology?');">
										<i class="fa fa-trash"></i> Delete
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>

	</div>

	<!-- ADD TECHNOLOGY MODAL -->
	<div class="modal fade" id="addTechnologyModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h5 class="modal-title">
						<i class="fa fa-plus-circle me-2"></i> Add Technology
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Body -->
				<div class="modal-body">
					<form:form
						action="${pageContext.request.contextPath}/technology/add"
						method="post" modelAttribute="technology"
						enctype="multipart/form-data">

						<!-- Technology Name -->
						<div class="mb-3">
							<label class="form-label">Technology Name <span
								class="text-danger">*</span></label>
							<form:input path="technologyName" class="form-control" />
							<form:errors path="technologyName" cssClass="text-danger small" />
						</div>

						<!-- Description -->
						<div class="mb-3">
							<label class="form-label">Description <span
								class="text-danger">*</span></label>
							<form:textarea path="description" rows="3" class="form-control" />
							<form:errors path="description" cssClass="text-danger small" />
						</div>

						<!-- Logo Upload (ONLY ADD) -->
						<div class="mb-3">
							<label class="form-label">Technology Logo </label> <input
								type="file" name="logoFile" class="form-control"
								accept="image/*" />
						</div>

						<!-- Status -->
						<div class="mb-3">
							<label class="form-label">Status</label>
							<form:select path="active" class="form-select">
								<form:option value="true">Active</form:option>
								<form:option value="false">Inactive</form:option>
							</form:select>
						</div>

						<!-- Submit -->
						<div class="d-grid mt-4">
							<button type="submit" class="btn btn-success">
								<i class="fa fa-save me-2"></i> Save Technology
							</button>
						</div>

					</form:form>
				</div>

			</div>
		</div>
	</div>

	<!-- EDIT TECHNOLOGY MODAL -->
	<div class="modal fade" id="editTechnologyModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">

				<!-- Header -->
				<div class="modal-header">
					<h5 class="modal-title">
						<i class="fa fa-edit me-2"></i> Edit Technology
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Body -->
				<div class="modal-body">
					<form:form
						action="${pageContext.request.contextPath}/technology/update"
						method="post" modelAttribute="technology" enctype="multipart/form-data">

						<!-- Hidden ID -->
						<c:if test="${editMode}">
							<form:hidden path="technologyId" />
						</c:if>

						<!-- Technology Name -->
						<div class="mb-3">
							<label class="form-label">Technology Name</label>
							<form:input path="technologyName" class="form-control" />
							<form:errors path="technologyName" cssClass="text-danger small" />
						</div>

						<!-- Description -->
						<div class="mb-3">
							<label class="form-label">Description</label>
							<form:textarea path="description" rows="3" class="form-control" />
							<form:errors path="description" cssClass="text-danger small" />
						</div>

						<!-- Update Logo (Optional) -->
						<div class="mb-3">
							<label class="form-label">Change Logo (optional)</label> <input
								type="file" name="logoFile" class="form-control"
								accept="image/*"> <small class="text-muted">
								Upload only if you want to replace existing logo </small>
						</div>

						<!-- Status -->
						<div class="mb-3">
							<label class="form-label">Status</label>
							<form:select path="active" class="form-select">
								<form:option value="true">Active</form:option>
								<form:option value="false">Inactive</form:option>
							</form:select>
						</div>

						<!-- Submit -->
						<div class="d-grid mt-4">
							<button type="submit" class="btn btn-warning">
								<i class="fa fa-save me-2"></i> Update Technology
							</button>
						</div>

					</form:form>
				</div>

			</div>
		</div>
	</div>




	<c:if test="${editMode}">
		<script>
			document.addEventListener("DOMContentLoaded", function() {
				new bootstrap.Modal(document
						.getElementById("editTechnologyModal")).show();
			});
		</script>
	</c:if>

	<script>
		document.addEventListener("DOMContentLoaded", function() {

			const editModalEl = document.getElementById('editTechnologyModal');

			if (editModalEl) {

				editModalEl.addEventListener('hidden.bs.modal', function() {

					// Reset URL to base page (no id, no edit)
					const baseUrl = window.location.origin
							+ '${pageContext.request.contextPath}/technologies';

					window.history.replaceState({}, document.title, baseUrl);
				});
			}
		});
		
		document.addEventListener("DOMContentLoaded", function () {

		    const editModal = document.getElementById('editTechnologyModal');
		    const editForm = editModal?.querySelector('form');

		    editModal?.addEventListener('hidden.bs.modal', function () {
		        editForm?.reset();
		    });
		});
	</script>




	<script
		src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

</body>
</html>
