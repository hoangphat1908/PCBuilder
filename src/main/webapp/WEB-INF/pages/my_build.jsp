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
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<!-- 
		    <table border="1" width="70%" class="table table-striped">
		    	<thead>
		   		<tr>
		   			<td>ID</td>
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
		   			<td>${build.id}</td>
		   			<td>${build.user.username}</td>
		   			<td>${build.name}</td>
		   			<td>${build.cpu.model}</td>
		   			<td>${build.motherboard.model}</td>
		   			<td>${build.gpu.model}</td>
		   			<td>${build.psu.model}</td>
		   			<td>${build.cooler.model}</td>
		   			<td>${build.computerCase.model}</td>
		   		</tr>
		   </table>
		   -->
		   
			<div class="panel panel-default">
				<div class="panel-heading">CPU</div>
				
				<table class="table">
					<c:choose>
						<c:when test="${build.cpu != null}">	
							<tr>
								<td width="60%" >${build.cpu.name}</td>
								<td width="30%">$${build.cpu.price}</td>
								<td width="10%" align="right">
									<a href = "${contextPath}/mybuild/remove/cpu">
		  								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</a>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td align="center">
									<a class="btn btn-primary" href="${contextPath}/cpu">Choose a CPU</a>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">Motherboard</div>
				
				<table class="table">
					<c:choose>
						<c:when test="${build.motherboard != null}">	
							<tr>
								<td width="60%" >${build.motherboard.name}</td>
								<td width="30%">$${build.motherboard.price}</td>
								<td width="10%" align="right">
									<a href = "${contextPath}/mybuild/remove/motherboard">
		  								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</a>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td align="center">
									<a class="btn btn-primary" href="${contextPath}/motherboard">Choose a motherboard</a>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</c:if>
	</div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
