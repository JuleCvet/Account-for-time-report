<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Update your report</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	type="text/javascript"></script>

<script type="text/javascript">
 $( function() {
   $( "#forDate" ).datepicker();
 } );
 </script>
</head>

<body>
	<div class="container">

		<form:form modelAttribute="update" class="form-signin">
			<h2 class="form-signin-heading">Update your report with Id: ${idReport}</h2>

			<spring:bind path="idReport">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" value="${report.idReport}"
						path="idReport" class="form-control"></form:input>
					<form:errors path="idReport"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="companyName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="companyName" class="form-control"
						placeholder="Company name:" value="${report.companyName}"></form:input>
					<form:errors path="companyName"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="hoursReported">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="hoursReported" class="form-control"
						placeholder="Hours Reported:" value="${report.hoursReported}"></form:input>
					<form:errors path="hoursReported"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="vab">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="vab" class="form-control"
						placeholder="Hours for VAB:" value="${report.vab}"></form:input>
					<form:errors path="vab"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="vacation">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="vacation" class="form-control"
						placeholder="Hours for vacation:" value="${report.vacation}"></form:input>
					<form:errors path="vacation"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="locked">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="locked" class="form-control"
						placeholder="Locked report:" value="${report.locked}"></form:input>
					<form:errors path="locked"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="userID">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="userID" class="form-control"
						placeholder="User ID of the report:" value="${report.userID}"></form:input>
					<form:errors path="userID"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="forDate">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" id="forDate" name="forDate" path="forDate"
						class="form-control" placeholder="For Date:" value="${forDate}"></form:input>
					<form:errors path="forDate"></form:errors>
				</div>
			</spring:bind>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>
	</div>
	<script src="${contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
</body>
</html>
