<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<jsp:useBean id="subtract" class="bean.NumberSubtract" scope="session" />
			<jsp:useBean id="points" class="bean.UserAccount" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Subtraction Game</title>
	    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="HandheldFriendly" content="true">
</head>
<body style="background-color:powderblue;">
	<jsp:setProperty name="subtract" property="*"/>
    <jsp:include page="_menuLoged.jsp"></jsp:include>
       
       
    <div align="center" >
        <div class="p-2 bg-warning text-dark">
         	 <h4>Subtraction Game</h4>
        </div> 
        
    <c:if test="${subtract.getNumGuesses() != 0 && !subtract.isSuccess()}">
        <div class="p-2 bg-danger text-dark">
        	<p>Wrong guess, try again. Try <strong><%= subtract.getHint() %></strong>. You have made <%= subtract.getNumGuesses() %> guesses.</p>
		</div>
	</c:if>
	
    <c:if test="${!subtract.isSuccess()}">
      <div class="p-2 bg-success text-dark">
  		<p><h5>How much is <%= subtract.getNum1() %> - <%= subtract.getNum2() %> ?</h5><p>
  		  </div>
				<form action="${pageContext.request.contextPath}/mathGame" method="post">
					<input type="hidden" name="Selection" value="Subtraction" />
					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${subtract.getAnswer0()}" />
 					|| 
 					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${subtract.getAnswer1()}" />
 					||
 					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${subtract.getAnswer2()}" />
 					||
 					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${subtract.getAnswer3()}" />
 					||
 					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${subtract.getAnswer4()}" />
				</form>
        </c:if>
        
        <c:if test="${subtract.isSuccess()}">
        	<div class="p-2 bg-info text-dark">
        		<p><h4>Congratulations!  You got it, after <%= subtract.getNumGuesses() %> tries.</h4></p>
  				<% subtract.reset(); %>
  				${loginedUser.addPoints()}
  			<form action="${pageContext.request.contextPath}/mathGame" method="post">
				<input type="hidden" name="Selection" value="Subtraction" />
				<input type="hidden" name="guess" value="" />
 				<input class="btn btn-success" type="submit" value="Try Again" />
			</form>
			</div>
        </c:if>
			<div class="p-2 bg-info text-dark">
				<h5>OR</h5>
				<p>Select other math game to play</p>
			</div>
       </div>
    <jsp:include page="_menuMath.jsp"></jsp:include>
</body>
</html>