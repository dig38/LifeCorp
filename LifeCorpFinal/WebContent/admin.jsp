<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.servlet.ServletContext" %>
<%@page import="javax.servlet.RequestDispatcher" %>
<c:if test="${admin != true}"><jsp:forward page="index.jsp"/></c:if>
<c:if test="${admin == true}"> 
<html>
	<c:import url="/inserts/head.jsp" />
<body>
	<c:import url="/inserts/header.jsp" />
	<div class="container">
		<h1>Administration Home</h1>
	
		<div class="row">
			<div class="col-md-6">
				<h2>Customer List: </h2>
				<p><a class="btn btn-Success col-md-3" href="AdminCustomerList" role="button">Customer List</a></p>
			</div>
			<div class="col-md-6">
				<h2>List of all Order: </h2>
				<p><a class="btn btn-primary col-md-3" href="AdminOrderList" role="button">Order List</a></p>
			</div>
		</div>
	
	
		<c:import url="/inserts/footer.jsp" />
	</div> <!-- /container -->
</body>
</html>
</c:if>