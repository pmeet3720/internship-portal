<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

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
        <div
            class="col-md-6 d-none d-md-flex coffee_mug_background align-items-start">
            <div class="mt-4 ms-5">
                <h2 class="logo text-white">
                    hotdevinternships <span class="logo_com">.com</span>
                </h2>
            </div>
        </div>

        <!-- RIGHT SECTION (Login Form) -->
        <div
            class="col-md-6 d-flex align-items-center justify-content-center bg-light">
            <div class="card shadow p-4 w-75 register-card">

                <h3 class="text-center mb-3">Login to Your Account</h3>

                <form:form action="/authenticate" method="post" modelAttribute="login">

                    <!-- Login Error -->
                    <c:if test="${not empty loginError}">
                        <div class="alert alert-danger py-2 mb-2">
                            ${loginError}
                        </div>
                    </c:if>

                    <!-- Email -->
                    <div class="mb-3">
                        <form:input path="email" type="email"
                            class="form-control" placeholder="Email"/>
                        <div class="error-box">
                            <form:errors path="email" cssClass="text-danger small" />
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="">
                        <form:password path="password"
                            class="form-control" placeholder="Password"/>
                        <div class="error-box">
                            <form:errors path="password" cssClass="text-danger small" />
                        </div>
                    </div>
                    
                    <!-- Forgot Password -->
					<div class="text-end mb-3">
					    <a href="${pageContext.request.contextPath}/forgotpassword"
					       class="text-decoration-none small">
					        Forgot Password?
					    </a>
					</div>

                    <!-- Submit -->
                    <div class="d-grid mt-3">
                        <button type="submit" class="myBtn">Login</button>
                    </div>
                    
                    

                    <!-- Register link -->
                    <div class="text-center mt-3">
                        <span>Don’t have an account?</span>
                        <a href="register" class="fw-bold">Register here</a>
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
