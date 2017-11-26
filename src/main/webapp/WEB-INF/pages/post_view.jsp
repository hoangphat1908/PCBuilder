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
	<div class="container">
	<c:if test="${post != null}">
	    <table border="1" width="70%" class="table table-striped">
	    	<thead>
	   		<tr>
	   			<td>ID</td>
	   			<td>Username</td>
	   			<td>Title</td>
	   			<td>Body</td>
	   		</tr>
	   		</thead>
	   		<tr>
	   			<td>${post.id}</td>
	   			<td>${post.user.username}</td>
	   			<td>${post.title}</td>
	   			<td>${post.body}</td>
	   		</tr>
	   </table>
	   <c:if test="${post.commentList.size() > 0}">
		   <h3>Comment List</h3>
		    <table class="table table-striped">
		    	<thead>
		   		<tr>
		   			<td>ID</td>
		   			<td>Username</td>
		   			<td>Body</td>
		   		</tr>
		   		</thead>
		   		<c:forEach items="${post.commentList}" var="comment">
		   		<tr>
		   			<td>${comment.id}</td>
		   			<td>${comment.user.username}</td>
		   			<td>${comment.body}</td>
		   		</tr>
		   		</c:forEach>
		   </table>
	   </c:if>
	   <c:if test="${pageContext.request.userPrincipal.name != null}">
		   <form:form method="POST" modelAttribute="comment" class="form-signin">
	        	<h2 class="form-signin-heading">Create a new comment</h2>
		        <spring:bind path="body">
		            <div class="form-group">
		                <form:input type="text" path="body" class="form-control" placeholder="Body"></form:input>
		                <form:errors path="body"></form:errors>
		            </div>
		        </spring:bind>
		        <button class="btn btn-lg btn-primary btn-block" type="submit">Post it!</button>
		    </form:form>
	   </c:if>
	   
	</c:if>
   </div>
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
