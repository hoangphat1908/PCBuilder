<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
	<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="_menu.jsp"/>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">

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
    </c:if>

</div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>