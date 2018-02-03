<%@taglib prefix="af" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
h2
{
color:AliceBlue;
font-family:Georgia;
}
.col-sm-2
{
color:PaleGoldenRod;
font-family:Times New Roman;
font-size:20px;
}
.col-sm-10
{
color:PaleGoldenRod;
font-family:Times New Roman;
font-size:20px;
}
</style>
</head>
<body background="images/loginback.jpg">
<%@include file="header.jsp" %>
<div align="center">
<c:set value="${pageContext.request.contextPath}" var="context"></c:set>
<h2>LOGIN FORM</h2>
<img src="${context}/images/default.jpg"  width="15%" height="15%">
</div>
<br><br><br>
<div class="container">
  <form class="form-horizontal" action="${context}/login" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="username">Username:</label>
      <div class="col-sm-10">
        <input style="width:50%" type="text" class="form-control" id="username" placeholder="Enter username" name="username">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input style="width:50%" type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
      </div>
    </div>
 <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">Login</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>
