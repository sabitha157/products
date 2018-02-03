<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body>
	<%@include file="header.jsp"%>

	<div class = "container">
		<table class="table table-hover">
			<thead>
				<tr>
					<td>Image</td>
					<td>Name</td>
					<td>Cost</td>
					<td>Quantity</td>
					<td>Action</td>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${cart.cartItems}" var="cart">
				<c:url value="/images/${cart.product.id}.jpg" var="url" />
					<tr>
						<td><img alt="${product.productname}"
							src="${url}" width="260px" height="300px" class="img-thumbnail"></td>
						<td>${cart.product.productname}</td>
						<td>${cart.subTotal}</td>
						<td>${cart.quantity}</td>
						<td><a href="${pageContext.request.contextPath}/deletecart/${cart.id}">
          <span class="glyphicon glyphicon-trash">DELETE</span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="col-sm-6">
				<h3>Grand Total : ${cart.grandTotal}</h3>
			</div>
			<div class="col-sm-6">
			<c:if test="${cart.grandTotal !=0}">
				<a href="${context}/checkout" class="btn btn-primary" style="right: 50px">CHECK OUT</a>	
				</c:if>
			</div>
		</div>
		
	</div>
</body>
</html>