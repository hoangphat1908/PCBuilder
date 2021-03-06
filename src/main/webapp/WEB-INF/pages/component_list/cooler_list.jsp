<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CPU Cooler</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_menu.jsp"/>
	<div class="container">
		<h3>CPU Cooler List</h3>
	    <table class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Image</td>
	   			<td>Manufacturer</td>
	   			<td>Model</td>
	   			<td>RPM</td>
	   			<td>Noise</td>
	   			<td>Price</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${coolerList}" var="cooler">
	   		<tr>
	   			<td>${cooler.id}</td>
	   			<td>
					<img src="${cooler.imagePath}" title="${cooler.name}" height="75" width="75">
				</td>
	   			<td><strong>${cooler.manufacturer}</strong></td>
				<td><strong>${cooler.model}</strong></td>
	   			<td>${cooler.noise}</td>
	   			<td>${cooler.rpm}</td>
	   			<td><strong>$${cooler.price}</strong></td>
	   			<td>
				    <form action="${contextPath}/cooler/${cooler.id}" method="POST">
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