<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<jsp:useBean id="subtract" class="bean.NumberSubtract" scope="session" />
			<jsp:useBean id="points" class="bean.UserAccount" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Math Game</title>
</head>
<body>
	<jsp:setProperty name="subtract" property="*"/>
    <jsp:include page="_menu.jsp"></jsp:include>
       
       
    <div align="center" >
        <h3>Subtraction Game</h3>

		<c:if test="${subtract.getNumGuesses() != 0 && !subtract.isSuccess()}">
			   <p>Wrong guess, try again. Try <strong><%= subtract.getHint() %></strong>.</p>
    			<p>You have made <%= subtract.getNumGuesses() %> guesses.</p>
		</c:if>
        
        <c:if test="${!subtract.isSuccess()}">
        	  <%-- Putting up the form to get the user guess  --%>
  			<p>How much is <%= subtract.getNum1() %> - <%= subtract.getNum2() %> ?<p>
				<form action="${pageContext.request.contextPath}/mathGame" method="post">
					<input type="hidden" name="Selection" value="Subtraction" />
					<input type="submit" name="guess" value="${subtract.getAnswer0()}" />
 					|| 
 					<input type="submit" name="guess" value="${subtract.getAnswer1()}" />
 					||
 					<input type="submit" name="guess" value="${subtract.getAnswer2()}" />
 					||
 					<input type="submit" name="guess" value="${subtract.getAnswer3()}" />
 					||
 					<input type="submit" name="guess" value="${subtract.getAnswer4()}" />
				</form>
        </c:if>
        
        <c:if test="${subtract.isSuccess()}">
        	<p>Congratulations!  You got it, after <%= subtract.getNumGuesses() %> tries.</p>
  				<% subtract.reset(); %>
  				${loginedUser.addPoints()}
  			<form action="${pageContext.request.contextPath}/mathGame" method="post">
				<input type="hidden" name="Selection" value="Subtraction" />
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