<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${isAdmin != true}"><jsp:forward page="404"/></c:if>
<c:if test="${isAdmin == true}">
<html>
	<c:import url="/inserts/head.jsp" />
<body>
	<div id="wrap">
	<c:import url="/inserts/header.jsp" />
	<div class="container content">
	
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
				<th>
					<form action="AdminCustomerOrderHistory" method="post">
						<c:set var="cusomertid"><c:out value="${Cust.customerId}" /></c:set>
						<input type="hidden" name="id" value="${cusomertid}" />
						<input  class="submitLink" type="submit" value="<c:out value="${Cust.custFirstName} ${Cust.custLastName}"/>">
					</form>
				</th>
				<th><c:out value="${Cust.custState}"/></th>
				<c:set var="cusomertcreditlimit"><c:out value="${Cust.creditLimit}" /></c:set>
				<th><fmt:formatNumber  type="currency" value="${cusomertcreditlimit}"/></th>
				<th><c:out value="${Cust.custEmail}"/></th>
			</tr>
		</c:forEach>
	</table>
	</div> <!-- /container -->
	<c:import url="/inserts/footer.jsp" />
	</div><!-- wrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
</c:if>