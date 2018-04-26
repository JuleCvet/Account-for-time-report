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