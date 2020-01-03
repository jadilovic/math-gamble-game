<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Info</title>
</head>
<body>
     <jsp:include page="_menu.jsp"></jsp:include>
 
 <div align="center">
      <h3>Hello: ${loginedUser.userName}, welcome to Math Gamble Game</h3>
 
      User Name: <b>${loginedUser.userName}</b><br />
      Gender: <b>${loginedUser.gender } </b><br />
      Points: <b>${loginedUser.points } </b><br />
 </div>

 
</body>
</html>