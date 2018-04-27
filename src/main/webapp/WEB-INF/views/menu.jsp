<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<div id="primary-nav">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="/welcome">
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
	        <a class="nav-link" href="/report/create-report">Add New Report</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/project/viewProjects">Show all Projects</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/customer/viewCustomers">Show all Customers</a>
	      </li>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          Admin
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
			          <a class="dropdown-item" href="/customer/create-customer">Create customer</a>
			          <a class="dropdown-item" href="/project/create-project">Create project</a>
			          <a class="dropdown-item" href="/userproject/create-userProject">Connect User-Project</a>
			          <a class="dropdown-item" href="/report/viewReports">View All Reports</a>
			          <a class="dropdown-item" href="/userproject/viewAllUserProjects">View UserProjects</a>
			        </div>
		      	</li>
			</security:authorize>
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