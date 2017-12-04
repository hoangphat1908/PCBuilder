<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
	<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>
<body>
<jsp:include page="_menu.jsp"/>
<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<div class="col-sm-12 col-md-12">
            <div align="center">
                <img src="https://static.dreamstime.com/t/male-avatar-profile-picture-silhouette-34443055.jpg" alt="profile_img" title="Phat Nguyen" class="img-circle" height="100" width="100">
            </div>
            <div>
                <div align="center">
                    <h3>Phat Nguyen</h3>
                    <span class="help-block">${pageContext.request.userPrincipal.name}</span>
                </div>
                 
				<ul class="nav nav-tabs nav-justified">
					<li class="active"><a data-toggle="tab" href="#profile"><strong>Profile</strong></a></li>
					<li><a data-toggle="tab" href="#builds"><strong>Builds</strong></a></li>
					<li><a data-toggle="tab" href="#posts"><strong>Posts</strong></a></li>
					<li><a data-toggle="tab" href="#comments"><strong>Comments</strong></a></li>
				</ul>
				
				<div class="tab-content">
					<div id="profile" class="tab-pane fade in active">
						<div class="page-header">
						  <h2>About ${pageContext.request.userPrincipal.name}</h2>
						</div>
						<h4>I am a computer enthusiast</h4>
						<div class="page-header">
						  <h2>Overview</h2>
						</div>
						<div class="row">
						  	<div class="col-md-2 col-md-offset-3" align="center">
						  		<h4><strong>Builds</strong> <span class="badge">${buildList.size()}</span></h4>
						  	</div>
						  	<div class="col-md-2" align="center">
						  		<h4><strong>Posts</strong> <span class="badge">${postList.size()}</span></h4>
						  	</div>
						  	<div class="col-md-2" align="center"> 
						  		<h4><strong>Comments</strong> <span class="badge">${commentList.size()}</span></h4>
						  	</div>
						</div>
					</div>
					<div id="builds" class="tab-pane fade">
						<div class="row">
							<div class="col-md-5">
								<div class="page-header">
							 	 	<h2>Your current Build</h2>
								</div>							
								<c:if test="${currentBuild != null}">
									<table class="table table-striped">	
										<thead>
											<tr>
												<td>
													<div class="row">
														<div class="col-md-12" align="center"><h4><strong><a href = "${contextPath}/mybuild">${currentBuild.name}</a></strong></h4></div>
													</div>
												</td>
											</tr>
										</thead>
										<!-- CPU Row -->
										<c:if test="${currentBuild.cpu != null}">
											<tr>
												<td>
													<div class="row">
														<div class="col-md-12">CPU</div>
													</div>
													<div class="row">
													    <div class="col-md-12">
														    <div class="row">											
																<div class="col-md-10"><strong>${currentBuild.cpu.name}</strong></div>
															    <div class="col-md-2">$${currentBuild.cpu.price}</div>								    	
														    </div>
													    </div>
													</div>
												</td>
											</tr>
										</c:if>
										<!-- Motherboard Row -->
										<c:if test="${currentBuild.motherboard != null}">
											<tr>
												<td>
													<div class="row">
														<div class="col-md-12">Motherboard</div>
													</div>
													<div class="row">
													    <div class="col-md-12">
														    <div class="row">
																<div class="col-md-10"><strong>${currentBuild.motherboard.name}</strong></div>
															    <div class="col-md-2">$${currentBuild.motherboard.price}</div>
														    </div>
													    </div>
													</div>
												</td>
											</tr>
										</c:if>
										<!-- GPU Row -->
										<c:if test="${currentBuild.gpu != null}">
											<tr>
												<td>
													<div class="row">
														<div class="col-md-12">GPU</div>
													</div>
													<div class="row">
													    <div class="col-md-12">
														    <div class="row">
																<div class="col-md-10"><strong>${currentBuild.gpu.name}</strong></div>
															    <div class="col-md-2">$${currentBuild.gpu.price}</div>
														    </div>
													    </div>
													</div>
												</td>
											</tr>
										</c:if>
										<!-- RAM Row -->
										<c:if test="${currentBuild.ramList.size()>0}">				
											<tr>
												<td>
													<div class="row">
														<div class="col-md-12">RAM</div>
													</div>
													<c:forEach items="${currentBuild.ramList}" var="ram">	
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
										<c:if test="${currentBuild.storageList.size()>0}">				
											<tr>
												<td>
													<div class="row">
														<div class="col-md-12">Storage</div>
													</div>
													<c:forEach items="${currentBuild.storageList}" var="storage">	
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
										<c:if test="${currentBuild.psu != null}">
											<tr>
												<td>
													<div class="row">
														<div class="col-md-12">PSU</div>
													</div>
													<div class="row">
													    <div class="col-md-12">
														    <div class="row">
																<div class="col-md-10"><strong>${currentBuild.psu.name}</strong></div>
															    <div class="col-md-2">$${currentBuild.psu.price}</div>
														    </div>
													    </div>
													</div>
												</td>
											</tr>
										</c:if>
										<!-- Cooler Row -->
										<c:if test="${currentBuild.cooler != null}">
											<tr>
												<td>
													<div class="row">
														<div class="col-md-12">Cooler</div>
													</div>
													<div class="row">
													    <div class="col-md-12">
														    <div class="row">
																<div class="col-md-10"><strong>${currentBuild.cooler.name}</strong></div>
															    <div class="col-md-2">$${currentBuild.cooler.price}</div>
														    </div>
													    </div>
													</div>
												</td>
											</tr>
										</c:if>
										<!-- Case Row -->
										<c:if test="${currentBuild.computerCase != null}">
											<tr>
												<td>
													<div class="row">
														<div class="col-md-12">Case</div>
													</div>
													<div class="row">
													    <div class="col-md-12">
														    <div class="row">
																<div class="col-md-10"><strong>${currentBuild.computerCase.name}</strong></div>
															    <div class="col-md-2">$${currentBuild.computerCase.price}</div>
														    </div>
													    </div>
													</div>
												</td>
											</tr>
										</c:if>
										<!-- Cost Row -->
										<c:if test="${currentBuild.cost > 0}">
											<tfoot>
												<tr>
													<td>
														<div class="row">
															<div class="col-md-10"><strong>Total cost</strong></div>
															<div class="col-md-2">$${currentBuild.cost}</div>
														</div>
													</td>
												</tr>
											</tfoot>
										</c:if>
									</table>	
								</c:if>
							</div>
							
							<div class="col-md-7">
								<div class="page-header">
									<h2>Your other builds
										<small>
											<a href = "${contextPath}/mybuild/new">
												Create a new build
											</a>	
										</small>
									</h2>
								</div>	
								<div class="panel-group" id="accordion">
									<c:forEach items="${buildList}" var="build" varStatus="loop">
										<div class="panel panel-default">
											<div class="panel-heading">
												<div class="row">
													<div class="col-md-11">
														<h4 class="panel-title">
															<a data-toggle="collapse" data-parent="#accordion" href="#collapse${loop.index}">${build.name}</a>
														</h4>
													</div>
													<div class="col-md-1">
														<a href = "${contextPath}/build/${build.id}">
								 							<span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>
														</a>
													</div>
												</div>
											</div>
											<div id="collapse${loop.index}" class="panel-collapse collapse">
												<div class="panel-body">
													<table class="table table-striped">	
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
													<div class="row">
														<div class="col-md-3 col-md-offset-3">
															<c:choose>
																<c:when test="${build.isPublic()}">
																	<a href = "${contextPath}/profile/set/build/${build.id}/private" class="btn btn-default">
																		Set private build
																	</a>
																</c:when>
																<c:otherwise>
																	<a href = "${contextPath}/profile/set/build/${build.id}/public" class="btn btn-success">
																		Set public build
																	</a>
																</c:otherwise>
															</c:choose>
															
														</div>
														
														<div class="col-md-3">
															<a href = "${contextPath}/mybuild/set/${build.id}" class="btn btn-primary">
																Set current build
															</a>
														</div>												
														
														<div class="col-md-3">
															<a href = "${contextPath}/profile/remove/build/${build.id}" class="btn btn-danger">
									 							Delete this build
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								 </div> 																					
							</div>
						</div>
					</div>
					<div id="posts" class="tab-pane fade">
						<div class="page-header">
						  <h2>Posts</h2>
						</div>
					    
					    <c:forEach items="${postList}" var="post">
						    <div class="row">
								<div class="col-md-1" align="center">	
									<a href = "${contextPath}/post/${post.id}" class="btn btn-default btn-lg">
										<span class="${post.buildId > 0 ? 'glyphicon glyphicon-hdd' : 'glyphicon glyphicon-list-alt'}"></span> 
									</a>
								</div>
								<div class="col-md-11 well well-sm">   
									<div class="row">
										<div class="col-md-12">       
											<h4><strong><a href = "${contextPath}/post/${post.id}">${post.title}</a></strong></h4>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<p>
												by <a href="#">${post.user.username}</a> |
												<a href = "${contextPath}/post/${post.id}">${post.commentList.size() > 0 ? post.commentList.size() : 0} comments</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div id="comments" class="tab-pane fade">
						<div class="page-header">
						  <h2>Comments</h2>
						</div>
						
						<c:forEach items="${commentList}" var="comment">
						    <div class="row">
								<div class="col-md-12">   
									<div class="row">
										<div class="col-md-12">       
											<h4><strong><a href = "${contextPath}/post/${comment.post.id}">${comment.post.title}</a></strong></h4>
										</div>
									</div>
									<div class="row well well-sm">
										<div class="col-md-1" align="center">	
											<img src="https://static.dreamstime.com/t/male-avatar-profile-picture-silhouette-34443055.jpg" alt="profile_img" title="Phat Nguyen" class="img-circle" height="50" width="50">
						
										</div>
										<div class="col-md-11">
											<div class="row">
												<div class="col-md-12">
													<p><strong><a href = "">${comment.user.username}</a></strong></p>
												</div>
											</div>  
											<div class="row">
												<div class="col-md-12">
													<p>${comment.body}</p>
												</div>
											</div> 
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<p>
												by <a href="#">${comment.post.user.username}</a> |
												<a href = "${contextPath}/post/${comment.post.id}">${comment.post.commentList.size() > 0 ? comment.post.commentList.size() : 0} comments</a>
											</p>
										</div>
									</div>
								</div>
							</div>		
						</c:forEach>
					</div>
				</div>
            </div>
        </div>
    </c:if>

</div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>