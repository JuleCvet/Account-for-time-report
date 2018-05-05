<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Delete a report</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
<jsp:include page="menu.jsp"/>
	<div class="container">
	<br/>
	<div class="alert alert-danger" role="alert" style = "width: 49%">
	<h4 class="alert-heading">Are you sure that you want delete Info about this report?</h4>	
	</div>
	
	<h2 class="form-signin-heading">Delete info about this report:</h2>
	<br/>
    <form:form modelAttribute="updateReportDel">
       
        	<spring:bind path="idReport">
				<form:input type="hidden" path="idReport" class="form-control"></form:input>
                <form:errors path="idReport"></form:errors>
			</spring:bind>
      
      		<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="companyName" >
				<label class="col-sm-2 col-form-label">Company Name:</label>
					<div class="col-sm-4">
						<form:input type="text" path="companyName" class="form-control" value="${report.companyName}" disabled="true" ></form:input>
						<form:errors path="companyName"></form:errors>
					</div>
			</spring:bind>
			</div>

			<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="hoursReported" >
				<label class="col-sm-2 col-form-label">Reported hours:</label>
					<div class="col-sm-4">
						<form:input type="text" path="hoursReported" class="form-control" value="${report.hoursReported}" disabled="true" ></form:input>
						<form:errors path="hoursReported"></form:errors>
					</div>
			</spring:bind>
			</div>
		
			<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="vab" >
				<label class="col-sm-2 col-form-label">VAB</label>
					<div class="col-sm-4">
						<form:input type="text" path="vab" class="form-control" value="${report.vab}" disabled="true" ></form:input>
						<form:errors path="vab"></form:errors>
					</div>
			</spring:bind>
			</div>
		
			<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="vacation" >
				<label class="col-sm-2 col-form-label">Vacation</label>
					<div class="col-sm-4">
						<form:input type="text" path="vacation" class="form-control" value="${report.vacation}" disabled="true"></form:input>
						<form:errors path="vacation"></form:errors>
					</div>
			</spring:bind>
			</div>
	
			<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="forDate" >
				<label class="col-sm-2 col-form-label">For Date:</label>
					<div class="col-sm-4">
						<form:input type="text" path="forDate" class="form-control" value="${report.forDate}" disabled="true"></form:input>
						<form:errors path="forDate"></form:errors>
					</div>
			</spring:bind>
			</div>
	
			<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="dateModified" >
				<label class="col-sm-2 col-form-label">Date modified:</label>
					<div class="col-sm-4">
						<form:input type="text" path="dateModified" class="form-control" value="${report.dateModified}" disabled="true" ></form:input>
						<form:errors path="dateModified"></form:errors>
					</div>
			</spring:bind>
			</div>

        <button class="btn btn-primary " type="submit" id="search">Delete</button>
    </form:form>
</div>
</body>
</html>