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

<title>Update your report</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
	type="text/javascript"></script>

<script type="text/javascript">
var dates = ['01/01/2018', '01/06/2018', '03/30/2018','04/01/2018', '04/02/2018', '05/01/2018', '05/10/2018', '05/20/2018', 
	 '06/06/2018', '06/22/2018','06/23/2018', '11/03/2018', '12/24/2018',  '12/25/2018',  '12/26/2018',  '12/31/2018'];
 
	$(function() {
		$("#forDate").datepicker({ firstDay: 1 , beforeShowDay: highlightDays});
	});

	function highlightDays(date) {
	    for (var i = 0; i < dates.length; i++) {
	        if (new Date(dates[i]).toString() == date.toString()) {
	            return [true, 'highlight'];
	        }
	    }
	    return [true, ''];
	} 	
</script>

</head>

<body>
<img id="img" src="${contextPath}/resources/img/logo.png">
	<div class="container">

		<form:form modelAttribute="update" class="form-horizontal">
		
			<spring:bind path="userID">
					<form:input type="hidden" path="userID" class="form-control"
						value="${report.userID}"></form:input>	
					<form:errors path="userID"></form:errors>
			</spring:bind>
			
		
			<h2 class="form-signin-heading">Update your report ${report.idReport}</h2>

			<spring:bind path="idReport">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="hidden" value="${report.idReport}"
						path="idReport" class="form-control"></form:input>
					<form:errors path="idReport"></form:errors>
					</div>
			</spring:bind>
			
		<div class="form-group">
			<spring:bind path="companyName" >
				<div class="form-group ${status.error ? 'has-error' : ''}"></div>
					<label class="control-label col-sm-2">Company Name:</label>
					<div class="col-sm-2">
						<form:input type="text" path="companyName" class="form-control" 
							 value="${report.companyName}" ></form:input>
						<form:errors path="companyName"></form:errors>
					</div>
			</spring:bind>
		</div>
	
		<div class="form-group">	
			<spring:bind path="hoursReported">
				<div class="form-group ${status.error ? 'has-error' : ''}"></div>
					<label class="control-label col-sm-2">Hours Reported:</label>
						<div class="col-sm-2">
							<form:input type="text" path="hoursReported" class="form-control"
								value="${report.hoursReported}"></form:input>
							<form:errors path="hoursReported"></form:errors>
						</div>
			</spring:bind>
		</div>
		
		<div class="form-group">	
			<spring:bind path="vab">
				<div class="form-group ${status.error ? 'has-error' : ''}"></div>
					<label class="control-label col-sm-2">VAB:</label>
						<div class="col-sm-2">
						<form:input type="text" path="vab" class="form-control" value="${report.vab}"></form:input>
						<form:errors path="vab"></form:errors>
						</div>
			</spring:bind>
		</div>
		
		<div class="form-group">
			<spring:bind path="vacation">
				<div class="form-group ${status.error ? 'has-error' : ''}"></div>
				<label class="control-label col-sm-2">Hours for Vacation</label>
					<div class="col-sm-2">
						<form:input type="text" path="vacation" class="form-control" value="${report.vacation}"></form:input>
						<form:errors path="vacation"></form:errors>
					</div>
			</spring:bind>
		</div>
		
		<div class="form-group">
			<spring:bind path="forDate">
				<div class="form-group ${status.error ? 'has-error' : ''}"></div>
				<label class="control-label col-sm-2">For Date:</label>
					<div class="col-sm-2">
						<form:input type="text" id="forDate" name="forDate" path="forDate"
							class="form-control" value="${forDate}"></form:input>
						<form:errors path="forDate"></form:errors>
					</div>
			</spring:bind>
		</div>
		
		<div class="form-group">
			<spring:bind path="deleted">
				<div class="form-group ${status.error ? 'has-error' : ''}"></div>
				<label class="control-label col-sm-2">Deleted:</label>
					<div class="col-sm-2">
						<form:input type="text" id="deleted" name="deleted" path="deleted"
							class="form-control" value="${deleted}"></form:input>
						<form:errors path="deleted"></form:errors>
					</div>
			</spring:bind>
		</div>
		
			<button class="btn btn-primary" type="submit" id="search">Submit</button>
		</form:form>
	</div>
	<script src="${contextPath}/resources/js/bootstrap.min.js"
		type="text/javascript"></script>
</body>
</html>
