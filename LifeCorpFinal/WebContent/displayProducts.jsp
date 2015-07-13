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
		  <h1>Welcome to LifeCorp</h1>
		  <h3>Please select from the product list below:</h3><br><br>
		  <form action="DisplayProducts" method="post">
		  	<select name="category">
		  		<option value="All">All</option>
		  		<option value="Accessories">Accessories</option>
				<option value="Mens">Mens</option>
				<option value="Womens">Womens</option>		  	
		  	</select><br><br>
		  	
		  	<input type="submit" value="View Category" />
		  </form><br><br>
			<table>
			    <tr>
			        <th>Description</th>
			        <th class="right">Price</th>
			        <th>&nbsp;</th>
			        <th>&nbsp;</th>
			    </tr>
		    <c:forEach var="p" items="${products}">
			    <tr>
			        <td>"<c:out value='${p.productName}'/>"</td>
			        <td class="right"><fmt:formatNumber value="${p.listPrice}" type="currency"/></td>
			        
			        <td><form action="OrderBuilderServlet" method="post">
			        	<input type="hidden" name="action" value="productDetail">
			            <input type="hidden" name="productId" value="<c:out value='${p.productId}'/>">
			                <input type="submit" value="See Detail">
			            </form></td>
			        
			        
			        <td><form action="OrderBuilderServlet" method="post">
			        	<input type="hidden" name="action" value="cart">
			            <input type="hidden" name="productId" value="<c:out value='${p.productId}'/>">
			                <input type="submit" value="Add To Cart">
			            </form></td>
			    </tr>
		    </c:forEach>
			</table><br><br>
  </div><!-- /.container -->
</body>
</html>