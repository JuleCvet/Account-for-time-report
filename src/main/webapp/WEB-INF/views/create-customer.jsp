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

<title>Create a customer</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet" />
</head>

<body>
<jsp:include page="menu.jsp"/>
	<div class="container">
`		<br/>
		<form:form method="POST" modelAttribute="customerForm"
			class="form-signin">
			<h2 class="form-signin-heading">Create customer</h2>
			<p>Today's date:<%= (new java.util.Date()).toLocaleString()%></p>
        
			<spring:bind path="customerName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="customerName" class="form-control"
						placeholder="Customer name" autofocus="true"></form:input>
					<form:errors path="customerName"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="deleted">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" path="deleted" class="form-control"
						value="0"></form:input>
					<form:errors path="deleted"></form:errors>
				</div>
			</spring:bind>

			<button class="btn btn-lg btn-primary btn-block" type="submit" style="background-color:#337ab7;" >Submit</button>
		</form:form>
	</div>
</body>
</html>