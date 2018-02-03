<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Title</title>
</head>
<c:set value="${pageContext.request.contextPath}" var="context"></c:set>

<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Gorgeous World</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="homePage">Home</a></li>
			<security:authorize access="hasAuthority('USER')">
				<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown">Products <span class="caret"></span></a>
				<ul class="dropdown-menu">
							<li><a href="couch">Couches and sofas</a></li>
							<li><a href="dinners">Dinner table</a></li>
							<li><a href="vanity">Wardrobes and vanity</a></li>
							<li><a href="swingproduct">Swings</a></li>
				</ul></li>
			<li><a href="${context}/bp">Buy product</a></li>	
			<li><a href="${context}/aboutus">About us</a></li>
			<li><a href="${context}/cart">
          <span class="glyphicon glyphicon-shopping-cart">Cart</span></li>
        </a>
		</ul>		
		</security:authorize>
		<security:authorize access="hasAuthority('ADMIN')">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown">Products <span class="caret"></span>
					<ul class="dropdown-menu">
						<li><a href="couch">Couches and sofas</a></li>
						<li><a href="dinners">Dinner table</a></li>
						<li><a href="vanity">Wardrobes and vanity</a></li>
						<li><a href="swingproduct">Swings</a></li>
					</ul></li>
			<li><a href="aboutus">About us</a></li>
			<li><a href="${context}/up">User List</a></li>
			<li><a href="${context}/product">Add product</a></li>
			<li><a href="${context}/category">Add Category</a>
			</ul>
		</security:authorize>
		<form class="navbar-form navbar-left">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
				<button class="btn btn-default" type="submit">
					        <i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
			<div></div>
		</form>
		
		<ul class="nav navbar-nav navbar-right">
			<security:authorize access="isAnonymous()">
				<li><a href="register"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="login"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<li><a href="" style="text-align: right; color: pink;">Welcome
						<security:authentication property="principal.username" /> to...Gorgeous world
				</a></li>
			<li><a href="logout"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</security:authorize>
</ul>
	</div>
	</nav>

</body>
</html>