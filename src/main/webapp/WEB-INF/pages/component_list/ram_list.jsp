<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RAM</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_menu.jsp"/>
	<div class="container">
		<h3>RAM List</h3>
	    <table class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Image</td>
	   			<td>Manufacturer</td>
	   			<td>Model</td>
	   			<td>Size</td>
	   			<td>Module</td>
	   			<td>Type</td>
	   			<td>Speed</td>
				<td>Price</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${ramList}" var="ram">
	   		<tr>
	   			<td>${ram.id}</td>
	   			<td>
					<img src="${ram.imagePath}" title="${ram.name}" height="75" width="75">
				</td>
	   			<td><strong>${ram.manufacturer}</strong></td>
				<td><strong>${ram.model}</strong></td>
	   			<td>${ram.size}GB</td>
	   			<td>${ram.module}</td>
	   			<td>${ram.type}</td>
	   			<td>${ram.speed}</td>
	   			<td><strong>$${ram.price}</strong></td>
	   			<td>
				    <form action="${contextPath}/ram/${ram.id}" method="POST">
						<button class = "btn btn-primary btn-sm" type="submit">Add</button>
					</form>
				</td>
	   		</tr>
	   		</c:forEach>
	   </table>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>