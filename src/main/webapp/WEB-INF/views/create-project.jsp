
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="com.hellokoding.account.model.ProjectTypeEnum"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create a project</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" type="text/css" rel="stylesheet">

</head>

<body>
<img id="img" src="${contextPath}/resources/img/logo.png"></img>
<div class="container">

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

			<spring:bind path="description">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="description" class="form-control" placeholder="Description"></form:input>
					<form:errors path="description"></form:errors>
				</div>
			</spring:bind>
			
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<form:select path="type" name="type" class="form-control">
					<c:forEach items="<%=ProjectTypeEnum.values()%>" var="typeType">
						<option>${typeType}</option>
					</c:forEach>
				</form:select>
			</div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>

</div>
<script src="${contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>