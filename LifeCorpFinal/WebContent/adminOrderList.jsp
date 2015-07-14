<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
	<c:import url="/inserts/head.jsp" />
<body>
	<c:import url="/inserts/header.jsp" />
	<div class="container">
	
	<h1>Admin:
		<c:choose>
			<c:when test="${requestScope.single != true}">
				List of All Customer Orders
			</c:when>
				
			<c:otherwise>
				Customer <c:out value="${ordList[0].demoCustomer.custFirstName} ${ordList[0].demoCustomer.custLastName}"/>'s Order History
			</c:otherwise>
		</c:choose>	
	</h1>
	<table class="table table-striped">
		<tr>
			<th>Order ID</th>
			<c:if test="${requestScope.single != true}">
				<th>Customer Name</th>
			</c:if>
			<th>Order Total</th>
			<th>Order Timestamp</th>
			<th>Order Total</th>
		</tr>
		<c:forEach var="ord" items="${ordList}">
			<tr>
				<c:url value="AdminCustomerOrderDetails" var="myURL">	<c:param name="id" value="${ord.orderId}" />	</c:url>
				<th><a href="${myURL}"><c:out value="${ord.orderId}"/></a></th>
				
				<c:if test="${requestScope.single != true}">
					<th><c:out value="${ord.demoCustomer.custFirstName} ${ord.demoCustomer.custLastName}"/></th>
				</c:if>
				
				<th><c:out value="${ord.orderId}"/></th>
				<th><fmt:formatDate value="${ord.orderTimestamp}" pattern="MM/dd/yyyy, HH:mm"/></th>
				<th><fmt:formatNumber type="currency" value="${ord.orderTotal}"/></th>
			</tr> 
		</c:forEach>
	
	</table>
	
	<c:import url="/inserts/footer.jsp" />
	</div> <!-- /container -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>