<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="com.hellokoding.account.model.ProjectTypeEnum"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Create a project</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet"/>
</head>

<body>
<jsp:include page="menu.jsp"/>
<div class="container">
	<br/>
	
    <form:form method="POST" modelAttribute="projectForm" class="form-signin">
        <h2 class="form-signin-heading">Create your project</h2>
        
        <spring:bind path="projectName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="projectName" class="form-control" placeholder="Project Name"
                            autofocus="true"></form:input>
                <form:errors path="projectName"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="deleted">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="hidden" path="deleted" class="form-control" value="0"></form:input>
                <form:errors path="deleted"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="customerID">
				<form:select class="form-control" style="padding-bottom:5px; padding-top:5px;" path="customerID">
					<c:forEach var="customer" items="${customers}">
						<option value="${customer.customerId}">${customer.customerName}</option>
					</c:forEach>
				</form:select>
			</spring:bind>

		<spring:bind path="description">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<form:input type="text" path="description" class="form-control" placeholder="Description"></form:input>
				<form:errors path="description"></form:errors>
			</div>
		</spring:bind>
			
		<div class="form-group ${status.error ? 'has-error' : ''}">
			<form:select path="type" name="type" class="form-control" style="padding-bottom:5px; padding-top:5px;">
				<c:forEach items="<%=ProjectTypeEnum.values()%>" var="typeType">
					<option>${typeType}</option>
				</c:forEach>
			</form:select>
		</div>

        <button class="btn btn-lg btn-primary btn-block" style="background-color:#337ab7;" >Submit</button>
    </form:form>
</div>
</body>
</html>