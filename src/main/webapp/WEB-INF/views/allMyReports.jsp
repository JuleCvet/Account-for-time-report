<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xtml"
	xmlns:h="http://xmlns.jcp.org/jsf/html"
	xmlns:p="http://primefaces.org.ui"
	xmlns:f="http://xmlns.jcp.org/jsf/core"
	xmlns:ui="http://xmlns.jcp.org/jsf/facelets">
	
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>All My Reports</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet" />
<script type="text/javascript">
var dates = ['01/01/2018', '01/06/2018', '03/30/2018','04/01/2018', '04/02/2018', '05/01/2018', '05/10/2018', '05/20/2018', 
		 '06/06/2018', '06/22/2018','06/23/2018', '11/03/2018', '12/24/2018',  '12/25/2018',  '12/26/2018',  '12/31/2018'];
	
  $( function() {
    $( "#fromDate" ).datepicker({ firstDay: 1 , beforeShowDay: highlightDays});
  } );
  $( function() {
	    $( "#toDate" ).datepicker({ firstDay: 1 , beforeShowDay: highlightDays});
 } );
  function highlightDays(date) {
	    for (var i = 0; i < dates.length; i++) {
	        if (new Date(dates[i]).toString() == date.toString()) {
	            return [true, 'highlight'];
	        }
	    }
	    return [true, ''];
	}
  </script>
</head>

<body>
<jsp:include page="menu.jsp"/>
	<div class="container">
	<br/>
		<h1>All Reports for user:
			${pageContext.request.userPrincipal.name}</h1>

		<form method="POST" class="form-inline" action="/report/allMyReports" style="padding-bottom: 10px;">
		
			<div class="form-group">
				<label for="datepicker">From Date:</label> <input type="text"
					class="form-control" name="fromDate" id="fromDate"
					value="${fromDate}"></input>
			</div>
			
			<div class="form-group">
				<label for="datepicker1">To Date:</label> <input type="text"
					class="form-control" name="toDate" id="toDate" value="${toDate}"></input>
			</div>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
			<button type="submit" class="btn btn-primary" style="background-color:#337ab7;" >Filter Dates</button>
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
										<input type="checkbox"  value="1" checked disabled>
									    <label for="locked">TRUE</label>
									</c:when>
									<c:otherwise>
										<input type="checkbox" value="0" disabled>
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

							<td><c:choose>
									<c:when test="${report.deleted=='1'}">TRUE<br /></c:when>
									<c:otherwise>FALSE<br /></c:otherwise>
								</c:choose></td>
							
							<td><a href="update-report/${report.idReport}"  style="color:#337ab7;" >Update report</a></td>
								
							<security:authorize access="hasRole('ROLE_ADMIN')">
							<th><a href="/report/locked-report/${report.idReport}"  style="color:#337ab7;" >Lock Report</a></th>
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