<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<jsp:useBean id="numguess" class="bean.NumberDivision" scope="session" />
			<jsp:useBean id="points" class="bean.UserAccount" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Division Game</title>
	    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="HandheldFriendly" content="true">
</head>
<body style="background-color:powderblue;">
	<jsp:setProperty name="numguess" property="*"/>
    <jsp:include page="_menuLoged.jsp"></jsp:include>
       
       
    <div align="center" >
        <div class="p-2 bg-warning text-dark">
         	 <h4>Division Game</h4>
        </div> 
        
			<c:if test="${numguess.getNumGuesses() != 0 && !numguess.isSuccess()}">
				<div class="p-2 bg-danger text-dark">
			   		<p>Wrong guess, try again. Try <strong><%= numguess.getHint() %></strong>. You have made <%= numguess.getNumGuesses() %> guesses.</p>
    			</div>
			</c:if>
		
		
        <c:if test="${!numguess.isSuccess()}">
        	  <%-- Putting up the form to get the user guess  --%>
        	  <div class="p-2 bg-success text-dark">
        	  	  <p><h5>How much is <%= numguess.getNum1() %> / <%= numguess.getNum2() %> ?</h5><p>
        	  </div>
				<form action="${pageContext.request.contextPath}/mathGame" method="post">
					<input type="hidden" name="Selection" value="Division" />
					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${numguess.getAnswer0()}" />
 					|| 
 					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${numguess.getAnswer1()}" />
 					||
 					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${numguess.getAnswer2()}" />
 					||
 					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${numguess.getAnswer3()}" />
 					||
 					<input class="btn btn-primary font-weight-bold" type="submit" name="guess" value="${numguess.getAnswer4()}" />
				</form>
        </c:if>
        
        <c:if test="${numguess.isSuccess()}">
        	<div class="p-2 bg-info text-dark">
        	    <p><h4>Congratulations!  You got it, after <%= numguess.getNumGuesses() %> tries.</h4></p>
  				<% numguess.reset(); %>
  				${loginedUser.addPoints()}
  			<form action="${pageContext.request.contextPath}/mathGame" method="post">
				<input type="hidden" name="Selection" value="Division" />
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