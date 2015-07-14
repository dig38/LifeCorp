<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<c:import url="/inserts/head.jsp" />
<body>
	<c:import url="/inserts/header.jsp" />
	<div class="container">
	
	<h1>Admin: <c:out value="${custOrd.demoCustomer.custFirstName} ${custOrd.demoCustomer.custLastName}"/>'s Order ID: <c:out value="${custOrd.orderId}"/> Details</h1>
	<!-- <th>${ordItem.demoOrder.demoCustomer.custFirstName} ${ordItem.demoOrder.demoCustomer.custLastName}</th>-->
	<table class="table table-striped">
		<tr>
			<th>Order Item ID</th>
			<th>Quantity</th>
			<th>Unite Price</th>
		</tr>
		<c:forEach var="ordItem" items="${ordItemList}">
			<tr>
				<th><c:out value="${ordItem.orderItemId}"/></th>
				<th><fmt:formatNumber type="currency" value="${ordItem.quantity}"/></th>
				<th><fmt:formatNumber type="currency" value="${ordItem.unitPrice}"/></th>
			</tr> 
		</c:forEach>
	</table>
	<table class="table table-striped">
	<tr>
	<th class="col-md-8">Order Total</th><th class="col-md-4"><fmt:formatNumber type="currency" value="${custOrd.orderTotal}"/></th>
	</tr>
	</table>
	<c:import url="/inserts/footer.jsp" />
	</div> <!-- /container -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
</body>
</html>