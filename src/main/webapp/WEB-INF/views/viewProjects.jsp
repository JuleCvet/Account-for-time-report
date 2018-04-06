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
<title>Projects</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<link href="${contextPath}/resources/css/common.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<br />
		<table class="table table-striped table-bordered">
			<tr>
				<th><security:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/project/create-project">Add New Project</a>
					</security:authorize></th>

				<th><a href="/customer/viewCustomers">Show Customers</a></th>
				<th><a href="/report/allMyReports">All My reports</a></th>
				<th><a href="/welcome">Back</a></th>
			</tr>
			<br />
		</table>

		<h1>All Projects</h1>
		<!-- 		<table border="2" width="90%" cellpadding="2"> -->
		<table class="table table-striped table-bordered">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Description</th>
				<th>Type</th>
				<th>Is deleted</th>

				<security:authorize access="hasRole('ROLE_ADMIN')">
					<th>Edit</th>
					<th>Delete</th>
				</security:authorize>
			</tr>

			<c:forEach var="project" items="${list}">
				<tr>
					<td>${project.id}</td>
					<td>${project.projectName}</td>
					<td>${project.description}</td>
					<td>${project.type}</td>
					
					<td><c:choose><c:when test="${project.deleted=='1'}">TRUE<br /></c:when>    
				    <c:otherwise>FALSE<br /></c:otherwise></c:choose></td>
					
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<td><a href="update-project/${project.id}">Update project</a></td>
					</security:authorize>

					<security:authorize access="hasRole('ROLE_ADMIN')">
						<td><a href="delete-project/${project.id}">Delete project</a></td>
					</security:authorize>
				</tr>
			</c:forEach>
		</table>
	</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous" type="text/javascript"></script>
</body>
	</html>
</jsp:root>