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
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="menu.jsp"/>
	<div class="container">
		<br/>
		<h2 class="form-signin-heading">Update User ${username}</h2>
		<br/>
		<form:form modelAttribute="userUpdate">

			<spring:bind path="id">
					<form:input type="hidden" path="id" class="form-control" value="${user.id}"></form:input>
					<form:errors path="id"></form:errors>
			</spring:bind>
			
			<div class="form-group row ${status.error ? 'has-error' : ''}">
				<spring:bind path="username" >
						<label class="col-sm-2 col-form-label">User Name:</label>
						<div class="col-sm-4">
							<form:input type="text" path="username" class="form-control" placeholder="User name" value="${user.username}"></form:input>
							<form:errors path="username"></form:errors>	
						</div>
				</spring:bind>
			</div>

			<button class="btn btn-primary" type="submit" id="search">Submit</button>
		</form:form>
	</div>
</body>
</html>