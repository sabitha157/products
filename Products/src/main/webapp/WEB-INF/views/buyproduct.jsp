<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="af" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.col-sm-10 {
	color: Brown;
	font-family: Georgia;
}

.col-sm-4 {
	color: Green;
	font-family: Georgia;
}

h2 
{
	color: Brown;
	font-family: Georgia;
}
</style>

<title>Product details</title>
</head>
<c:set value="${pageContext.request.contextPath}" var="context"></c:set>
<body>
<%@include file="header.jsp" %>

	<h2>
		<center>PRODUCTS</center>
	</h2>
	<af:form class="form-horizontal" modelAttribute="product" enctype="multipart/form-data"/>
	<table class="table table-hover">
		<tr>
			<th>Id</th>
			<th>ProductName</th>
			<th>Image</th>
			<th>Cost</th>
			<th>Category</th>
			<th>Buy</th>
		</tr>
		<c:forEach items="${products}" var="product">
			<tr>
				<c:url value="/images/${product.id}.jpg" var="url" />
				<td>${product.id}</td>
				<td>${product.productname}</td>
				<td><img src="${url}" width="150" align="middle" height="150"></td>
				<td>${product.cost}</td>
				<td>${product.category.name}</td>
				<td><a href="${context}/acart/${product.id}" class="btn btn-danger">Add to cart</a></td></td>			
			</tr>
		</c:forEach>
	</table>
</body>
</html>