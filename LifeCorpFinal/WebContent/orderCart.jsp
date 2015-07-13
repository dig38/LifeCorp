<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Products</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	
	<!-- Local style sheet in case needed for local modifications -->
	<link rel="stylesheet" href="styles/main.css">
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<!-- Local CSS Page for any application-specific needs -->
	<link rel="stylesheet" href="styles/main.css" type="text/css"/>

</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="login.jsp">Log In</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.jsp">Home</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
<br />
<br />
<br />
    <div class="container">
	    ${message}
	    <div class="jumbotron">
	    
	    
	
			<h1>Your cart</h1><br>
			
			<table>
			  <tr>
			    <th>Quantity</th>
			    <th>Description</th>
			    <th>Price</th>
			    <th>Amount</th>
			    <th>Total</th>
			    <th class="wide"></th>
			  </tr>
<%-- 			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- 			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
			<c:forEach var="item" items="${order.demoOrderItems}">
			  <tr>
			    <td >
			<!--       <form action="" method="post"> SEEMS WIERD TO HAVE ACTION AS BLANK -->
				<form action="OrderBuilderServlet" method="post">
			        <input type="hidden" name="productId" 
			               value="<c:out value='${item.demoProductInfo.productId}'/>">
			        <input type="number" name="quantity" class="right narrow"
			               value="<c:out value='${item.quantity}'/>" id="quantity" maxlength="2" 
			               min="1" max="20" />
			        <input type="submit" value="Update" class="buttonFont" >
			     </form>
			    </td>
			    <td class="description" ><c:out value='${item.demoProductInfo.productName}'/></td>
			    <td class="right"><fmt:formatNumber value="${item.demoProductInfo.listPrice}" type="currency"/></td>
			    <td class="right"><c:out value='${item.quantity}'/></td>
			<!-- Can do this two ways - one with formatting an object variable the other using a String method -->
			<%--     <td class="right"><fmt:formatNumber value="${item.total}" type="currency"/></td> --%>
			    <td class="right"><fmt:formatNumber value="${item.quantity * item.demoProductInfo.listPrice}" type="currency" /></td>
			    <td>
			      <form action="OrderBuilderServlet" method="post">
			        <input type="hidden" name="productId" 
			               value="<c:out value='${item.demoProductInfo.productId}'/>">
			        <input type="hidden" name="quantity" value="0">
			        <input type="submit" value="Remove Item" class="buttonFont" >
			      </form>
			    </td>
			  </tr>
			</c:forEach>
			</table>
			
			<p><b>To change the quantity</b>, enter the new quantity 
			      and click on the Update button.</p>
			  
			<form action="DisplayProducts" method="post">
			  <input type="hidden" name="action" value="shop">
			  <input type="submit" value="Continue Shopping" class="buttonFont" >
			</form>
			<span>&nbsp;</span>
			<form action="OrderBuilderServlet" method="post">
			  <input type="hidden" name="action" value="checkout">
			<input type="submit" value="Checkout" class="buttonFont" > 
			</form>
			
			
			
  </div></div>  <!-- /.container -->
</body>
</html>
  </div><!-- /.container -->
</body>
</html>