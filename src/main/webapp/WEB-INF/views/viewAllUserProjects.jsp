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
<title>UsersProjects Combination</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextPath}/resources/css/common.css" rel="stylesheet" />

</head>
<body>
<img src="${contextPath}/resources/img/logo.png"></img>
	<div class="container">
		<br/>
		
		<table class="table table-striped table-bordered">
			<tr>	
				<th><security:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/userproject/create-userProject">Add New Combination</a></security:authorize></th>		
						
				<th><a href="/viewUsers">Show Users</a></th>	
				<th><a href="/project/viewProjects">Show Projects</a></th>
				<th><a href="/customer/viewCustomers">Show Customers</a></th>
				<th><a href="/report/allMyReports">All My reports</a></th>
				<th><a href="/report/viewReports">Show reports</a></th>
				<th><a href="/welcome">Back</a></th>
			</tr>
			<br />
		</table>
		
		<h1>Users - Projects Combinations</h1>
		<table class="table table-striped table-bordered">
			<tr>
				<th>User Project Id</th>
				<th>User Id</th>
				<th>Project Id</th>
				<th>Is deleted</th>
				<th>Delete combination</th>
			</tr>

			<c:forEach var="userproject" items="${list}">
				<tr>
					<c:choose>
						<c:when test="${userproject.deleted=='1'}">	

					<td>${userproject.id}</td>
					<td>${userproject.userID} (${userproject.userName})</td>
					<td>${userproject.projectID} (${userproject.companyName})</td>
					<td><c:choose>
				    <c:when test="${userproject.deleted=='1'}">TRUE<br /></c:when>    
				    <c:otherwise>FALSE<br /></c:otherwise>
					</c:choose></td>
					
					<th><security:authorize access="hasRole('ROLE_ADMIN')"></security:authorize></th>
						
						</c:when>
						
						<c:otherwise>
							<td>${userproject.id}</td>
							<td>${userproject.userID} (${userproject.userName})</td>
							<td>${userproject.projectID} (${userproject.companyName})</td>
							<td><c:choose>
						    <c:when test="${userproject.deleted=='1'}">TRUE<br /></c:when>    
						    <c:otherwise>FALSE<br /></c:otherwise>
							</c:choose></td>
							
							<th><security:authorize access="hasRole('ROLE_ADMIN')">
								<a href="/userproject/delete-userProject/${userproject.id}">Delete combination</a></security:authorize></th>
						
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
	</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
				crossorigin="anonymous" type="text/javascript"></script>
</body>
</html>
</jsp:root>

