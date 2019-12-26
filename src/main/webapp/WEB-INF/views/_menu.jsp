<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/guestTask">
  Guest Task
</a>
||
<a href="${pageContext.request.contextPath}/registeredTask">
  Registered User Task
</a>
||
<a href="${pageContext.request.contextPath}/userInfo">
  User Info
</a>       
||
<a href="${pageContext.request.contextPath}/login">
  Login
</a>
||
<a href="${pageContext.request.contextPath}/signUp">
  Sign up
</a>
||
<a href="${pageContext.request.contextPath}/logout">
  Logout
</a>
 
&nbsp;
<span style="color:red">[ ${loginedUser.userName} ]</span>
</body>
</html>