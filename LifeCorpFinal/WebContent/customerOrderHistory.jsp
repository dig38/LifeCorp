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
			<th>Order ID</th>
			<th>Date</th>
			<th>Total Amount</th>
		</tr>
		<c:forEach var="History" items="${allOrders}">
			<tr>
				<td><c:out value='${History.orderId}'/></td>
				<td><c:out value='${History.orderTimestamp}'/></td>
				<td class="right"><fmt:formatNumber value="${History.orderTotal}" type="currency"/></td>	
			</tr> 	
		</c:forEach>
	</table>
	</div>

</body>
</html>