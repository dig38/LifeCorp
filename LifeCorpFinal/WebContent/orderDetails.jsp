<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
	<c:import url="/inserts/head.jsp" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:import url="/inserts/header.jsp" />
	<div class="container">
	<h1>Order History</h1>
	<table class="table table-striped">
		<tr>
			<th>Quantity</th>
			<th>Product Name</th>
			<th>Unit Price</th>
			<th>Total Price</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
			
			
		</tr>
		<c:forEach var="Ord" items="${detailedOrder}">
			<tr>
				<td><c:out value='${Ord.quanity}'/></td>
				<td><c:out value='${Ord.productName}'/></td>
				<td class="right"><fmt:formatNumber value="${Ord.unitPrice}" type="currency"/></td>
				<td><c:out value='${Ord.quanity*Ord.unitPrice}'/></td>
				
			</tr> 	
		</c:forEach>
	</table>
	<table class="table table-striped">
			<tr>
				<th>Total Amount</th>
				<td><td class="right"><fmt:formatNumber value="${detailedOrder.orderTotal}" type="currency"/></td>
			</tr>
	</table>
	</div>

</body>
</html>