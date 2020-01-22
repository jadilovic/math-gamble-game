<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gamble Game</title>
</head>
<body>

    <jsp:include page="_menu.jsp"></jsp:include>
       
    <div align="center" >
    <h3>Gamble Game</h3>
    <p>Welcome to the Dog Race game.</p>
      
    <c:set var="selection" scope="session" value="${param.selection}"/>  
    <c:set var="winner" scope="session" value="${param.winner}"/>  
    
	<c:if test="${selection == null}">  
  			<%-- Putting up the form to get the user selection  --%>
  		<form action="${pageContext.request.contextPath}/gambleGame" method="post">
    		<p>Select who will win the race!</p>
    			Dog x1: <input type="submit" name="selection" value="Blue"/><br/>
   				Dog x2: <input type="submit" name="selection" value="Red"/><br/>
    			Dog x3: <input type="submit" name="selection" value="Yellow"/><br/>
    			Dog x4: <input type="submit" name="selection" value="Green"/><br/>
  		</form>
  		<a href="${pageContext.request.contextPath}src/main/webapp/WEB-INF/JNLPExample.jnlp">Start Dog Race</a>
	</c:if>   

	<c:if test="${selection != null && winner.equals(selection)}">  
     	<p>Congratulations!  You selected a winner: ${param.selection}</p>
     	<p>You scored 4 points</p>
  		${loginedUser.addFourPoints()}
	</c:if>  
      
	<c:if test="${selection != null && !winner.equals(selection)}">  
    	<p>You did not select a winner.</p>
    	<p>Winner is: <c:out value="${winner}"/></p>
    	<p>You selected: ${param.selection}</p>
    	<p>You lose 1 point</p>
    	${loginedUser.losePoints()}
	</c:if>  
       
    <c:if test="${selection != null}">  
    	<% request.setAttribute("selection", null); %>
  			<form action="${pageContext.request.contextPath}/gambleGame" method="get">
  				<input type="hidden" name="updatePoints" value="update" >
 				<input type="submit" value="Play Again" />
			</form>
	</c:if> 
       
    </div>
    
</body>
</html>