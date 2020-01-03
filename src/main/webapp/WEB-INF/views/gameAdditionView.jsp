<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       
       
    <div align="center" >
        <h3>Addition Game</h3>

		<c:if test="${numguess.getNumGuesses() != 0 && !numguess.isSuccess()}">
			   <p>Wrong guess, try again. Try <strong><%= numguess.getHint() %></strong>.</p>
    			<p>You have made <%= numguess.getNumGuesses() %> guesses.</p>
		</c:if>
        
        <c:if test="${!numguess.isSuccess()}">
        	  <%-- Putting up the form to get the user guess  --%>
  			<p>How much is <%= numguess.getNum1() %> + <%= numguess.getNum2() %> ?<p>
				<form action="${pageContext.request.contextPath}/mathGame" method="post">
					<input type="hidden" name="Selection" value="Addition" />
					<input type="submit" name="guess" value="${numguess.getAnswer0()}" />
 					|| 
 					<input type="submit" name="guess" value="${numguess.getAnswer1()}" />
 					||
 					<input type="submit" name="guess" value="${numguess.getAnswer2()}" />
 					||
 					<input type="submit" name="guess" value="${numguess.getAnswer3()}" />
 					||
 					<input type="submit" name="guess" value="${numguess.getAnswer4()}" />
				</form>
        </c:if>
        
        <c:if test="${numguess.isSuccess()}">
        	<p>Congratulations!  You got it, after <%= numguess.getNumGuesses() %> tries.</p>
  				<% numguess.reset(); %>
  				${loginedUser.addPoints()}
  			<form action="${pageContext.request.contextPath}/mathGame" method="post">
				<input type="hidden" name="Selection" value="Addition" />
				<input type="hidden" name="guess" value="" />
 				<input type="submit" value="Try Again" />
			</form>
        </c:if>

		<p>OR</p>
		<p>Select other math game to play</p>
       </div>
    <jsp:include page="_menuMath.jsp"></jsp:include>
</body>
</html>