<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CPU</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="_menu.jsp"/>
	<div class="container">
		<h3>CPU List</h3>
	    <table border="1" width="70%" class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Name</td>
	   			<td>Manufacturer</td>
	   			<td>Cores</td>
	   			<td>Clock Speed</td>
	   			<td>TDP</td>
				<td>Price</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${userList}" var="user">
	   		<tr>
	   			<td>${user.id}</td>
	   			<td>${user.name}</td>
	   			<td>${user.manufacturer}</td>
	   			<td>${user.cores}</td>
	   			<td>${user.clockSpeed}GHz</td>
	   			<td>${user.TDP}W</td>
	   			<td>${user.price}$</td>
	   		</tr>
	   		</c:forEach>
	   </table>
   </div>
<script src="webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>