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

<title>Update your User/Project combination</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>

<body>

	<div class="container">
	
		<form:form method="POST" modelAttribute="updateUserProject" class="form-horizontal">
			<h2 class="form-signin-heading">Update your User/Project combination: ${userID}</h2>

			<spring:bind path="id">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" path="id" class="form-control"
						value="${userproject.id}"></form:input>
					<form:errors path="id"></form:errors>
				</div>
			</spring:bind>
			
			
			<div class="form-group">
				<spring:bind path="userID">
					<div class="form-group ${status.error ? 'has-error' : ''}"></div>
						<label class="control-label col-sm-2">User ID:</label>
						<div class="col-sm-2">
							<form:input type="text" path="userID" class="form-control" value="${userproject.userID}"></form:input>
						<form:errors path="userID"></form:errors>
					</div>
				</spring:bind>
			</div>
		
			<div class="form-group">
				<spring:bind path="projectID">
					<div class="form-group ${status.error ? 'has-error' : ''}"></div>
						<label class="control-label col-sm-2">Project ID:</label>
						<div class="col-sm-2">
							<form:input type="text" path="projectID" class="form-control" value="${userproject.projectID}"></form:input>
						<form:errors path="projectID"></form:errors>
					</div>
				</spring:bind>
			</div>

			<div class="form-group">
				<spring:bind path="deleted">
					<div class="form-group ${status.error ? 'has-error' : ''}"></div>
						<label class="control-label col-sm-2">Deleted:</label>
						<div class="col-sm-2">
							<form:input type="text" path="deleted" class="form-control" value="${userproject.deleted}"></form:input>
						<form:errors path="deleted"></form:errors>
					</div>
				</spring:bind>
			</div>

			<button class="btn btn-primary" type="submit" id="search">Submit</button>

	</form:form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
		type="text/javascript"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
</body>
</html>