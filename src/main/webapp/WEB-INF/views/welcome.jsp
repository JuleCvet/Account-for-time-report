<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Welcome</title>
<jsp:include page="cssandjs.jsp"/>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet"/>
</head>

<body>
<jsp:include page="menu.jsp"/>
<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name != null}">
	<br/>
        <h2>Welcome ${pageContext.request.userPrincipal.name}</h2>
    </c:if>
 Language :
<a href="?language=en">English</a>|
<a href="?language=mk">Macedonian</a>

<h3>
	welcome.springmvc : <spring:message code="welcome.springmvc" text="default text" />
</h3>
Current Locale : ${pageContext.response.locale}
</div>
</body>
</html>