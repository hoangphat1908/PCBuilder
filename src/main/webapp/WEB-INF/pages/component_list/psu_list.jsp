<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PSU</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_menu.jsp"/>
	<div class="container">
		<h3>PSU List</h3>
	    <table border="1" width="70%" class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Manufacturer</td>
	   			<td>Model</td>
	   			<td>Series</td>
	   			<td>Form factor</td>
	   			<td>Watts</td>
	   			<td>Efficiency</td>
	   			<td>Modular</td>
				<td>Price</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${psuList}" var="psu">
	   		<tr>
	   			<td>${psu.id}</td>
	   			<td>${psu.manufacturer}</td>
	   			<td>${psu.model}</td>
	   			<td>${psu.series}</td>
	   			<td>${psu.formFactor}</td>
	   			<td>${psu.watts}</td>
	   			<td>${psu.efficiency}</td>
	   			<td>${psu.modular}</td>
	   			<td>$${psu.price}</td>
	   		</tr>
	   		</c:forEach>
	   </table>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>