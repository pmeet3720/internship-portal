<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
<div>
	<form action="demoregister" method="post" enctype="multipart/form-data">
		<c:if test="${not empty fieldError}">
			<div>
				${fieldError}
			</div>
		</c:if>
		FirstName: <input type="text" name="firstName"/><br>
		LastName: <input type="text" name="lastName"/><br>
		Gender: <br>
		<input type="radio" name="gender" value="Male"/> Male
		<input type="radio" name="gender" value="Female"/> Female
		<input type="radio" name="gender" value="Other"/> Other
		
		<br>
		Email: <input type="email" name="email"/><br>
		Password: <input type="password" name="password"/><br>
		Contact No.: <input type="text" name="contactNo"/><br>
		City: <input type="text" name="city"/><br>
		State: <input type="text" name="state"/><br>
		Country: <input type="text" name="country"/><br>
		<select name="roles">
			<option selected disabled>--Select Roles--</option>
			<c:forEach items="${rolesList}" var="role">
				<option value="${role}">${role}</option>
			</c:forEach>
		</select>
		<br>
		
		Profile Picture: <br>
		<input type="file" name="imageFile"/><br>
		<button type="submit">Register</button>
	</form>
</div>
</body>
</html>