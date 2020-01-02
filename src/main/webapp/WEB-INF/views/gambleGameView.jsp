<%@page import="org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@page import = "bean.Race" %>
	<jsp:useBean id="raceDog" class="bean.Race" scope="session" />
	<jsp:useBean id="points" class="bean.UserAccount" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gamble Game</title>
</head>
<body>
	<jsp:setProperty name="raceDog" property="*"/>
      <jsp:include page="_menu.jsp"></jsp:include>
       
      <h3>Gamble Game</h3>
      <p>Welcome to the Number Guess game.</p>
      
    <c:set var="selection" scope="session" value="${param.selection}"/>  
    <c:set var="winner" scope="session" value="${param.winner}"/>  
    
	<c:if test="${selection == null}">  
  			<%-- Putting up the form to get the user selection  --%>
  		<form action="${pageContext.request.contextPath}/gambleGame" method="post">
    		<p>Select who will win the race!</p>
    			First Dog x1: <input type="radio" name="selection" value="first"/><br/>
   				Second Dog x2: <input type="radio" name="selection" value="second"/><br/>
    			Third Dog x3: <input type="radio" name="selection" value="third"/><br/>
    			Fourth Dog x4: <input type="radio" name="selection" value="fourth"/><br/>
    		<input type="submit" value="Submit"/>
  		</form>
		</c:if>   

	<c:if test="${selection != null && winner.equals(selection)}">  
     	<p>Congratulations!  You selected a winner: ${param.selection}</p>
     	<p>You score 4 points</p>
  		${loginedUser.addFourPoints()}
		<% request.setAttribute("selection", null); %>
  		<p><a href="${pageContext.request.contextPath}/gambleGame">Play again</a></p>
	</c:if>  
      
	<c:if test="${selection != null && !winner.equals(selection)}">  
    	<p>You did not select a winner.</p>
    	<p>Winner is: <c:out value="${winner}"/></p>
    	<p>You selected: ${param.selection}</p>
    	<p>You lose 1 point</p>
    	${loginedUser.losePoints()}
    <% request.setAttribute("selection", null); %>
  <p><a href="${pageContext.request.contextPath}/gambleGame">Try again</a></p>
</c:if>  

</body>
</html>