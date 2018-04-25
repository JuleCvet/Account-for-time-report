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

<title>Delete a User Project</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

</head>

<body>
<img id="img" src="${contextPath}/resources/img/logo.png"></img>
	<div class="container">

		<div class="alert alert-danger" role="alert" style="width: 67%">
			<h4 class="alert-heading">Are you sure that you want to delete
				Info about combination between: ${user.username} and ${project.projectName}?</h4>
		</div>

		<form:form method="POST" modelAttribute="deleteUserProject" class="form-horizontal">

			<spring:bind path="id">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" path="id" class="form-control"></form:input>
					<form:errors path="id"></form:errors>
				</div>
			</spring:bind>
			
			<spring:bind path="userID">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<div class="col-sm-2">
						<form:input type="hidden" path="userID" class="form-control"
							value="${userproject.userID}" disabled="true" ></form:input>
						<form:errors path="userID"></form:errors>
					</div>
				</div>
			</spring:bind>		
					
			<spring:bind path="projectID">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<div class="col-sm-2">
						<form:input type="hidden" path="projectID" class="form-control"
							value="${userproject.projectID}"  disabled="true" ></form:input>
						<form:errors path="projectID" ></form:errors>
					</div>
				</div>
			</spring:bind>

			<button class="btn btn-primary" type="submit" id="search" >Delete</button>
		</form:form>		
	</div>			
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
		type="text/javascript"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
</body>
</html>
