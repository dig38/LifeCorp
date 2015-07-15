<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<head>
	<c:import url="/inserts/head.jsp" />
	<title>Confirm Order</title>
	</head>
<body>
	<c:import url="/inserts/header.jsp" />
	<div class="container">

	    <c:out value= "${message}" />
		<div class="jumbotron">
			<h1>Confirm Order</h1>
		</div>
		<form class="form-horizontal">
			<fieldset>
				<legend>Customer Information:</legend>
				<div class="form-group">
					<label for="name"  class="col-sm-2 control-label">Customer:</label>
					<div class="col-sm-10">
						<input type="text" name="name" class="form-control" readonly="readonly" value="<c:out value='${customer.custFirstName}' /> <c:out value='${customer.custLastName}' />" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="street1" class="col-sm-2 control-label">Address:</label>
					<div class="col-sm-10">
						<input type="text" name="street1" class="form-control" readonly="readonly" value="${customer.custStreetAddress1}" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="cityStateZip" class="col-sm-2 control-label"></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" readonly="readonly" name="cityStateZip"	value="<c:out value='${customer.custCity}' />, <c:out value='${customer.custState}' /> <c:out value="${customer.custPostalCode}" />" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="creditCard" class="col-sm-2 control-label">Credit Card:</label>
					<div class="col-sm-10">
						<input type="text" name="creditCard" class="form-control" readonly="readonly" value="${lastFour}" />
					</div>
				</div>
			</fieldset>
		</form>
		
		<legend>Order Items:</legend>
		<table  class="table table-striped">
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

		<form action="ConfirmOrder" method="post" class="form-horizontal">
			<input type="submit" value="Place Order" class="buttonFont" />
		</form>
		<a class="floatLeft" href="displayProducts.jsp"><button class="btn btn-default">Adjust Order</button></a>		
		<c:import url="/inserts/footer.jsp" />
	</div> <!-- /container -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
</body>
</html>