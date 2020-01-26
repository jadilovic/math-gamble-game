<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ page import="java.util.ArrayList" %>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Math Game</title>
	    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="HandheldFriendly" content="true">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color:powderblue;">

    <jsp:include page="_menuLoged.jsp"></jsp:include>

    <div align="center" >
        <div class="p-3 bg-warning text-dark">
         	 <h3>Math Game</h3>
         </div> 
         <div class="p-3 bg-success text-dark">
         	 <h3>Select Math Game to Play</h3>
         </div> 
	</div>
	
    <jsp:include page="_menuMath.jsp"></jsp:include>
       
</body>
</html>