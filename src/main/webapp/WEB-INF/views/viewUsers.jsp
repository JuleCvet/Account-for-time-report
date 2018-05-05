<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
<jsp:directive.page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="false"/>
<jsp:output doctype-root-element="html" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" omit-xml-declaration="true"/>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:c="http://java.sun.com/jsp/jstl/core"
		xmlns:security="http://www.springframework.org/security/tags">

<head>
<title>Users</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet"/>
</head>

<body>
	<jsp:include page="menu.jsp"/>
	<div class="container">
	 <br/>
	 <h1>All Users</h1>
		<table class="table table-striped table-bordered">
			<tr>
				<th>User Id</th>
				<th>User Name</th>
				<th>Is deleted</th>
				
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<th>Delete User</th>
				</security:authorize>
				
				<security:authorize access="hasRole('ROLE_ADMIN')">
					<th>Update User</th>
				</security:authorize>
			</tr>	

			<c:forEach var="user" items="${list}">
				<tr>
				<c:choose>
						<c:when test="${user.deleted=='1'}">
							<td>${user.id}</td>
							<td>${user.username}</td>
							
							<td><c:choose>
						    <c:when test="${user.deleted=='1'}">TRUE<br /></c:when>    
						    <c:otherwise>FALSE<br /></c:otherwise>
							</c:choose></td>
					
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<td></td>
							</security:authorize>
				
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<td></td>
							</security:authorize>	
						</c:when>
						
						<c:otherwise>
							<td>${user.id}</td>
							<td>${user.username}</td>
							
							<td><c:choose>
						    <c:when test="${user.deleted=='0'}">FALSE<br/></c:when>    
						    <c:otherwise>TRUE<br /></c:otherwise>
							</c:choose></td>
							
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<td><a href="delete-user/${user.id}" style="color:#337ab7;" >Delete User</a></td>
						</security:authorize>
							
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<td><a href="update-user/${user.id}" style="color:#337ab7;" >Update User</a></td>
						</security:authorize>	
					</c:otherwise>
					
				</c:choose>
				</tr>
			</c:forEach>
		</table>
		<br/>
	</div>
</body>
</html>
</jsp:root>