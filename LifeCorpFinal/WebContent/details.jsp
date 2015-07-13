<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>LifeCorp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" />
</head>
<body>
	<div class="container">
		<form class="form-horizontal" action="Register" method="post">
			<div class="form-group">
					<label for="email" class="col-sm-2 control-label">Email / Account Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="email" id="email" placeholder="Email / Account Name" value="<c:out value='${product.productName}' />" disabled />
					</div>
			</div>
			<div class="form-group">
					<label for="password" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="password" id="password" placeholder="Password"  value="<c:out value='${product.Listprice}' />" disabled /> 
					</div>
			</div>
			<div class="form-group">
				<label for="fname" class="col-sm-2 control-label">First Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="fname" id="fname" placeholder="First Name" value="<c:out value='${product.ProductId}' />" disabled /> 
				</div>
			</div>
			 
		</form>
		<c:import url="/WEB-INF/inserts/footer.jsp" />
	</div> <!-- /container -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
</body>
</html>