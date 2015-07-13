<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:import url="/inserts/head.jsp" />
<body>
	<c:import url="/inserts/header.jsp" />
	<div class="container">
	<h1> Order list </h1>
	
	<table>
		<tr>
			<th>Order ID</th>
			<th>Customer ID</th>
			<th>Order Total</th>
			<th>Order Timestamp</th>
			<th>Order Total</th>
		</tr>
		<c:forEach var="Order" items="${ordList}">
			<tr>
				<th>${Order.orderId}</th>
				<th>${Order.demoCustomer.custFirstName}</th>
				<th>${Order.orderId}</th>
				<th>${Order.orderTimestamp}</th>
				<th>${Order.orderTotal}</th>
			</tr> 
		</c:forEach>
	
	</table>
	
	<c:import url="/inserts/footer.jsp" />
	</div> <!-- /container -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
</body>
</html>