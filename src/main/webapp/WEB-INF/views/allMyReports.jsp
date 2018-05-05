<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
<jsp:directive.page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="false"/>
<jsp:output doctype-root-element="html" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" omit-xml-declaration="true"/>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:c="http://java.sun.com/jsp/jstl/core"
	xmlns:security="http://www.springframework.org/security/tags">

<head>
<title>All my reports</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet"/>
</head>

<body>
<jsp:include page="menu.jsp"/>
	<div class="container">
		<br />
		<h1>All Reports for user:
			${pageContext.request.userPrincipal.name}</h1>

		<form method="POST" class="form-inline" action="${pageContext.request.contextPath}/report/allMyReports" style="padding-bottom: 10px;">
		
			<div class="form-group">
				<label for="datepicker" style="margin-right:7px; margin-left:7px;" >From Date:</label> <input type="text"
					class="form-control" name="fromDate" id="fromDate"
					value="${fromDate}"></input>
			</div>
			
			<div class="form-group">
				<label for="datepicker1" style="margin-right:7px; margin-left:7px;" >To Date:</label> <input type="text"
					class="form-control" name="toDate" id="toDate" value="${toDate}"></input>
			</div>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
			<button type="submit" class="btn btn-primary" style="margin-left:7px; background-color:#337ab7;" >Filter Dates</button>
		</form>

		<table class="table table-striped table-bordered">
			<tr>
				<th>Report Id</th>
				<th>Name</th>
				<th>Project</th>
				<th>Working hours</th>
				<th>Hours of VAB</th>
				<th>Hours of Vacation</th>
				<th>Locked</th>
				<th>Report for date</th>
				<th>Date modified</th>
				<th>Is deleted</th>
			
					<th>Update report</th>
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<th>Lock Report</th>
				</security:authorize>
					<th>Delete report</th>
			</tr>

			<c:forEach var="report" items="${list}">
				<tr>
					<c:choose>
						<c:when test="${report.locked=='1'}">

							<td><i>${report.idReport}</i></td>
							<td><i>${report.companyName}</i></td>
							<td><i>${report.projectID}</i></td>
							<td><i>${report.hoursReported}</i></td>
							<td><i>${report.vab}</i></td>
							<td><i>${report.vacation}</i></td>

							<td><i><b><c:choose>
									<c:when test="${report.locked=='1'}">
										<input type="checkbox"  value="1" checked="checked" disabled="disabled"></input>
									    <label for="locked">TRUE</label>
									</c:when>
									<c:otherwise>
										<input type="checkbox" value="0" disabled="disabled"></input>
									    <label for="locked">FALSE</label>
									</c:otherwise>
										</c:choose>
							</b></i></td>

							<td><i>${report.forDate}</i></td>
							<td><i>${report.dateModified}</i></td>

							<td><i><c:choose>
									<c:when test="${report.deleted=='1'}">TRUE<br /></c:when>
									<c:otherwise>FALSE<br /></c:otherwise>
								</c:choose></i></td>

							<td><i><a href="update-report/${report.idReport}"  style="color:#337ab7;" >Update report</a></i></td>
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<th></th>
							</security:authorize>
							<td><i><a href="delete-report/${report.idReport}"  style="color:#337ab7;" >Delete report</a></i></td>
						</c:when>
						
						<c:otherwise>
							<td>${report.idReport}</td>
							<td>${report.companyName}</td>
							<td><i>${report.projectID}</i></td>
							<td>${report.hoursReported}</td>
							<td>${report.vab}</td>
							<td>${report.vacation}</td>
					
							<td>
								<c:choose>
									<c:when test="${report.locked=='1'}">
										<input type="checkbox"  value="1" checked="checked" disabled="disabled"></input>
									    <label for="locked">TRUE</label>
									</c:when>
									<c:otherwise>
										<input type="checkbox" value="0" disabled="disabled"></input>
									    <label for="locked">FALSE</label>
									</c:otherwise>
								</c:choose>
							</td>
								
							<td>${report.forDate}</td>
							<td>${report.dateModified}</td>

							<td><c:choose>
									<c:when test="${report.deleted=='1'}">TRUE<br /></c:when>
									<c:otherwise>FALSE<br /></c:otherwise>
								</c:choose></td>
							
							<td><a href="update-report/${report.idReport}"  style="color:#337ab7;" >Update report</a></td>
								
							<security:authorize access="hasRole('ROLE_ADMIN')">
							<th><a href="locked-report/${report.idReport}"  style="color:#337ab7;" >Lock Report</a></th>
							</security:authorize>

							<td><a href="delete-report/${report.idReport}"  style="color:#337ab7;" >Delete report</a></td>
								
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<h3>Sum of all working hours: ${totalHours}</h3>
		<h3>Expected monthly working hours: 168</h3>
	</div>
</body>
</html>
</jsp:root>