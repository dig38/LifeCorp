<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<c:import url="/inserts/head.jsp" />
</head>
<body BGCOLOR=lightgrey background=sunset.jpg>

<c:import url="/inserts/header.jsp" />

<div class="container">
	
	<div class="col-sm-3 col-md-3 col-lg-3"></div>
	
	<form id="indexform" class="col-md-6" action="login.jsp">
		<h1>Welcome to ....</h1><br />
		<h1><strong>LifeCorp Shopping</strong></h1> <br>	
		<div class="buttons">
			<div class="col-sm-2 col-md-2 col-lg-2"></div>
			<div class="form-group form-group-sm col-sm-3 col-md-3 col-lg-3">
				<input class="btn btn-info col-sm-12 col-md-12 col-lg-12" type="button" value="Product List" onclick="location.href='DisplayProducts'">
			</div>
			<div class="col-sm-2 col-md-2 col-lg-2"></div>
			<div class="form-group form-group-sm col-sm-3 col-md-3 col-lg-3">
				<input class="btn btn-primary col-sm-12 col-md-12 col-lg-12" type="submit" value="Login" onclick="location.href='login.jsp'">
			</div>
			<div class="col-sm-2 col-md-2 col-lg-2"></div>
		</div>
	</form>
	<marquee><h2><font color="black" >Enjoy shopping online.</font></h2></marquee>
	<div class="col-sm-3 col-md-3 col-lg-3"></div>
	<c:import url="/inserts/footer.jsp" />
	
</div> <!-- /container -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>