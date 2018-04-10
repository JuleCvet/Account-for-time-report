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
<title>Customers</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<link href="${contextPath}/resources/css/common.css" rel="stylesheet" />

</head>
<body>
	<div class="container">
		<br />
		<table class="table table-striped table-bordered">
			<tr>
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<th><a href="/customer/create-customer">Add New customer</a></th>
				</security:authorize>
				
				<th><a href="/project/viewProjects">Show Projects</a></th>
				<th><a href="/report/viewReports">Show Reports</a></th>
				<th><a href="/report/allMyReports">All My Reports</a></th>
				<th><a href="/welcome">Back</a></th>
			</tr>
		</table>

		<h1>All Customers</h1>
		<table class="table table-striped table-bordered">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Is deleted</th>
				
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<th>Edit</th>
					<th>Delete</th>
				</security:authorize>
			</tr>

			<c:forEach var="customer" items="${list}">
				<tr>
					<c:choose>
						<c:when test="${customer.deleted=='1'}">
				
							<td>${customer.customerId}</td>
							<td>${customer.customerName}</td>
							
							<td><c:choose><c:when test="${customer.deleted=='1'}">TRUE<br /></c:when>    
						    <c:otherwise>FALSE<br /></c:otherwise></c:choose></td>
		
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<td><a href="update-customer/${customer.customerId}">Update
										customer</a></td>
							</security:authorize>
		
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<td></td>
							</security:authorize>
					
						</c:when>
						
						<c:otherwise>
						
							<td>${customer.customerId}</td>
							<td>${customer.customerName}</td>
							
							<td><c:choose><c:when test="${customer.deleted=='1'}">TRUE<br /></c:when>    
						    <c:otherwise>FALSE<br /></c:otherwise></c:choose></td>
		
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<td><a href="update-customer/${customer.customerId}">Update
										customer</a></td>
							</security:authorize>
		
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<td><a href="delete-customer/${customer.customerId}">Delete customer</a></td>
							</security:authorize>
							
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<br />
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous" type="text/javascript"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous" type="text/javascript"></script>

</body>
	</html>
</jsp:root>