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

<title>Product details</title>
</head>
<c:set value="${pageContext.request.contextPath}" var="context"></c:set>
<body>
<%@include file="header.jsp" %>

	<h2>
		<center>PRODUCT DETAILS</center>
	</h2>
	<af:form class="form-horizontal" action="${context}/addProduct" modelAttribute="product" enctype="multipart/form-data">
		<af:hidden path="id" />
		<div class="form-group">
			<label class="control-label col-sm-2" for="name">Product
				Name:</label>
			<div class="col-sm-10">
				<af:input style="width:50%" type="text" path="productname" class="form-control"
					placeholder="Enter product name" />
	            <af:errors path="productname"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="desc">Product
				Description:</label>
			<div class="col-sm-10">
				<af:textarea class="form-control" rows="5" path="description" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="cost">Cost:</label>
			<div class="col-sm-10">
				<af:input style="width:50%" type="text" path="cost" class="form-control"
					placeholder="Enter cost" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="quantity">Enter
				quantity:</label>
			<div class="col-sm-10">
				<af:input style="width:50%" type="text" path="quantity" class="form-control"
					placeholder="Enter quantity" />
					<af:errors path="quantity"/>
				</div>
		</div>
	  <div class="form-group">
			<label class="control-label col-sm-2" for="file">Select an
				image:</label>
			<div class="col-sm-10">
				<af:input style="width:50%" type="file" path="file" class="form-control" />
			</div>
		</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="quantity">Select category:</label>
		<div class="col-sm-10">
			<af:select path="category.id">
				<af:options items="${categoryList}" itemLabel="name" itemValue="id"></af:options>
			</af:select>
				</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-danger" id="btnsubmit">Add Product</button>
			</div>
		</div>
	</af:form>

	<table class="table table-hover">
		<tr>
			<th>Id</th>
			<th>ProductName</th>
			<th>Image</th>
			<th>Cost</th>
			<th>Category</th>
			<th>Quantity</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${products}" var="product">
			<tr>
				<c:url value="/images/${product.id}.jpg" var="url" />
				<td>${product.id}</td>
				<td>${product.productname}</td>
				<td><img src="${url}" width="150" align="middle" height="150"></td>
				<td>${product.cost}</td>
				<td>${product.category.name}</td>
				<td>${product.quantity}</td>
				<td><a href="${context}/editproduct/${product.id}"><button
							type="submit" class="btn btn-basic">Edit</button></a></td>
				<td><a href="${context}/deleteproduct/${product.id}"><button
							type="submit" class="btn btn-basic">Delete</button></a></td>			
			</tr>
		</c:forEach>
	</table>
</body>
</html>