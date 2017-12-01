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
		<h3>Post List</h3>
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
		<a class="btn btn-lg btn-primary btn-block" href="${contextPath}/post/new">Create new post</a>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>