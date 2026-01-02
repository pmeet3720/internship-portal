<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login HotDev Internships</title>

    <!-- Bootstrap (WebJars) -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/webjars/bootstrap/css/bootstrap.min.css"/>

    <!-- Custom CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/font-awesome.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/styles.css"/>

</head>

<body class="background">

<nav class="main_div">
    <div class="logo_left">
        <label class="logo">hotdevinternships</label>
        <label class="logo_com">.com</label>
    </div>

    <div class="logo_right">
        <label class="Candidate_login_btn">
            <a href="${pageContext.request.contextPath}/login">
                Candidate Login
            </a>
            <a href="${pageContext.request.contextPath}/register">
                /Register
            </a>
        </label>

        <label class="Recruiter_login_btn">
            <a href="${pageContext.request.contextPath}/login">
                Admin Login
            </a>
            <%-- <a href="${pageContext.request.contextPath}/register">
                /Register
            </a> --%>
        </label>
    </div>
</nav>

<!-- Search Form -->
<form action="${pageContext.request.contextPath}/global-search/" method="get">
    <div class="searchBox">
        <div class="inner">

            <input type="text"
                   placeholder="Search for a internship"
                   name="job"
                   value="${job}"/>

            <input type="text"
                   placeholder="Enter a location"
                   name="location"
                   value="${location}"/>

            <button type="submit">
                <i class="fa fa-search"></i>
            </button>

        </div>
    </div>
</form>

<footer>
    <label class="copy-right">
        Copyright © hotdevinternships.com
    </label>
</footer>

<!-- JS -->
<script src="${pageContext.request.contextPath}/webjars/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
