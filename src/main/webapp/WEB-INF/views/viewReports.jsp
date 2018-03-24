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
<title>Reports</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<link href="${contextPath}/resources/css/common.css" rel="stylesheet" />
</head>
<body>

	<div class="container">
		<br />
		<table class="table table-striped table-bordered">
			<tr>
				<th><a href="create-report">Add New Report</a></th>
				<th><a href="/project/viewProjects">Show Projects</a></th>
				<th><a href="/customer/viewCustomers">Show Customers</a></th>
				<th><a href="/welcome">Back</a></th>
			</tr>
		</table>

		<h1>All our Reports</h1>
		<table class="table table-striped table-bordered">
			<tr>
				<th>Report Id</th>
				<th>Name</th>
				<th>Working hours</th>
				<th>Hours of VAB</th>
				<th>Hours of Vacation</th>
				<th>Type of report</th>
				<th>User Id</th>
				<th>Report for date:</th>
				<th>Date when report is been modified:</th>
				<th>Is deleted</th>
				
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<th>Update report</th>
					<th>Delete report</th>
				</security:authorize>
			</tr>

			<c:forEach var="report" items="${list}">
				<tr>
					<td>${report.idReport}</td>
					<td>${report.companyName}</td>
					<td>${report.hoursReported}</td>
					<td>${report.vab}</td>
					<td>${report.vacation}</td>
					<td>${report.locked}</td>
					<td>${report.userID}</td>
					<td>${report.forDate}</td>
					<td>${report.dateModified}</td>
					<td><input type="checkbox" name="deleted" value="${reports.deleted}" /></td>

					<security:authorize access="hasRole('ROLE_ADMIN')">
						<td><a href="update-report/${report.idReport}">Update
								report</a></td>
					</security:authorize>

					<security:authorize access="hasRole('ROLE_ADMIN')">
						<td><a href="delete-report">Delete report</a></td>
					</security:authorize>

				</tr>
			</c:forEach>
		</table>
		<br />

	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous" type="text/javascript"></script>
</body>
	</html>
</jsp:root>