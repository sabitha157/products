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

h2 {
	color: Brown;
	font-family: Georgia;
}
</style>

<title>Category details</title>
</head>
<c:set value="${pageContext.request.contextPath}" var="context"></c:set>
<body>
<%@include file="header.jsp" %>
	<h2>
		<center>CATEGORY DETAILS</center>
	</h2>
	<af:form class="form-horizontal" action="${context}/addCategory" modelAttribute="category">
		<af:hidden path="id" />
		<div class="form-group">
			<label class="control-label col-sm-2" for="name">Enter the category:</label>
			<div class="col-sm-10">
				<af:input style="width:50%" type="text" path="name" class="form-control"
					placeholder="Enter category" />
			</div>
		</div>
				
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
			<a href="${context}/category">	<button type="submit" class="btn btn-danger" id="btnsubmit">Add category</button></a>
			</div>
		</div>
	</af:form>
	<table class="table table-hover">
		<tr>
			<th>Id</th>
			<th>Category</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${categories}" var="category">
			<tr>
				<td>${category.id}</td>
				<td>${category.name}</td>
				
				<td><a href="${context}/editcategory/${category.id}"><button
							type="submit" class="btn btn-basic">Edit</button></a></td>
				<td><a href="${context}/deletecategory/${category.id}"><button
							type="submit" class="btn btn-basic">Delete</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>