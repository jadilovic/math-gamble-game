<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ page import="java.util.ArrayList" %>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Math Game</title>
</head>
<body>

    <jsp:include page="_menu.jsp"></jsp:include>

    <div align="center" >
        <h3>Math Game</h3>
		<h4>Select Math Game to Play</h4>
	</div>
	
    <jsp:include page="_menuMath.jsp"></jsp:include>
       
</body>
</html>