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
					</div>
					<div id="builds" class="tab-pane fade">
						<div class="page-header">
						  <h2>Builds</h2>
						</div>							
						<c:if test="${currentBuild != null}">
					        <table class="table table-striped">
						    	<thead>
							   		<tr>
							   			<td>ID</td>
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
						   			<td><a href = "${contextPath}/mybuild">${currentBuild.id}</a></td>
						   			<td>${currentBuild.name}</td>
						   			<td>${currentBuild.cpu.model}</td>
						   			<td>${currentBuild.motherboard.model}</td>
						   			<td>${currentBuild.gpu.model}</td>
						   			<td>${currentBuild.psu.model}</td>
						   			<td>${currentBuild.cooler.model}</td>
						   			<td>${currentBuild.computerCase.model}</td>
						   		</tr>
							</table>
						</c:if>
						<div class="page-header">
						  <h2>Builds</h2>
						</div>	
					    <table class="table table-striped">
					    	<thead>
					   		<tr>
						   			<td>ID</td>
						   			<td>name</td>
						   			<td>CPU</td>
						   			<td>Motherboard</td>
						   			<td>GPU</td>
						   			<td>PSU</td>
						   			<td>Cooler</td>
									<td>Case</td>
						   		</tr>
					   		</thead>
					   		<c:forEach items="${buildList}" var="build">
					   		<tr>
						   			<td><a href = "${contextPath}/build/${build.id}">${build.id}</a></td>
						   			<td>${build.name}</td>
						   			<td>${build.cpu.model}</td>
						   			<td>${build.motherboard.model}</td>
						   			<td>${build.gpu.model}</td>
						   			<td>${build.psu.model}</td>
						   			<td>${build.cooler.model}</td>
						   			<td>${build.computerCase.model}</td>
						   		</tr>
					   		</c:forEach>
					   </table>												
					</div>
					<div id="posts" class="tab-pane fade">
						<div class="page-header">
						  <h2>Posts</h2>
						</div>
					    
					    <c:forEach items="${postList}" var="post">
						    <div class="row">
								<div class="col-md-1" align="center">	
									<a href = "${contextPath}/post/${post.id}" class="btn btn-default btn-lg">
										<span class="glyphicon glyphicon-hdd"></span> 
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