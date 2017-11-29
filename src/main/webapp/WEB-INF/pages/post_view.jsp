<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
	<div class="container-fluid">
		<c:if test="${post != null}">
			<div class="row">
				<c:if test="${build != null}">
					<div class="col-md-4">
						<h4>${build.name}</h4>
						<hr>
						<table class="table table-striped">
						
							<thead>
								<tr>
									<td>
										<div class="row">
											<div class="col-md-12" align="center"><h4><strong>Build components</strong></h4></div>
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
						<br>
					</div>
				</c:if>
				<div class="${build != null ? 'col-md-6' : 'col-md-6 col-md-offset-3'}">	
				  				   
					<h2>${post.title}</h2>
					<h5>by ${post.user.username}</h5>
					<hr>
					<p>${post.body}</p>
					<br>   
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<h4>Leave a Comment:</h4>
						<form:form method="POST" modelAttribute="comment" class="form-signin">
							<spring:bind path="body">
								<div class="form-group">
									<form:textarea path="body" class="form-control" rows="3"/>
								</div>
							</spring:bind>
							<button class="btn btn-primary" type="submit">Submit</button>
						</form:form>
					</c:if>
					<br><br>
					<p><span class="badge">${post.commentList.size() > 0 ? post.commentList.size() : 0}</span> Comments:</p><br>
					<c:if test="${post.commentList.size() > 0}">
						<c:forEach items="${post.commentList}" var="comment">
							<div class="row">
								<div class="col-sm-2 text-center">
									<img src="https://static.dreamstime.com/t/male-avatar-profile-picture-silhouette-34443055.jpg" class="img-circle" height="65" width="65" alt="Avatar Pic">
								</div>
								<div class="col-sm-10">
									<h4>${comment.user.username}</h4>
									<p>${comment.body}</p>
									<br>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</c:if>
	</div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
