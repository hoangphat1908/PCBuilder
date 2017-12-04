<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PCBuilder</title>
	<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="_menu.jsp"/>
	<div class="container">
		<div class="jumbotron">
			<h1>Welcome to PCBuilder</h1>
			<p>Need help on building your next PC? Try our PC Build feature or join our community of PC enthusiasts</p>
			<c:if test="${pageContext.request.userPrincipal.name == null}">
				<p><a class="btn btn-primary btn-lg" href="${contextPath}/register" role="button">Sign up now!</a></p>
			</c:if>
		</div>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
