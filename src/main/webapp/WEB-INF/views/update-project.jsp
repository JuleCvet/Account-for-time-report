<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.hellokoding.account.model.ProjectTypeEnum"%>

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
<jsp:include page="cssandjs.jsp"/>
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="menu.jsp"/>
	<div class="container">
			<br/>
	<h2 class="form-signin-heading">Update Project ${companyName}</h2>
		<form:form modelAttribute="project">
		
		<spring:bind path="id">
			<form:input type="hidden" path="id" class="form-control" value="${project.id}"></form:input>
			<form:errors path="id"></form:errors>
		</spring:bind>
		
		<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="projectName" >
					<label class="col-sm-2 col-form-label">Project Name:</label>
					<div class="col-sm-4">
							<form:input type="text" path="projectName" class="form-control" placeholder="Project name" value="${project.projectName}"></form:input>
						<form:errors path="projectName"></form:errors>
					</div>
			</spring:bind>
		</div>
		
		<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="description" >
					<label class="col-sm-2 col-form-label">Description:</label>
					<div class="col-sm-4">
						<form:input type="text" path="description" class="form-control" placeholder="Project description" value="${project.description}"></form:input>
						<form:errors path="description"></form:errors>
					</div>
			</spring:bind>
		</div>
		
		<div class="form-group row ${status.error ? 'has-error' : ''}">
			<spring:bind path="type">
					<label class="col-sm-2 col-form-label">Type of project:</label>
					<div class="col-sm-4">
						<form:select path="type" name="type" class="form-control">
							<c:forEach items="<%=ProjectTypeEnum.values()%>" var="typeType">
								<option>${typeType}</option>
							</c:forEach>
						</form:select>
					</div>
			</spring:bind>
		</div>
		
			<button class="btn btn-primary" type="submit" id="search" >Submit</button>
		</form:form>
	</div>
</body>
</html>