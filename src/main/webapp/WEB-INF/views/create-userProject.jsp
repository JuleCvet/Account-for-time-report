<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.hellokoding.account.model.ProjectTypeEnum"%>

<!doctype html>
<html lang="en">
<head>

<title>Create a User - Project</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet" />
</head>

<body>
<jsp:include page="menu.jsp"/>
<div class="container">
		<br/>
		<form:form method="POST" modelAttribute="createUserProject" class="form-signin">
		<p>Today's date:<%= (new java.util.Date()).toLocaleString()%></p>
		<div class="form-group"></div>
		
			<h2>Select User</h2>
			<spring:bind path="userID">
				<form:select class="form-control" style="padding-bottom:5px; padding-top:5px;" path="userID">
					<c:forEach var="user" items="${listUsers}">
						<option value="${user.id}">${user.username}</option>
					</c:forEach>
				</form:select>
			</spring:bind>
			
			<h2>Select Project</h2>
			<spring:bind path="projectID">
				<form:select class="form-control" style="padding-bottom:5px; padding-top:5px;" path="projectID">
					<c:forEach var="project" items="${listProjects}">
						<option value="${project.id}">${project.projectName}</option>
					</c:forEach>
				</form:select>
			</spring:bind>	
			
			<spring:bind path="deleted">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" path="deleted" class="form-control" value="0"></form:input>
					<form:errors path="deleted"></form:errors>
				</div>
			</spring:bind>		
			
			<button class="btn btn-lg btn-primary btn-block" type="submit" style="background-color:#337ab7;" >Submit</button>
		</form:form>
	</div>
</body>
</html>