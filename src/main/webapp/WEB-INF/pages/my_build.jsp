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
				<div class="panel-heading">My build</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<td>
								<div class="row">
								    <div class="col-md-3 h4"><strong>Component</strong></div>
								    <div class="col-md-9">
								        <div class="row">
								            <div class="col-md-8 h4"><strong>Selection</strong></div>
								        	<div class="col-md-4 h4"><strong>Price</strong></div>
								        </div>
								    </div>
								    
								</div>
							</td>
						</tr>
					</thead>
					<!-- CPU Row -->
					<tr>
						<td>
							<div class="row">
							    <div class="col-md-3"><a href="${contextPath}/cpu">CPU</a></div>
							    <div class="col-md-9">
								    <div class="row">
									    <c:choose>
											<c:when test="${build.cpu != null}">
												<div class="col-md-8"><strong>${build.cpu.name}</strong></div>
											    <div class="col-md-3">$${build.cpu.price}</div>
											    <div class="col-md-1" align="right">
											    	<a href = "${contextPath}/mybuild/remove/cpu">
							 								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
													</a>
											    </div>
									    	</c:when>
									    	<c:otherwise>												
									            <div class="col-md-12">
									            	<a class="btn btn-primary" href="${contextPath}/cpu">Choose a CPU</a>
									            </div>
											</c:otherwise>
									    </c:choose>
								    </div>
							    </div>
							</div>
						</td>
					</tr>
					<!-- Motherboard Row -->
					<tr>
						<td>
							<div class="row">
							    <div class="col-md-3"><a href="${contextPath}/motherboard">Motherboard</a></div>
							    <div class="col-md-9">
								    <div class="row">
									    <c:choose>
											<c:when test="${build.motherboard != null}">
												<div class="col-md-8"><strong>${build.motherboard.name}</strong></div>
											    <div class="col-md-3">$${build.motherboard.price}</div>
											    <div class="col-md-1" align="right">
											    	<a href = "${contextPath}/mybuild/remove/motherboard">
							 								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
													</a>
											    </div>
									    	</c:when>
									    	<c:otherwise>
									            <div class="col-md-12">
									            	<a class="btn btn-primary" href="${contextPath}/motherboard">Choose a Motherboard</a>
									            </div>
											</c:otherwise>
									    </c:choose>
								    </div>
							    </div>
							</div>
						</td>
					</tr>
					<!-- RAM Row -->
					<tr>
						<td>
							<div class="row">
							    <div class="col-md-3"><a href="${contextPath}/ram">RAM</a></div>
							    <div class="col-md-9">
								    
								    <c:choose>
										<c:when test="${build.ramList.size() != 0}">
											<c:forEach items="${build.ramList}" var="ram">
												<div class="row">
													<div class="col-md-8"><strong>${ram.name}</strong></div>
												    <div class="col-md-3">$${ram.price}</div>
												    <div class="col-md-1" align="right">
												    	<a href = "${contextPath}/mybuild/remove/ram">
								 							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
														</a>
												    </div>
											    </div>
										    </c:forEach>
										    <div class="row">
										    	<div class="col-md-12">
									            	<a class="btn btn-primary" href="${contextPath}/ram">Add additional RAM</a>
									            </div>
										    </div>
								    	</c:when>
								    	<c:otherwise>
									        <div class="row">
									            <div class="col-md-12">
									            	<a class="btn btn-primary" href="${contextPath}/ram">Choose a RAM</a>
									            </div>
									        </div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:if>
	</div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
