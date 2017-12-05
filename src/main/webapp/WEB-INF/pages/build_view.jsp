<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Build View</title>
<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="_menu.jsp"/>
	<div class="container">
		<c:if test="${build != null}">
			<div class="page-header">
				<h1>${build.name}
					<small>by ${build.user.username}</small>
				</h1>
			</div>
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
											<div class="col-md-2">
												<img src="${build.cpu.imagePath}" title="${build.cpu.name}" height="50" width="50"/>
											</div>
											<div class="col-md-6"><strong>${build.cpu.name}</strong></div>
										    <div class="col-md-4">$${build.cpu.price}</div>
								    	</c:when>
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
											<div class="col-md-2">
												<img src="${build.motherboard.imagePath}" title="${build.motherboard.name}" height="50" width="50">
											</div>
											<div class="col-md-6"><strong>${build.motherboard.name}</strong></div>
										    <div class="col-md-4">$${build.motherboard.price}</div>
								    	</c:when>
								    </c:choose>
							    </div>
						    </div>
						</div>
					</td>
				</tr>
				<!-- GPU Row -->
				<tr>
					<td>
						<div class="row">
						    <div class="col-md-3"><a href="${contextPath}/gpu">GPU</a></div>
						    <div class="col-md-9">
							    <div class="row">
								    <c:choose>
										<c:when test="${build.gpu != null}">
											<div class="col-md-2">
												<img src="${build.gpu.imagePath}" title="${build.gpu.name}" height="50" width="50">
											</div>
											<div class="col-md-6"><strong>${build.gpu.name}</strong></div>
										    <div class="col-md-4">$${build.gpu.price}</div>
								    	</c:when>
								    </c:choose>
							    </div>
						    </div>
						</div>
					</td>
				</tr>
				<!-- PSU Row -->
				<tr>
					<td>
						<div class="row">
						    <div class="col-md-3"><a href="${contextPath}/psu">PSU</a></div>
						    <div class="col-md-9">
							    <div class="row">
								    <c:choose>
										<c:when test="${build.psu != null}">
											<div class="col-md-2">
												<img src="${build.psu.imagePath}" title="${build.psu.name}" height="50" width="50">
											</div>
											<div class="col-md-6"><strong>${build.psu.name}</strong></div>
										    <div class="col-md-4">$${build.psu.price}</div>
								    	</c:when>
								    </c:choose>
							    </div>
						    </div>
						</div>
					</td>
				</tr>
				<!-- Cooler Row -->
				<tr>
					<td>
						<div class="row">
						    <div class="col-md-3"><a href="${contextPath}/cooler">Cooler</a></div>
						    <div class="col-md-9">
							    <div class="row">
								    <c:choose>
										<c:when test="${build.cooler != null}">
											<div class="col-md-2">
												<img src="${build.cooler.imagePath}" title="${build.cooler.name}" height="50" width="50">
											</div>
											<div class="col-md-6"><strong>${build.cooler.name}</strong></div>
										    <div class="col-md-4">$${build.cooler.price}</div>
								    	</c:when>
								    </c:choose>
							    </div>
						    </div>
						</div>
					</td>
				</tr>
				<!-- Case Row -->
				<tr>
					<td>
						<div class="row">
						    <div class="col-md-3"><a href="${contextPath}/case">Case</a></div>
						    <div class="col-md-9">
							    <div class="row">
								    <c:choose>
										<c:when test="${build.computerCase != null}">
											<div class="col-md-2">
												<img src="${build.computerCase.imagePath}" title="${build.computerCase.name}" height="50" width="50">
											</div>
											<div class="col-md-6"><strong>${build.computerCase.name}</strong></div>
										    <div class="col-md-4">$${build.computerCase.price}</div>
								    	</c:when>
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
									<c:when test="${build.ramList.size() > 0}">
										<c:forEach items="${build.ramList}" var="ram" varStatus="loop">
											<div class="row">
												<div class="col-md-2">
													<img src="${ram.imagePath}" title="${ram.name}" height="50" width="50">
												</div>
												<div class="col-md-6"><strong>${ram.name}</strong></div>
											    <div class="col-md-4">$${ram.price}</div>
										    </div>
									    </c:forEach>
							    	</c:when>
								</c:choose>
							</div>
						</div>
					</td>
				</tr>
				<!-- Storage Row -->
				<tr>
					<td>
						<div class="row">
						    <div class="col-md-3"><a href="${contextPath}/storage">Storage</a></div>
						    <div class="col-md-9">
							    
							    <c:choose>
									<c:when test="${build.storageList.size() > 0}">
										<c:forEach items="${build.storageList}" var="storage" varStatus="loop">
											<div class="row">
												<div class="col-md-2">
													<img src="${storage.imagePath}" title="${storage.name}" height="50" width="50">
												</div>
												<div class="col-md-6"><strong>${storage.name}</strong></div>
											    <div class="col-md-4">$${storage.price}</div>
										    </div>
									    </c:forEach>
							    	</c:when>
								</c:choose>
							</div>
						</div>
					</td>
				</tr>
				<!-- Cost Row -->
				<c:if test="${build.cost > 0}">
					<tfoot>
						<tr>
							<td>
								<div class="row">
								    <div class="col-md-3"><strong>Total cost</strong></div>
								    <div class="col-md-9">
									    <div class="row">
													<div class="col-md-8"></div>
												    <div class="col-md-4"><strong>$${build.cost}</strong></div>
									    </div>
								    </div>
								</div>
							</td>
						</tr>
					</tfoot>
				</c:if>
			</table>
		</c:if>
	</div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
