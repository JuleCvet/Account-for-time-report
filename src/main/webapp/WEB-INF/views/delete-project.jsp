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

<title>Delete a Project</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="menu.jsp"/>
		<div class="container">
		<br/>
		<div class="alert alert-danger" role="alert" style = "width: 49%">
		<h4 class="alert-heading">Are you sure that you want to delete Info about this project?</h4>
		</div>
		
		<h2 class="form-signin-heading">Delete info for this project: ${project.id}</h2>
		<br/>
		<form:form modelAttribute="delete">
			
			<spring:bind path="id">
				<form:input type="hidden" path="id" class="form-control" value="${project.id}"></form:input>
				<form:errors path="id"></form:errors>
			</spring:bind>
			
			<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="projectName" >
				<label class="col-sm-2 col-form-label">Project name:</label>
					<div class="col-sm-4">
						<form:input type="text" path="projectName" class="form-control" value="${project.projectName}" disabled="true"></form:input>
						<form:errors path="projectName" ></form:errors>
					</div>
			</spring:bind>
			</div>
		
			<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="description" >
				<label class="col-sm-2 col-form-label">Description:</label>
					<div class="col-sm-4">
						<form:input type="text" path="description" class="form-control" value="${project.description}" disabled="true"></form:input>
						<form:errors path="description"></form:errors>
					</div>
			</spring:bind>
			</div>
			
			<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="type" >
				<label class="col-sm-2 col-form-label">Project type:</label>
					<div class="col-sm-4">
						<form:input type="text" path="type" class="form-control" value="${project.type}" disabled="true"></form:input>
						<form:errors path="type"></form:errors>
					</div>
			</spring:bind>
			</div>
			
			<button class="btn btn-primary" type="submit" id="search">Delete</button>
		</form:form>
	</div>
</body>
</html>