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

<title>Update your project</title>

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

		<form:form method="POST" modelAttribute="project" class="form-signin">
			<h2 class="form-signin-heading">Update the project with id:
				${project.id}</h2>

			<spring:bind path="id">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" path="id" class="form-control"
						value="${project.id}"></form:input>
					<form:errors path="id"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="projectName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="projectName" class="form-control"
						placeholder="Project name:" value="${project.projectName}"></form:input>
					<form:errors path="projectName"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="description">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="description" class="form-control"
						placeholder="Project description:" value="${project.description}"></form:input>
					<form:errors path="description"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="type">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="type" class="form-control"
						placeholder="Project type:" value="${project.type}"></form:input>
					<form:errors path="type"></form:errors>
				</div>
			</spring:bind>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>

	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"
		type="text/javascript"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
</body>
</html>
