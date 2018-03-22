<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
	<jsp:directive.page contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1" session="false" />
	<jsp:output doctype-root-element="html"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		omit-xml-declaration="true" />

	<html xmlns="http://www.w3.org/1999/xhtml"
		xmlns:c="http://java.sun.com/jsp/jstl/core"
		xmlns:security="http://www.springframework.org/security/tags">

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />
<title>Users</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<link href="${contextPath}/resources/css/common.css" rel="stylesheet" />
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div class="container">

		<br />
		<table class="table table-striped table-bordered">
			<tr>
				<th><a href="registration">Register</a></th>
				<th><a href="/project/viewProjects">Show Projects</a></th>
				<th><a href="/customer/viewCustomers">Show Customers</a></th>
				<th><a href="/welcome">Back</a></th>
			</tr>
		</table>

		<h1>All Users</h1>
		<!-- 		<table border="2" width="90%" cellpadding="2"> -->
		<table class="table table-striped table-bordered">
			<tr>
				<th>User Id</th>
				<th>Username</th>
				<th>Is deleted</th>

				<security:authorize access="hasRole('ROLE_ADMIN')">
					<th>Delete user</th>
				</security:authorize>
			</tr>

			<c:forEach var="user" items="${list}">
				<tr>
					<td>${user.id}</td>
					<td>${user.username}</td>
					<td>${user.deleted}</td>
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<td><a href="delete-user">Delete user</a></td>
					</security:authorize>

				</tr>
			</c:forEach>
		</table>
		<br />
		<!-- 		<table border="2" width="90%" cellpadding="2"> -->
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous" type="text/javascript"></script>
</body>
	</html>
</jsp:root>