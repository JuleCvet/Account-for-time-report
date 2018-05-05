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
										<input type="checkbox" value="1" checked="checked" disabled="disabled"></input>
										<label for="locked">TRUE</label>
									</c:when>
									
									<c:otherwise>
									<input type="checkbox" value="0" disabled="disabled"></input>
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
								<input type="checkbox" value="1" checked="checked" disabled="disabled" ></input>
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
							<th><a href="locked-report/${report.id}" style="color:#337ab7;" >Lock Report</a></th>
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
</jsp:root>