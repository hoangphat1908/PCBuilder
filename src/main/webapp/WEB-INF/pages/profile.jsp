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

	
		
	<div class="row">
		<div class="col-sm-12 col-md-12">
            <div align="center">
                <img src="https://static.dreamstime.com/t/male-avatar-profile-picture-silhouette-34443055.jpg" alt="profile_img" title="Phat Nguyen" class="img-circle" height="100" width="100">
            </div>
            <div>
                <div align="center">
                    <h3>Phat Nguyen</h3>
                </div>
                 
				<ul class="nav nav-tabs nav-justified">
					<li class="active"><a data-toggle="tab" href="#profile"><strong>Profile</strong></a></li>
					<li><a data-toggle="tab" href="#builds"><strong>Builds</strong></a></li>
					<li><a data-toggle="tab" href="#posts"><strong>Posts</strong></a></li>
					<li><a data-toggle="tab" href="#comments"><strong>Comments</strong></a></li>
				</ul>
				
				<div class="tab-content">
					<div id="profile" class="tab-pane fade in active">
						<h3>Your profile</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
					</div>
					<div id="builds" class="tab-pane fade">
						<h3>Your Builds</h3>
						<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
					<div id="posts" class="tab-pane fade">
						<h3>Your Posts</h3>
						<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
					</div>
					<div id="comments" class="tab-pane fade">
						<h3>Your Comments</h3>
						<p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
					</div>
				</div>
            </div>
        </div>
	</div>
	
    <c:if test="${pageContext.request.userPrincipal.name != null}">
		<div class="row">
        <h2>Welcome ${pageContext.request.userPrincipal.name}</h2>
        <h3>Your Current Build</h3>
        <c:if test="${currentBuild != null}">
	        <table border="1" width="70%" class="table table-striped">
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
	   <h3>Your Builds</h3>
	    <table border="1" width="70%" class="table table-striped">
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
        <h3>Post List</h3>
	    <table border="1" width="70%" class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Title</td>
	   			<td>Body</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${postList}" var="post">
	   		<tr>
	   			<td><a href = "${contextPath}/post/${post.id}">${post.id}</a></td>
	   			<td>${post.title}</td>
	   			<td>${post.body}</td>
	   		</tr>
	   		</c:forEach>
	   </table>
	   <h3>Comment List</h3>
	    <table border="1" width="70%" class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>Post ID</td>
	   			<td>ID</td>
	   			<td>Body</td>
	   		</tr>
	   		</thead>
	   		<c:forEach items="${commendList}" var="comment">
	   		<tr>
	   			<td><a href = "${contextPath}/post/${comment.postId}">${comment.postId}</a></td>
	   			<td>${comment.id}</td>
	   			<td>${comment.body}</td>
	   		</tr>
	   		</c:forEach>
	   </table>
	   </div>
    </c:if>

</div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>