<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Posts</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="_menu.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h3>Build List</h3>
			</div>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
			    <div class="col-md-2 col-md-offset-7">
					<a class="btn btn-lg btn-primary" href="${contextPath}/mybuild/new">Create a new build</a>		
	   			</div>
	   		</c:if>
		</div>
		<c:forEach items="${buildList}" var="build">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">	
					<table class="table table-striped"> 
						<thead>
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12" align="center"><h4><strong><a href = "${contextPath}/build/${build.id}">${build.name}</a></strong> by ${build.user.username}</h4></div>
									</div>
								</td>
							</tr>
						</thead>
						<!-- CPU Row -->
						<c:if test="${build.cpu != null}">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">CPU</div>
									</div>
									<div class="row">
									    <div class="col-md-12">
										    <div class="row">											
												<div class="col-md-10"><strong>${build.cpu.name}</strong></div>
											    <div class="col-md-2">$${build.cpu.price}</div>								    	
										    </div>
									    </div>
									</div>
								</td>
							</tr>
						</c:if>
						<!-- Motherboard Row -->
						<c:if test="${build.motherboard != null}">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">Motherboard</div>
									</div>
									<div class="row">
									    <div class="col-md-12">
										    <div class="row">
												<div class="col-md-10"><strong>${build.motherboard.name}</strong></div>
											    <div class="col-md-2">$${build.motherboard.price}</div>
										    </div>
									    </div>
									</div>
								</td>
							</tr>
						</c:if>
						<!-- GPU Row -->
						<c:if test="${build.gpu != null}">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">GPU</div>
									</div>
									<div class="row">
									    <div class="col-md-12">
										    <div class="row">
												<div class="col-md-10"><strong>${build.gpu.name}</strong></div>
											    <div class="col-md-2">$${build.gpu.price}</div>
										    </div>
									    </div>
									</div>
								</td>
							</tr>
						</c:if>
						<!-- RAM Row -->
						<c:if test="${build.ramList.size()>0}">				
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">RAM</div>
									</div>
									<c:forEach items="${build.ramList}" var="ram">	
										<div class="row">
										    <div class="col-md-12">
											    <div class="row">
													<div class="col-md-10"><strong>${ram.name}</strong></div>
												    <div class="col-md-2">$${ram.price}</div>
											    </div>
										    </div>
										</div>
									</c:forEach>
								</td>
							</tr>
						</c:if>
						<!-- Storage Row -->
						<c:if test="${build.storageList.size()>0}">				
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">Storage</div>
									</div>
									<c:forEach items="${build.storageList}" var="storage">	
										<div class="row">
										    <div class="col-md-12">
											    <div class="row">
													<div class="col-md-10"><strong>${storage.name}</strong></div>
												    <div class="col-md-2">$${storage.price}</div>
											    </div>
										    </div>
										</div>
									</c:forEach>
								</td>
							</tr>
						</c:if>
						<!-- PSU Row -->
						<c:if test="${build.psu != null}">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">PSU</div>
									</div>
									<div class="row">
									    <div class="col-md-12">
										    <div class="row">
												<div class="col-md-10"><strong>${build.psu.name}</strong></div>
											    <div class="col-md-2">$${build.psu.price}</div>
										    </div>
									    </div>
									</div>
								</td>
							</tr>
						</c:if>
						<!-- Cooler Row -->
						<c:if test="${build.cooler != null}">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">Cooler</div>
									</div>
									<div class="row">
									    <div class="col-md-12">
										    <div class="row">
												<div class="col-md-10"><strong>${build.cooler.name}</strong></div>
											    <div class="col-md-2">$${build.cooler.price}</div>
										    </div>
									    </div>
									</div>
								</td>
							</tr>
						</c:if>
						<!-- Case Row -->
						<c:if test="${build.computerCase != null}">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-12">Case</div>
									</div>
									<div class="row">
									    <div class="col-md-12">
										    <div class="row">
												<div class="col-md-10"><strong>${build.computerCase.name}</strong></div>
											    <div class="col-md-2">$${build.computerCase.price}</div>
										    </div>
									    </div>
									</div>
								</td>
							</tr>
						</c:if>
						<!-- Cost Row -->
						<c:if test="${build.cost > 0}">
							<tfoot>
								<tr>
									<td>
										<div class="row">
											<div class="col-md-10"><strong>Total cost</strong></div>
											<div class="col-md-2">$${build.cost}</div>
										</div>
									</td>
								</tr>
							</tfoot>
						</c:if>
					</table>
				</div>
			</div>
		</c:forEach>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>