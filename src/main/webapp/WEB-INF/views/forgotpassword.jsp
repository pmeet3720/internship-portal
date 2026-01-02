<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

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

        <!-- RIGHT SECTION (Forgot Password Form) -->
        <div class="col-md-6 d-flex align-items-center justify-content-center bg-light">
            <div class="card shadow p-4 w-75 register-card">

                <h3 class="text-center mb-3">Forgot Password</h3>
                <p class="text-center text-muted mb-3">
                    Enter your registered email to receive OTP
                </p>

                <form:form action="/forgotpassword" method="post" modelAttribute="forgotPassword">

                    <!-- Success Message -->
                    <%-- <c:if test="${not empty successMsg}">
                        <div class="alert alert-success py-2 mb-2">
                            ${successMsg}
                        </div>
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty errorMsg}">
                        <div class="alert alert-danger py-2 mb-2">
                            ${errorMsg}
                        </div>
                    </c:if> --%>

                    <!-- Email -->
                    <div class="mb-3">
                        <form:input path="email" type="email"
                            class="form-control"
                            placeholder="Enter your registered email"/>
                        <div class="error-box">
                            <form:errors path="email" cssClass="text-danger small"/>
                        </div>
                    </div>

                    <!-- Submit -->
                    <div class="d-grid mt-3">
                        <button type="submit" class="myBtn">
                            Send OTP
                        </button>
                    </div>

                    <!-- Back to Login -->
                    <!-- <div class="text-center mt-3">
                        <a href="login" class="fw-bold">Back to Login</a>
                    </div> -->

                </form:form>
            </div>
        </div>

    </div>
</section>

<script src="${pageContext.request.contextPath}/webjars/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
