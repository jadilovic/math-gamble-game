<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body style="background-color:powderblue;">
<div align="center" class="container">
<h2>Welcome to MathGame Web Application</h2>
<h4><a type="button" class="btn btn-warning" href="/home">Click Here Home Page</a></h4>
<h4><a type="button" class="btn btn-success" href="/JNLPExample.jnlp">JNLP</a></h4>
<p>Current Time: <%= java.util.Calendar.getInstance().getTime() %> </p>

</div>

</body>
</html>
