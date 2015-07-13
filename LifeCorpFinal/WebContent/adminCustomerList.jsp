<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<c:import url="/inserts/head.jsp" />
<body>
	<c:import url="/inserts/header.jsp" />
	<div class="container">
	<h1>Customer List</h1>
	<table>
		<tr>
			<th>Customer ID</th>
			<th>Customer Name</th>
			<th>Customer State</th>
			<th>Credit Limit</th>
			<th>Customer Email</th>
		</tr>
		<c:forEach var="Cust" items="${custList}">
			<tr>
				<th>${Cust.customerId}</th>
				<th>${Cust.custFirstName} ${Cust.custLastName}</th>
				<th>${Cust.custState}</th>
				<th>${Cust.creditLimit}</th>
				<th>${Cust.custEmail}</th>
			</tr> 
		</c:forEach>
	</table>
	<c:import url="/inserts/footer.jsp" />
	</div> <!-- /container -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
</body>
</html>