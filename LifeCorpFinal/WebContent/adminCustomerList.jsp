<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${isAdmin != true}"><jsp:forward page="index.jsp"/></c:if>
<c:if test="${isAdmin == true}">
<html>
	<c:import url="/inserts/head.jsp" />
<body>
	<c:import url="/inserts/header.jsp" />
	<div class="container">
	
	<h1>Admin: Customer List</h1>
	<table class="table table-striped">
		<tr>
			<th>Customer ID</th>
			<th>Customer Name</th>
			<th>Customer State</th>
			<th>Credit Limit</th>
			<th>Customer Email</th>
		</tr>
		<c:forEach var="Cust" items="${custList}">
			<tr>
				<th><c:out value="${Cust.customerId}"/></th>
				<c:url value="AdminCustomerOrderHistory" var="myURL">	<c:param name="id" value="${Cust.customerId}" />	</c:url>
				<th><a href="${myURL}"><c:out value="${Cust.custFirstName} ${Cust.custLastName}"/></a></th>
				<th><c:out value="${Cust.custState}"/></th>
				<th><fmt:formatNumber  type="currency" value="${Cust.creditLimit}"/></th>
				<th><c:out value="${Cust.custEmail}"/></th>
			</tr>
		</c:forEach>
	</table>
	<c:import url="/inserts/footer.jsp" />
	</div> <!-- /container -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
</c:if>