<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="HandheldFriendly" content="true">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body style="background-color:powderblue;">

	<div align="center" class="container">
		<h2>Welcome to MathGame Web Application</h2>
		<h3><a type="button" class="btn btn-warning" href="/home"><b>Click Here To Play</b></a></h3>
		<p>Game Time: <%= java.util.Calendar.getInstance().getTime() %> </p>
	</div>

</body>
</html>
