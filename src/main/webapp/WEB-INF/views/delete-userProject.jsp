<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
<title>Delete a User Project</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
<jsp:include page="menu.jsp"/>
	<div class="container">
	<br/>
	<div class="alert alert-danger" role="alert" style="width: 67%">
	<h4 class="alert-heading">Are you sure that you want to delete Info about combination between: ${user.username} and ${project.projectName}?</h4>
	</div>

	<form:form modelAttribute="deleteUserProject">

			<spring:bind path="id">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" path="id" class="form-control"></form:input>
					<form:errors path="id"></form:errors>
				</div>
			</spring:bind>
			
			<spring:bind path="userID">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<div class="col-sm-2">
						<form:input type="hidden" path="userID" class="form-control" value="${userproject.userID}" disabled="true" ></form:input>
						<form:errors path="userID"></form:errors>
					</div>
				</div>
			</spring:bind>		
					
			<spring:bind path="projectID">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<div class="col-sm-2">
						<form:input type="hidden" path="projectID" class="form-control" value="${userproject.projectID}"  disabled="true" ></form:input>
						<form:errors path="projectID" ></form:errors>
					</div>
				</div>
			</spring:bind>

			<button class="btn btn-primary" type="submit" id="search" >Delete</button>
		</form:form>		
	</div>			
</body>
</html>
