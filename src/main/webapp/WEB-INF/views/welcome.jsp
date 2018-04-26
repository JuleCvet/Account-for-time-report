<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
.navbar.navbar-expand-lg.navbar-light li a {
    color: #337ab7;
    font-weight: bold;
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Welcome</title>

</head>

<body>
<div id="primary-nav">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="#">
	  	<img style="width: 100px;" src="${contextPath}/resources/img/logo.png">
 	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav w-100 justify-content-center">
	      <li class="nav-item">
	        <a class="nav-link" href="/report/allMyReports">All my Reports</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/project/viewProjects">Show Projects</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/customer/viewCustomers">Show Customers</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/report/create-report">Add New Report</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/report/viewReports">View All Reports</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/userproject/viewAllUserProjects">Admin</a>
	      </li>
	    </ul>
	    <c:if test="${pageContext.request.userPrincipal.name != null}">
     	<form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        	<ul class="nav navbar-nav ml-auto w-100 justify-content-end">
	            <li class="nav-item">
	                <a class="nav-link" onclick="document.forms['logoutForm'].submit()" href="#">Logout</a>
	            </li>
        	</ul>
    	</c:if>
	  </div>
	</nav>
</div>
<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>Welcome ${pageContext.request.userPrincipal.name}</h2>
    </c:if>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script></body>
</html>