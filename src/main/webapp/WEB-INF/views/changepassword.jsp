<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>

<!-- Bootstrap -->
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.0/css/bootstrap.min.css" />

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
        <div
            class="col-md-6 d-none d-md-flex coffee_mug_background align-items-start">
            <div class="mt-4 ms-5">
                <h2 class="logo text-white">
                    hotdevinternships <span class="logo_com">.com</span>
                </h2>
            </div>
        </div>

        <!-- RIGHT SECTION -->
        <div
            class="col-md-6 d-flex align-items-center justify-content-center bg-light">
            <div class="card shadow p-4 w-75 register-card">

                <h3 class="text-center mb-2">Change Password</h3>
                <p class="text-center text-muted mb-3">
                    Enter OTP sent to your email
                </p>

                <form:form method="post"
                           action="/change-password"
                           modelAttribute="changePassword">

                    <!-- Email -->
                    <div class="mb-3">
                        <form:input path="email" type="email"
                            class="form-control"
                            placeholder="Email"/>
                        <div class="error-box">
                            <form:errors path="email"
                                cssClass="text-danger small"/>
                        </div>
                    </div>

                    <!-- OTP -->
                    <div class="mb-3">
                        <form:input path="otp" type="text"
                            class="form-control"
                            placeholder="Enter OTP"/>
                        <div class="error-box">
                            <form:errors path="otp"
                                cssClass="text-danger small"/>
                        </div>
                    </div>

                    <!-- New Password -->
                    <div class="mb-3">
                        <form:password path="newPassword"
                            class="form-control"
                            placeholder="New Password"/>
                        <div class="error-box">
                            <form:errors path="newPassword"
                                cssClass="text-danger small"/>
                        </div>
                    </div>

                    <!-- Global Error -->
                    <%-- <c:if test="${not empty error}">
                        <div class="alert alert-danger py-2">
                            ${error}
                        </div>
                    </c:if>

                    <!-- Success Message -->
                    <c:if test="${not empty success}">
                        <div class="alert alert-success py-2">
                            ${success}
                        </div>
                    </c:if> --%>

                    <!-- Submit -->
                    <div class="d-grid mt-3">
                        <button type="submit" class="myBtn">
                            Update Password
                        </button>
                    </div>

                    <!-- Back to Login -->
                    <div class="text-center mt-3">
                        <a href="login" class="fw-bold">
                            Back to Login
                        </a>
                    </div>

                </form:form>
            </div>
        </div>

    </div>
</section>

<script
    src="${pageContext.request.contextPath}/webjars/jquery/jquery.min.js"></script>
<script
    src="${pageContext.request.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
