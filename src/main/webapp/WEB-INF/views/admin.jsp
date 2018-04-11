<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.hellokoding.account.model.ProjectTypeEnum"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<title>Administrator page</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<form:form method="POST" modelAttribute="admin" class="form-signin">
		<p>Today's date:<%= (new java.util.Date()).toLocaleString()%></p>
		<div class="form-group"></div>
		
			<h2>Select User</h2>
			<select class="form-control" id="userSelection" name="userSelection">
				<c:forEach var="user" items="${list}">
					<option value="${user.id}">${user.username}</option>
				</c:forEach>
			</select>
			
			<h2>Select Project</h2>
			<select class="form-control" id="projectSelection">
				<c:forEach var="project" items="${listProjects}">
					<option value="${project.id}">${project.projectName}</option>
				</c:forEach>
			</select>			

			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>

		</form:form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
		type="text/javascript"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
</body>
</html>