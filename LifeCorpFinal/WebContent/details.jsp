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
				<h1>Product Details</h1>
				<h3>Below are additional details for <c:out value='${productDetails.productName}'/></h3><br><br>
				<label for="productName">Product Name:</label>
				<input type="text" name="productName" value="<c:out value='${productDetails.productName}'/>" class="inputTransparent wide" readonly="readonly" ><br>
				<label for="productCategory">Product Category:</label>
				<input type="text" name="productCategory" value="<c:out value='${productDetails.category}'/>" class="inputTransparent wide" readonly="readonly" ><br>
				<label for="listPrice">Price:</label>
				<input type="text" name="listPrice" value="<fmt:formatNumber value='${productDetails.listPrice}' type="currency"/>" class="inputTransparent wide" readonly="readonly" ><br>
				<label for="productAvailability">Availability:</label>
				<input type="text" name="productAvailability" value="<c:out value='${productDetails.productAvail}'/>" class="inputTransparent reallyWide" readonly="readonly" ><br>
				<label for="productDescription">Description:</label>
				<div name="productDescription" class="inputTransparent wide" ><c:out value='${productDetails.productDescription}'/></div><br>
				<label for="producPhoto">Photo:</label>
				<input type="text" name="productAvailability" value="<c:out value='${productDetails.filename}'/>" class="inputTransparent wide" readonly="readonly" ><br><br>
				<a href="DisplayProducts"><button class="buttonFont" >Return to Products</button></a>
			 
		</div></div>  <!-- /.container -->
</body>
</html>
  </div><!-- /.container -->
</body>
</html>