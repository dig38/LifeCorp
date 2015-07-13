<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Order</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	
	<!-- Local style sheet in case needed for local modifications -->
	<link rel="stylesheet" href="styles/main.css">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<!-- Local CSS Page for any application-specific needs -->
	<link rel="stylesheet" href="styles/main.css" type="text/css"/>
	
	<!-- Local script for create account button -->
	<script type="text/javascript" src="scripts/checkPass.js" ></script>

</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="login.jsp">Log In</a>
          <a class="navbar-brand" href="#">See Previous Orders</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.jsp">Home</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
<br />
<br />
<br />
    <div class="container">
	    ${message}
	    <div class="jumbotron">
	    
	    
	
	<h1>Confirm Order</h1><br>
	<fieldset>
		<legend>Customer Information:</legend>
		<label for="name">Customer:</label>
		<input type="text" name="name" class="inputTransparent" readonly="readonly" 
			value="<c:out value='${customer.custFirstName}' />&nbsp;<c:out value='${customer.custLastName}' />" /><br>
		<label for="street1">Address:</label>
		<input type="text" name="street1" class="inputTransparent" readonly="readonly" value="${customer.custStreetAddress1}" /><br>
		<label for="city">&nbsp;</label>
		<input type="text" class="inputTransparent" readonly="readonly" name="city" 
			value="<c:out value='${customer.custCity}' />, <c:out value='${customer.custState}' />&nbsp;&nbsp;<c:out value="${customer.custPostalCode}" />" /><br>
		<label for="creditCard">Credit Card:</label>
		<input type="text" name="creditCard" class="inputTransparent" readonly="readonly" value="${lastFour}" /><br>
	</fieldset><br>
	<fieldset>
		<legend>Order Items:</legend>
		<table>
			<tr>
				<th>Item Name</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Line Total</th>
			</tr>
			<c:forEach var="item" items="${order.demoOrderItems}">
			<tr>
				<td><c:out value="${item.demoProductInfo.productName}" /></td>
				<td class="right"><c:out value="${item.quantity}" /></td>
				<td class="right"><fmt:formatNumber value="${item.demoProductInfo.listPrice}" type="currency"/></td>
				<td class="right"><fmt:formatNumber value="${item.demoProductInfo.listPrice * item.quantity}" type="currency"/>
			</tr>		
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td class="right">Order Total:</td>
				<td class="right"><fmt:formatNumber value="${order.orderTotal}" type="currency"/>
			</tr>
		</table>
	</fieldset><br>
	<form action="ConfirmOrder" method="post" class="floatLeft" >
		<input type="submit" value="Place Order" class="buttonFont" />&nbsp;&nbsp;
	</form>
		<a class="floatLeft" href="displayProducts.jsp"><button class="buttonFont">Adjust Order</button></a>
	
			
			
			
  </div></div>  <!-- /.container -->
</body>
</html>
  </div><!-- /.container -->
</body>
</html>