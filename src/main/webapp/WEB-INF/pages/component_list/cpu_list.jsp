<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CPU</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../_menu.jsp"/>
	<div class="container">
		<h3>CPU List</h3>
		<table class="table">
			<thead>
				<tr>
					<td>ID</td>
					<td>Manufacturer</td>
					<td>Model</td>
					<td>Cores</td>
					<td>Clock Speed</td>
					<td>TDP</td>
					<td>Price</td>
				</tr>
			</thead>
			<c:forEach items="${cpuList}" var="cpu">
				<tr>
					<td>${cpu.id}</td>
					<td>${cpu.manufacturer}</td>
					<td>${cpu.model}</td>
					<td>${cpu.cores}</td>
					<td>${cpu.clockSpeed}GHz</td>
					<td>${cpu.TDP}W</td>
					<td>$${cpu.price}</td>
					<td>
					    <form action="${contextPath}/cpu/${cpu.id}" method="POST">
							<button type="submit">Add</button>
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