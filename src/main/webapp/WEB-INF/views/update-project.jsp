<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.hellokoding.account.model.ProjectTypeEnum"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Update your project</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
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
			<spring:bind path="customerID">
			<label class="col-sm-2 col-form-label">Name of customer:</label>
				<div class="col-sm-4">
					<form:select class="form-control" style="padding-bottom:5px; padding-top:5px;" path="customerID">
						<c:forEach var="customer" items="${customers}">
							<option value="${customer.customerId}">${customer.customerName}</option>
						</c:forEach>
					</form:select>
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