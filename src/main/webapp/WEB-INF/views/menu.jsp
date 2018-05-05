<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<div id="primary-nav">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <a class="navbar-brand" href="${pageContext.request.contextPath}/welcome">
	  	<img style="width: 100px;" src="${pageContext.request.contextPath}/resources/img/logo.png">
 	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav w-75 justify-content-center">
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/report/allMyReports">All my Reports</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/report/create-report">Add New Report</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/project/viewProjects">Show all Projects</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/customer/viewCustomers">Show all Customers</a>
	      </li>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          Admin
			        </a>
			        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
			          <a class="dropdown-item" href="${pageContext.request.contextPath}/customer/create-customer">Create customer</a>
			          <a class="dropdown-item" href="${pageContext.request.contextPath}/project/create-project">Create project</a>
			          <a class="dropdown-item" href="${pageContext.request.contextPath}/userproject/create-userProject">Connect User-Project</a>
			          <a class="dropdown-item" href="${pageContext.request.contextPath}/report/viewReports">View All Reports</a>
			          <a class="dropdown-item" href="${pageContext.request.contextPath}/userproject/viewAllUserProjects">View UserProjects</a>
			           <a class="dropdown-item" href="${pageContext.request.contextPath}/viewUsers">View All Users</a>
			        </div>
		      	</li>
			</security:authorize>
	    </ul>
	    <c:if test="${pageContext.request.userPrincipal.name != null}">
     	<form id="logoutForm" method="POST" action="${pageContext.request.contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        	<ul class="nav navbar-nav ml-auto w-25 justify-content-end">
	            <li class="nav-item">
	                <a class="nav-link" onclick="document.forms['logoutForm'].submit()" href="#">Logout</a>
	            </li>
        	</ul>
    	</c:if>
	  </div>
	</nav>
</div>