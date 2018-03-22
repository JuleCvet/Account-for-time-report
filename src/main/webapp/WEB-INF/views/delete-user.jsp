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

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>

<body>

	<div class="container">

		<div class="alert alert-danger" role="alert">
			<h4 class="alert-heading">Are you sure that you want to delete
				Info about this user?</h4>
		</div>

		<form:form method="POST" modelAttribute="userDelete"
			class="form-signin">
			<h2 class="form-signin-heading">Delete info about your user</h2>
			<spring:bind path="id">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="id" class="form-control"
						placeholder="ID of user you want to delete info:" autofocus="true"></form:input>
					<form:errors path="id"></form:errors>
				</div>
			</spring:bind>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>

	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>