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

<title>Delete a User</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
<jsp:include page="menu.jsp"/>
	<div class="container">
	<br/>
	<div class="alert alert-danger" role="alert" style = "width: 49%">
	<h4 class="alert-heading">Are you sure that you want to delete Info for this user?</h4>
	</div>
	
	<h2 class="form-signin-heading">Delete info for user</h2>
	<br/>
	<form:form modelAttribute="userDelete">
		
			<spring:bind path="id">
				<form:input type="hidden" path="id" class="form-control" placeholder="ID of user you want to delete info:" autofocus="true"></form:input>
				<form:errors path="id"></form:errors>
			</spring:bind>
		
			<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="username">
				<label class="col-sm-2 col-form-label">User name:</label>
					<div class="col-sm-4">
						<form:input type="text" path="username"  disabled="true" class="form-control"></form:input>
						<form:errors path="username"></form:errors>
					</div>
			</spring:bind>
			</div>
			
			<button class="btn btn-primary" type="submit" id ="search">Delete</button>
		</form:form>
	</div>
</body>
</html>