<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GPU</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_menu.jsp"/>
	<div class="container">
		<h3>GPU List</h3>
	    <table border="1" width="70%" class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Manufacturer</td>
	   			<td>Model</td>
	   			<td>Series</td>
	   			<td>Chipset</td>
	   			<td>Memory</td>
	   			<td>Core clock</td>
				<td>Price</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${gpuList}" var="gpu">
	   		<tr>
	   			<td>${gpu.id}</td>
	   			<td>${gpu.manufacturer}</td>
	   			<td>${gpu.model}</td>
	   			<td>${gpu.series}</td>
	   			<td>${gpu.chipset}</td>
	   			<td>${gpu.memory}GB</td>
	   			<td>${gpu.coreClock}GHz</td>
	   			<td>$${gpu.price}</td>
	   		</tr>
	   		</c:forEach>
	   </table>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>