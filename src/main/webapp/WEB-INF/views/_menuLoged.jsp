<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
</head>
<body>

<div align="center">
	<div class="p-1 bg-dark text-white">
		<a  class="btn btn-primary" href="${pageContext.request.contextPath}/mathGame" role="button">
  			Math Game
		</a>
		||
		<a class="btn btn-primary" href="${pageContext.request.contextPath}/gambleGame" role="button">
  			Gamble Game
		</a>
	</div>
	
	<div class="p-1 bg-dark text-white">
		<a class="btn btn-secondary" href="${pageContext.request.contextPath}/logout" role="button">
  		Logout
		</a>
 		||
		<button type="button" class="btn btn-danger">
  			User: <span class="badge badge-light">[${loginedUser.userName}]</span>
		</button>
		||
		<button type="button" class="btn btn-danger">
  			Points: <span class="badge badge-light">[${loginedUser.points}]</span>
		</button>
	</div>
</div>

</body>
</html>