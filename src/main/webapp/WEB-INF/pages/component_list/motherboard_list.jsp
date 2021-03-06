<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Motherboard</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_menu.jsp"/>
	<div class="container">
		<h3>Motherboard List</h3>
	    <table class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Image</td>
	   			<td>Manufacturer</td>
	   			<td>Model</td>
	   			<td>Form factor</td>
	   			<td>Socket</td>
	   			<td>Ram slots</td>
	   			<td>Ram max</td>
				<td>Price</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${motherboardList}" var="motherboard">
	   		<tr>
	   			<td>${motherboard.id}</td>
	   			<td>
					<img src="${motherboard.imagePath}" title="${motherboard.name}" height="75" width="75">
				</td>
	   			<td><strong>${motherboard.manufacturer}</strong></td>
				<td><strong>${motherboard.model}</strong></td>
	   			<td>${motherboard.formFactor}</td>
	   			<td>${motherboard.socket}</td>
	   			<td>${motherboard.ramSlots}</td>
	   			<td>${motherboard.ramMax}GB</td>
	   			<td><strong>$${motherboard.price}</strong></td>
	   			<td>
				    <form action="${contextPath}/motherboard/${motherboard.id}" method="POST">
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