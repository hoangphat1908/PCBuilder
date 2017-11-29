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
		<h3>User List</h3>
	    <table class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>Username</td>
	   			<td>Email</td>
	   			<td>Password</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${userList}" var="user">
	   		<tr>
	   			<td>${user.username}</td>
	   			<td>${user.email}</td>
	   			<td>${user.password}</td>
	   		</tr>
	   		</c:forEach>
	   </table>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
