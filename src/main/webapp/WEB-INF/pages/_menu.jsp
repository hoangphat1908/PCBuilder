<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-default">
	<div class="navbar-header">
      <a class="navbar-brand" href="${contextPath}/">PC Builder</a>
    </div>
	<div class="collapse navbar-collapse">
		<ul class="nav navbar-nav">

			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">View PC Parts <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="${contextPath}/cpu">CPU</a></li>
					<li><a href="${contextPath}/cooler">CPU Cooler</a></li>
					<li><a href="${contextPath}/motherboard">Motherboard</a></li>
					<li><a href="${contextPath}/ram">RAM</a></li>
					<li><a href="${contextPath}/storage">Storage</a></li>
					<li><a href="${contextPath}/gpu">GPU</a></li>
					<li><a href="${contextPath}/psu">PSU</a></li>
					<li><a href="${contextPath}/case">Case</a></li>
				</ul>
			</li>
			<li><a href = "${contextPath}/post">View Posts</a></li>
			<li>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control">
					</div>
					<button type="submit" class="btn btn-default">Search</button>
				</form>
			</li>
		</ul>
		<ul class = "nav navbar-nav navbar-right">
			
			<c:choose>
				<c:when test="${pageContext.request.userPrincipal.name != null}">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${pageContext.request.userPrincipal.name}<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${contextPath}/profile">Your profile</a></li>
							<li><a href="${contextPath}/mybuild">Your current build</a></li>
							<li><a href="${contextPath}/logout">Sign Out</a></li>
						</ul>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="${contextPath}/login" class="btn">Sign In</a>
					</li>
					<li>
						<a href="${contextPath}/register" class="btn">Register</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>