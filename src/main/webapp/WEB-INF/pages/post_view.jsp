<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Build View</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="_menu.jsp"/>
	<div class="container">
	<c:if test="${post != null}">
	    <table border="1" width="70%" class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Username</td>
	   			<td>Title</td>
	   			<td>Body</td>
	   		</tr>
	   		</thead>
	   		<tr>
	   			<td>${post.id}</td>
	   			<td>${post.user.username}</td>
	   			<td>${post.title}</td>
	   			<td>${post.body}</td>
	   		</tr>
	   </table>
	</c:if>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
