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
    $( "#datepicker" ).datepicker();
  } );
  $( function() {
	    $( "#datepicker1" ).datepicker();
 } );
  </script>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Create a report</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<div class="container">

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<%-- <h2>Welcome ${pageContext.request.userPrincipal.name} with user id: ${username.id}</h2> --%>
		</c:if>
		<form:form method="POST" modelAttribute="reportForm"
			class="form-signin">

			<h2 class="form-signin-heading">Create your report</h2>

			<p>
				Today's date:
				<%= (new java.util.Date()).toLocaleString()%></p>

			<spring:bind path="companyName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="companyName" class="form-control"
						placeholder="Name of report: " autofocus="true"></form:input>
					<form:errors path="companyName"></form:errors>
				</div>
			</spring:bind>


			<spring:bind path="forDate">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="forDate" id="datepicker"
						class="form-control" placeholder="For Date:"></form:input>
					<form:errors path="forDate"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="hoursReported">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="hoursReported" class="form-control"
						placeholder="Reported hours:" autofocus="true"></form:input>
					<form:errors path="hoursReported"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="dateModified">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="dateModified" id="datepicker1"
						class="form-control" placeholder="Date Modified:"></form:input>
					<form:errors path="dateModified"></form:errors>
				</div>

			</spring:bind>

			<spring:bind path="vab">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="vab" class="form-control"
						placeholder="Hours for VAB" autofocus="true"></form:input>
					<form:errors path="vab"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="userID">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" value="${username.id}" path="userID"
						class="form-control"></form:input>
					<form:errors path="userID"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="deleted">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" path="deleted" class="form-control"
						value="0"></form:input>
					<form:errors path="deleted"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="vacation">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="vacation" class="form-control"
						placeholder="Hours for Vacation" autofocus="true"></form:input>
					<form:errors path="vacation"></form:errors>
				</div>
			</spring:bind>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>
	</div>
	<script src="${contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
</body>
</html>