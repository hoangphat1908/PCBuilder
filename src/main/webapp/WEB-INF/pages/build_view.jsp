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
	<c:if test="${build != null}">
	    <table border="1" width="70%" class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>Username</td>
	   			<td>name</td>
	   			<td>CPU</td>
	   			<td>Motherboard</td>
	   			<td>GPU</td>
	   			<td>PSU</td>
	   			<td>Cooler</td>
				<td>Case</td>
	   		</tr>
	   		</thead>
	   		<tr>
	   			<td>${build.username}</td>
	   			<td>${build.name}</td>
	   			<td>${build.cpu.model}</td>
	   			<td>${build.motherboard.model}</td>
	   			<td>${build.gpu.model}</td>
	   			<td>${build.psu.model}</td>
	   			<td>${build.cooler.model}</td>
	   			<td>${build.computerCase.model}</td>
	   		</tr>
	   </table>
	</c:if>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
