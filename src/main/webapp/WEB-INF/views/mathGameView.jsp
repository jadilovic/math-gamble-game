<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ page import="java.util.ArrayList" %>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  			<%@page import = "bean.NumberGuess" %>
			<jsp:useBean id="numguess" class="bean.NumberGuess" scope="session" />
			<jsp:useBean id="points" class="bean.UserAccount" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Math Game</title>
</head>
<body>
	<jsp:setProperty name="numguess" property="*"/>
      <jsp:include page="_menu.jsp"></jsp:include>
       
      <h3>Math Game</h3>

<%
if (numguess.isSuccess()) {    // correct guess - updated by setGuess() bound earlier
%>
  <p>Congratulations!  You got it, after <%= numguess.getNumGuesses() %> tries.</p>
  <% numguess.reset(); %>
  ${loginedUser.addPoints()}
	<% request.setAttribute("guess", null); %>
  <p><a href="${pageContext.request.contextPath}/mathGame">try again</a></p>
<%
} else {
  if (numguess.getNumGuesses() == 0 ) {   // start a game
%>
    <p>Welcome to the Number Guess game.</p>
<%
  } else {   // in a game, wrong guess
%>
    <p>Good guess, but nope. Try <strong><%= numguess.getHint() %></strong>.</p>
    <p>You have made <%= numguess.getNumGuesses() %> guesses.</p>
<%
  }
%>    
  <%-- Putting up the form to get the user guess  --%>
  <p>How much is <%= numguess.getNum1() %> + <%= numguess.getNum2() %> ?<p>
  <form method="get">
    <p>What's your guess? <input type="text" name="guess" value="">
    <input type="submit" value="Submit">
  </form>
<%
}
%>
</body>
</html>