<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xtml" xmlns:h="http://xmlns.jcp.org/jsf/html" xmlns:p="http://primefaces.org.ui"
	xmlns:f="http://xmlns.jcp.org/jsf/core" xmlns:ui="http://xmlns.jcp.org/jsf/facelets">
	
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<script type="text/javascript">
  $( function() {
    $( "#fromDate" ).datepicker();
  } );
  $( function() {
	    $( "#toDate" ).datepicker();
 } );
  </script>

<title>View Reports</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet" />
</head>

<body>
<jsp:include page="menu.jsp"/>
<div class="container">
		<br/>
		<h1>All our Reports</h1>
		<table class="table table-striped table-bordered">
			<tr>
				<th>Report Id</th>
				<th>Name</th>
				<th>Project</th>
				<th>Working hours</th>
				<th>Hours of VAB</th>
				<th>Hours of Vacation</th>
				<th>User</th>
				<th>Locked</th>
				<th>Report for date:</th>
				<th>Date when report is been modified:</th>
				<th>Is deleted</th>

				<security:authorize access="hasRole('ROLE_ADMIN')">
					<th>Update report</th>
					<th>Lock report</th>
					<th>Delete report</th>
				</security:authorize>
			</tr>

			<c:forEach var="report" items="${list}">
				<tr>
					<c:choose>
						<c:when test="${report.locked=='1'}">
							<td><i>${report.id}</i></td>
							<td><i>${report.companyName}</i></td>
							<td><i>${report.projectName}</i></td>
							<td><i>${report.hoursReported}</i></td>
							<td><i>${report.vab}</i></td>
							<td><i>${report.vacation}</i></td>
							<td><i>${report.username}</i></td>
							
							<td><i><b>
								<c:choose>
									<c:when test="${report.locked=='1'}">
										<input type="checkbox" value="1" checked disabled>
										<label for="locked">TRUE</label>
									</c:when>
									
									<c:otherwise>
									<input type="checkbox" value="0" disabled>
										<label for="locked">FALSE</label>
									</c:otherwise>
								</c:choose>
								</b></i>
							</td>
				
							<td><i>${report.forDate}</i></td>
							<td><i>${report.dateModified}</i></td>

							<td><i>
								<c:choose>
									<c:when test="${report.deleted=='1'}">TRUE<br /></c:when>
									<c:otherwise>FALSE<br /></c:otherwise>
								</c:choose></i>
							</td>

							<security:authorize access="hasRole('ROLE_ADMIN')">
								<td></td>
							</security:authorize>

							<security:authorize access="hasRole('ROLE_ADMIN')">
								<th></th>
							</security:authorize>

							<security:authorize access="hasRole('ROLE_ADMIN')">
								<td><i></i></td>
							</security:authorize>
						</c:when>

				<c:otherwise>
					<td>${report.id}</td>
					<td>${report.companyName}</td>
					<td><i>${report.projectName}</i></td>
					<td>${report.hoursReported}</td>
					<td>${report.vab}</td>
					<td>${report.vacation}</td>
					<td><i>${report.username}</i></td>

					<td>
						<c:choose>
							<c:when test="${report.locked=='1'}">
								<input type="checkbox"  value="1" checked disabled>
								<label for="locked">TRUE</label>
							</c:when>
							<c:otherwise>
								<input type="checkbox" value="0" disabled>
								<label for="locked">FALSE</label>
							</c:otherwise>
						</c:choose>
					</td>
							
					<td>${report.forDate}</td>
					<td>${report.dateModified}</td>

					<td>
						<c:choose>
							<c:when test="${report.deleted=='1'}">TRUE<br/></c:when>
							<c:otherwise>FALSE<br/></c:otherwise>
						</c:choose>
					</td>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<td><a href="update-report/${report.id}" style="color:#337ab7;" >Update report</a></td>
						</security:authorize>

						<security:authorize access="hasRole('ROLE_ADMIN')">
							<th><a href="/report/locked-report/${report.id}" style="color:#337ab7;" >Lock Report</a></th>
						</security:authorize>

						<security:authorize access="hasRole('ROLE_ADMIN')">
							<td><a href="delete-report/${report.id}" style="color:#337ab7;" >Delete report</a></td>
						</security:authorize>
				</c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
</table>
<br/>
</div>
</body>
</html>