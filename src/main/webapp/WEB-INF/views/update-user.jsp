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

<title>Update User</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="menu.jsp"/>
	<div class="container">
		<br/>
		<form:form method="POST" modelAttribute="userUpdate" class="form-horizontal">
			<h2 class="form-signin-heading">Update User ${username}</h2>

			<spring:bind path="id">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" path="id" class="form-control"
						value="${user.id}"></form:input>
					<form:errors path="id"></form:errors>
				</div>
			</spring:bind>
	
			<spring:bind path="username">
				<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="control-label col-sm-2">User name:</label>
				<div class="col-sm-2">
					<form:input type="text" path="username" class="form-control"
						placeholder="User name" value="${user.username}"></form:input>
					<form:errors path="username"></form:errors>
				</div>
				</div>
			</spring:bind>

			<button class="btn btn-primary" type="submit" id="search">Submit</button>
		</form:form>
	</div>
</body>
</html>