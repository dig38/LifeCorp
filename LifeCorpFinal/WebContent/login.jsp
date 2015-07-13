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
	
	<!-- Local script for create account button -->
	<script type="text/javascript" src="scripts/checkPass.js" ></script>

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
          <a class="navbar-brand" href="Login.jsp">Log In</a>
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
	    
	    
	
			<h1>User Information</h1>
	<h4>Returning customers please log in below:</h4>
		<form action="Login" method="post">
			<input type="hidden" name="action" value="existingCustomer" />
			<fieldset>
			<legend>Returning Customers:</legend>
				<input type="hidden" name="action" value="existingUser" />
				<label for="email">Email:</label>
				<input type="email" name="email" maxlength="50" class="wide" required /><br>
				<label for="password">Password:</label>
				<input type="password" name="password" maxlength="50" class="wide" required /><br>
				<input type="text" name="message" value="${message1}" class="message inputTransparent" readonly="readonly" /><br><br>
				<input type="submit" value="Login" class="buttonFont" />
			</fieldset>
		</form>
		<form action="Login" method="post" id="getCustomer" ><br>
		<h4>New customers please create an account below.</h4><br>
			<input type="hidden" name="action" value="newCustomer" />
			<fieldset>
			<legend>New Customers:</legend>
				<input type="hidden" name="action" value="newUser" />
				<label for="firstName">First Name:</label>
				<input type="text" name="firstName" maxlength="50" class="wide" required /><br>
				<label for="lastName">Last Name:</label>
				<input type="text" name="lastName" maxlength="50" class="wide" required /><br>
				<label for="email">Email:</label>
				<input type="email" name="email" maxlength="50" class="wide" required /><br>
				<label for="phone">Phone:</label>
				<input type="text" name="phone" maxlength="50" class="wide" required /><br>
				
				<label for="password">Password:</label>
				<input type="password" name="password" id="pass1" maxlength="50" class="wide" required />
				<span id="confirmMessage"></span><br>
				<label for="passwordDup">Confirm:</label>
				<input type="password" name="passwordDup" id="pass2" maxlength="50" class="wide" required /><br>
				
<!-- 				<label for="creditCard">Credit Card</label> -->
<!-- 				<input type="text" name="creditCard" maxlength="20" class="wide" required  -->
<!-- 					pattern="^\d{4}-\d{4}-\d{4}-\d{4}$" /><br><br> -->
				<label for="shipToStreet">Ship to Address:</label>
				<input type="text" name="shipToStreet" maxlength="50" class="wide" required /><br>
				<label for="shipToCity">City:</label>
				<input type="text" name="shipToCity" maxlength="50" class="wide" required /><br>
				<label for="shipToState">State:</label>
				<input type="text" name="shipToState" maxlength="50" class="wide" required /><br>
				<label for="shipToZip">Zip Code:</label>
				<input type="text" name="shipToZip" maxlength="50" class="wide" required /><br><br>
<!-- 				<label for="billToStreet">Bill to Address:</label> -->
<!-- 				<input type="text" name="billToStreet" maxlength="50" class="wide" required /><br> -->
<!-- 				<label for="billToCity">City:</label> -->
<!-- 				<input type="text" name="billToCity" maxlength="50" class="wide" required /><br> -->
<!-- 				<label for="billToState">State:</label> -->
<!-- 				<input type="text" name="billToState" maxlength="50" class="wide" required /><br> -->
<!-- 				<label for="billToZip">Zip Code:</label> -->
<!-- 				<input type="text" name="billToZip" maxlength="50" class="wide" required /><br> -->
				<label for="message">&nbsp;</label>
				<input type="text" name="message" value="${message2}" class="message inputTransparent" readonly="readonly" /><br>
				
<!-- 				<input type="submit" value="Create Account" class="buttonFont" /> -->
<!-- 				input control below done with javaScript submit to test the password field match -->

				<input type="button" id="calculate" class="buttonFont" value="Create Account" />
			</fieldset>
		</form>
			
			
			
  </div></div>  <!-- /.container -->
</body>
</html>
  </div><!-- /.container -->
</body>
</html>