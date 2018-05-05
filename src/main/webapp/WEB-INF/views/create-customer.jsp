<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
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