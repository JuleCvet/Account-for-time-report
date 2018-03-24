<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xtml"
	xmlns:h="http://xmlns.jcp.org/jsf/html"
	xmlns:p="http://primefaces.org.ui"
	xmlns:f="http://xmlns.jcp.org/jsf/core"
	xmlns:ui="http://xmlns.jcp.org/jsf/facelets">
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	type="text/javascript"></script>

<script type="text/javascript">
  $( function() {
    $( "#fromDate" ).datepicker();
  } );
  $( function() {
	    $( "#toDate" ).datepicker();
 } );
  </script>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>All My Reports</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

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

		<h1>All Reports for user:
			${pageContext.request.userPrincipal.name}</h1>

		<form method="POST" class="form-inline" action="/report/allMyReports" style="padding-bottom: 10px;">
			<div class="form-group">
				<label for="datepicker">From Date:</label> 
				<input type="text" class="form-control" name="fromDate" id="fromDate" value="${fromDate}"></input>
			</div>
			<div class="form-group">
				<label for="datepicker1">To Date:</label>
				<input type="text" class="form-control" name="toDate" id="toDate" value="${toDate}"></input>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<button type="submit" class="btn btn-primary">Filter Dates</button>
		</form>

		<table class="table table-striped table-bordered">
			<tr>
				<th>Report Id</th>
				<th>Name</th>
				<th>Working hours</th>
				<th>Hours of VAB</th>
				<th>Hours of Vacation</th>
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
					<td>${report.forDate}</td>
					<td>${report.dateModified}</td>
					<td>${report.deleted}</td>

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
		<h3>Sum of all working hours: ${totalHours}</h3>
		<br />
		<form action=""></form>
	</div>
	<script src="${contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>