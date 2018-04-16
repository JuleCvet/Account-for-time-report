<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<style>
.grid-container {
  display: grid;
  height: 500px;
  align-content: space-evenly;
  grid-template-columns: auto auto auto;
  grid-gap: 10px;
  background-color: #79b4ef8f;
  padding: 10px;
}
.grid-container > div {
  background-color: rgba(255, 255, 255, 0.8);
  text-align: center;
  padding: 20px 0;
  font-size: 30px;
}
</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">

</head>

<body>
	  <img src="${contextPath}/resources/img/logo.png"></img> 
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
    </c:if>
   
	   <div class="grid-container">
	    	<c:choose>
				<c:when test="${showadmin == true}">
				  <div><a href="/report/allMyReports">All my Reports</a></div>
				  <div><a href="/project/viewProjects">Show Projects</a></div>
				  <div><a href="/customer/viewCustomers">Show Customers</a></div> 
				  <div><a href="/report/create-report">Add New Report</a></div>
				  <div><a href="/report/viewReports">View all Reports</a></div>
				  <div><a href="/userproject/viewAllUserProjects">Admin</a></div>
				</c:when>
		
				<c:otherwise>
						  <div><a href="/report/allMyReports">All my Reports</a></div> 
						  <div><a href="/project/viewProjects">Show Projects</a></div> 
						  <div><a href="/customer/viewCustomers">Show Customers</a></div> 
						  <div><a href="/report/create-report">Add New Report</a></div> 
						  <div><a href="/report/viewReports">View all Reports</a></div> 
						  <div><a href="/userproject/viewAllUserProjects">Admin</a></div>
				</c:otherwise>	
			</c:choose>	
		</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>