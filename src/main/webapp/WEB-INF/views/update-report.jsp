<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<title>Update your report</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">

<script type="text/javascript">
var dates = ['01/01/2018', '01/06/2018', '03/30/2018','04/01/2018', '04/02/2018', '05/01/2018', '05/10/2018', '05/20/2018', 
	 '06/06/2018', '06/22/2018','06/23/2018', '11/03/2018', '12/24/2018',  '12/25/2018',  '12/26/2018',  '12/31/2018'];
 
	$(function() {
		$("#forDate").datepicker({ firstDay: 1 , beforeShowDay: highlightDays});
	});

	$( function() {
	    $( "#datepicker1" ).datepicker({ firstDay: 1 , beforeShowDay: highlightDays});
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
		<h2 class="form-signin-heading">Update your report ${report.idReport}</h2>
		<br/>
		<form:form modelAttribute="update">
		
			<spring:bind path="userID">
				<form:input type="hidden" path="userID" class="form-control" value="${report.userID}"></form:input>	
				<form:errors path="userID"></form:errors>
			</spring:bind>
			<spring:bind path="idReport">
				<form:input type="hidden" value="${report.idReport}" path="idReport" class="form-control"></form:input>
				<form:errors path="idReport"></form:errors>
			</spring:bind>
			
			<div class="form-group row ${status.error ? 'has-error' : ''}">
				<spring:bind path="companyName" >
						<label class="col-sm-2 col-form-label">Name of report:</label>
						<div class="col-sm-4">
							<form:input type="text" path="companyName" class="form-control" value="${report.companyName}" ></form:input>
							<form:errors path="companyName"></form:errors>
						</div>
				</spring:bind>
			</div>
			
			<div class="form-group row ${status.error ? 'has-error' : ''}">
				<spring:bind path="projectID">
				<label class="col-sm-2 col-form-label">Name of project:</label>
					<div class="col-sm-4">
						<form:select class="form-control" style="padding-bottom:5px; padding-top:5px;" path="projectID">
							<c:forEach var="project" items="${projects}">
								<option value="${project.id}">${project.projectName}</option>
							</c:forEach>
						</form:select>
					</div>
				</spring:bind>
			</div>
			
			<div class="form-group row ${status.error ? 'has-error' : ''}">
				<spring:bind path="hoursReported">
						<label class="col-sm-2 col-form-label">Hours Reported:</label>
							<div class="col-sm-4">
								<form:input type="text" path="hoursReported" class="form-control" value="${report.hoursReported}"></form:input>
								<form:errors path="hoursReported"></form:errors>
							</div>
				</spring:bind>
			</div>
			
			<div class="form-group row ${status.error ? 'has-error' : ''}">
					<spring:bind path="vab">
							<label class="col-sm-2 col-form-label">VAB:</label>
								<div class="col-sm-4">
								<form:input type="text" path="vab" class="form-control" value="${report.vab}"></form:input>
								<form:errors path="vab"></form:errors>
								</div>
					</spring:bind>
				</div>
				
				<div class="form-group row ${status.error ? 'has-error' : ''}">
					<spring:bind path="vacation">
						<label class="col-sm-2 col-form-label">Hours for Vacation</label>
							<div class="col-sm-4">
								<form:input type="text" path="vacation" class="form-control" value="${report.vacation}"></form:input>
								<form:errors path="vacation"></form:errors>
							</div>
					</spring:bind>
				</div>
				
				<div class="form-group row ${status.error ? 'has-error' : ''}">
					<spring:bind path="forDate">
						<label class="col-sm-2 col-form-label">For Date:</label>
							<div class="col-sm-4">
								<form:input type="text" id="forDate" name="forDate" path="forDate" class="form-control" value="${forDate}"></form:input>
								<form:errors path="forDate"></form:errors>
							</div>
					</spring:bind>
				</div>
				
			<button class="btn btn-primary" type="submit" id="search">Submit</button>
		</form:form>
	</div>
</body>
</html>