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

    <title>Lock one report</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>

<body>
<img src="${contextPath}/resources/img/logo.png"></img>
<div class="container">

	<div class="alert alert-danger" role="alert" style = "width: 35%">
	<h4 class="alert-heading">Are you sure that you want to lock this report? ${report.idReport}</h4>
	</div>
	
    <form:form method="POST" modelAttribute="updateReportLocked" class="form-horizontal">
        <h2 class="form-signin-heading">Lock this report ${report.idReport}</h2>
     
         <spring:bind path="idReport">
            <div class="form-group ${status.error ? 'has-error' : ''}">
            	<div class="col-sm-2">
                <form:input type="hidden" path="idReport" class="form-control"></form:input>
                <form:errors path="idReport"></form:errors>
            </div>
            </div>
        </spring:bind>
        
        <spring:bind path="companyName">
			<div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="control-label col-sm-2">Company name:</label>
				<div class="col-sm-2">
					<form:input type="text" path="companyName" class="form-control"
						value="${report.companyName}"  disabled="true" ></form:input>
					<form:errors path="companyName"></form:errors>
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="hoursReported">
			<div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="control-label col-sm-2">Reported hours:</label>
				<div class="col-sm-2">
					<form:input type="text" path="hoursReported" class="form-control"
						value="${report.hoursReported}"  disabled="true" ></form:input>
					<form:errors path="hoursReported"></form:errors>
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="vab">
			<div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="control-label col-sm-2">VAB:</label>
				<div class="col-sm-2">
					<form:input type="text" path="vab" class="form-control"
						value="${report.vab}"  disabled="true" ></form:input>
					<form:errors path="vab"></form:errors>
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="vacation">
			<div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="control-label col-sm-2">Hours for Vacation:</label>
				<div class="col-sm-2">
					<form:input type="text" path="vacation" class="form-control"
						value="${report.vacation}"  disabled="true" ></form:input>
					<form:errors path="vacation"></form:errors>
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="forDate">
			<div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="control-label col-sm-2">Hours for Date:</label>
				<div class="col-sm-2">
					<form:input type="text" path="forDate" class="form-control"
						value="${report.forDate}"  disabled="true" ></form:input>
					<form:errors path="forDate"></form:errors>
				</div>
			</div>
		</spring:bind>
		
		<spring:bind path="dateModified">
			<div class="form-group ${status.error ? 'has-error' : ''}">
			<label class="control-label col-sm-2">Modified date:</label>
				<div class="col-sm-2">
					<form:input type="text" path="dateModified" class="form-control"
						value="${report.dateModified}"  disabled="true" ></form:input>
					<form:errors path="dateModified"></form:errors>
				</div>
			</div>
		</spring:bind>
        
        <button class="btn btn-primary" type="submit" id="search" >Lock</button>
        
    </form:form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>