<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>New Post</title>
	<link href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
</head>

<body>
<jsp:include page="_menu.jsp"/>
<div class="container">
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<div class="row">
		    
		    <div class="col-md-8 col-md-offset-2">
		        
	    		<h1>Create post</h1>
	    		<form:form method="POST" modelAttribute="post">
	    		    
	    		    <spring:bind path="title">
						<div class="form-group">
							<form:label path="title">Title</form:label>
							<form:input type="text" path="title" class="form-control"/>
						</div>
					</spring:bind>  
					
					<spring:bind path="buildId">
						<div class="form-group">
							<form:label path="buildId">Include a build</form:label>
							<form:select path="buildId" class="form-control">
							    <form:option value="0" label="None" />
	
							    <form:options items="${buildList}" itemValue="id"></form:options>
							</form:select>  
						</div>
					</spring:bind>
	    		  
	    		    <spring:bind path="body">
		    		    <div class="form-group">
		    		        <form:label path="body">Body</form:label>
		    		        <form:textarea rows="5" path="body" class="form-control"/>
		    		    </div>
	    		    </spring:bind>
	    		    
	    		    <div class="form-group">
	    		        <button type="submit" class="btn btn-primary">
	    		            Create
	    		        </button>
	    		    </div>
	    		    
	    		</form:form>
			</div>
		</div>
	</c:if>
</div>
<!-- 
<div class="container">

    <form:form method="POST" modelAttribute="post" class="form-signin">
        <h2 class="form-signin-heading">Create a new post</h2>
        <spring:bind path="title">
            <div class="form-group">
                <form:input type="text" path="title" class="form-control" placeholder="Title"
                            autofocus="true"></form:input>
                <form:errors path="title"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="body">
            <div class="form-group">
                <form:input type="text" path="body" class="form-control" placeholder="Body"></form:input>
                <form:errors path="body"></form:errors>
            </div>
        </spring:bind>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Post it!</button>
    </form:form>

</div>
-->
<script src="/webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>