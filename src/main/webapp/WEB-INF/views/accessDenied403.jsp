<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Welcome</title>
<jsp:include page="cssandjs.jsp"/>

</head>
<body>
<img id="img"  src="${pageContext.request.contextPath}/resources/img/logo.png">
<c:if test="${pageContext.request.userPrincipal.name != null}">
   <form id="logoutForm" method="POST" action="${pageContext.request.contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   </form>

   <h2>Welcome ${pageContext.request.userPrincipal.name} |
   	 <a onclick="document.forms['logoutForm'].submit()" href="#">Logout</a></h2>
</c:if>
<h1>HTTP Status 403 - Access is denied</h1>
<h2>${msg}</h2>
</body>
</html>