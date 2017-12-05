<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Case</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_menu.jsp"/>
	<div class="container">
		<h3>Case List</h3>
	    <table class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Image</td>
	   			<td>Manufacturer</td>
	   			<td>Model</td>
	   			<td>Type</td>
	   			<td>PSU Included</td>
	   			<td>Price</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${caseList}" var="computerCase">
	   		<tr>
	   			<td>${computerCase.id}</td>
	   			<td>
					<img src="${computerCase.imagePath}" title="${computerCase.name}" height="75" width="75">
				</td>
	   			<td><strong>${computerCase.manufacturer}</strong></td>
				<td><strong>${computerCase.model}</strong></td>
	   			<td>${computerCase.type}</td>
	   			<td>${computerCase.psuIncluded}</td>
	   			<td><strong>$${computerCase.price}</strong></td>
	   			<td>
				    <form action="${contextPath}/case/${computerCase.id}" method="POST">
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