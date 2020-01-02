<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Math Menu</title>
</head>
<body>
	<div align="center" >
	<form action="${pageContext.request.contextPath}/mathGame" method="post">
		<input type="submit" name="Selection" value="Addition" />
 || 
 		<input type="submit" name="Selection" value="Subtraction" />
 ||
 		<input type="submit" name="Selection" value="Multiplication" />
 ||
 		<input type="submit" name="Selection" value="Division" />
	</form>
</div>

</body>
</html>