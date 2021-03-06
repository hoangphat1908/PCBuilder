<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Storage</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_menu.jsp"/>
	<div class="container">
		<h3>Storage List</h3>
	    <table class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Image</td>
	   			<td>Manufacturer</td>
	   			<td>Model</td>
	   			<td>Type</td>
	   			<td>Form</td>
	   			<td>Series</td>
	   			<td>Capacity</td>
				<td>Cache</td>
				<td>Price</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${storageList}" var="storage">
	   		<tr>
	   			<td>${storage.id}</td>
	   			<td>
					<img src="${storage.imagePath}" title="${storage.name}" height="75" width="75">
				</td>
	   			<td><strong>${storage.manufacturer}</strong></td>
				<td><strong>${storage.model}</strong></td>
	   			<td>${storage.type}</td>
	   			<td>${storage.form}</td>
	   			<td>${storage.series}</td>
	   			<td>${storage.capacity}</td>
	   			<td>${storage.cache}</td>
	   			<td><strong>$${storage.price}</strong></td>
	   			<td>
				    <form action="${contextPath}/storage/${storage.id}" method="POST">
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