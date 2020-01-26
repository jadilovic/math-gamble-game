<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Math Menu</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="HandheldFriendly" content="true">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
	<div align="center" >
	<form action="${pageContext.request.contextPath}/mathGame" method="post">
		<div class="p-1 bg-secondary text-white">
			<input class="btn btn-primary btn-lg" type="submit" name="Selection" value="Addition" />
 			|| 
 			<input class="btn btn-primary btn-lg" type="submit" name="Selection" value="Subtraction" />
		</div>
		<div class="p-1 bg-secondary text-white">
		 	<input class="btn btn-primary btn-lg" type="submit" name="Selection" value="Multiplication" />
 			||
 			<input class="btn btn-primary btn-lg" type="submit" name="Selection" value="Division" />
		</div>
	</form>
</div>

</body>
</html>