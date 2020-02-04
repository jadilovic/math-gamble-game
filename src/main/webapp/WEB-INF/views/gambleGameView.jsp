<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gamble Game</title>
	    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="HandheldFriendly" content="true">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/326e4a206d.js" crossorigin="anonymous"></script>
</head>
<body style="background-color:powderblue;">

    <jsp:include page="_menuLoged.jsp"></jsp:include>
       
    <div align="center" >
    	<div class="p-2 bg-warning text-dark">
    		<h4>Gamble Game</h4>
    	</div>

    <c:set var="selection" scope="session" value="${param.selection}"/>  
    <c:set var="winner" scope="session" value="${param.winner}"/>
    <c:set var="dogs" scope="session" value="${param.dogs}" />  

	<c:if test="${selection == null}">  
  			<%-- Putting up the form to get the user selection  --%>
  		<form action="${pageContext.request.contextPath}/gambleGame" method="post">
  			<div class="p-2 bg-success text-dark">
    			<h5>Click to Pick the Winning Dog in the Race!</h5>
    		</div>
    			<i class="fas fa-dog fa-2x"></i>
    			<input class="btn btn-secondary font-weight-bold" type="submit" name="selection" value="Akitas"/><br/>
    			<i class="fas fa-dog fa-2x"></i>
   				<input class="btn btn-secondary font-weight-bold" type="submit" name="selection" value="Bulterrier"/><br/>
   				<i class="fas fa-dog fa-2x"></i>
    			<input class="btn btn-secondary font-weight-bold" type="submit" name="selection" value="Corgi"/><br/>
    			<i class="fas fa-dog fa-2x"></i>
    			<input class="btn btn-secondary font-weight-bold" type="submit" name="selection" value="Husky"/><br/>
  		</form>
	</c:if>   

	<c:if test="${selection != null && winner.equals(selection)}">  
		 <div class="p-2 bg-info text-white">
     		<p><h5>Congratulations!  You selected a winner: <strong>${param.selection}</strong>. You scored 3 points.</h5></p>
     		<table class="table table-sm table-dark">
        		<tr>
        			<th>Place</th>
          			<th>Dog</th>
          			<th>Speed</th>
        		</tr>
        	<c:forEach  items="${dogs}" var ="dog">
        		<c:set var="num" value="${num + 1}" scope="page"/>
        		<tr>
        			<td>${num}</td>
          			<td>${dog.getName()}</td>
          			<td>${dog.getNum()}</td>
       		 	</tr>
        	</c:forEach>
      </table>
    </div>
  		${loginedUser.addThreePoints()}
	</c:if>  
      
	<c:if test="${selection != null && !winner.equals(selection)}">
		<div class="p-1 bg-danger text-white">  
    		<p>You did not select a winner. You selected:<strong> ${param.selection}</strong></p>
    	<p>Winner is: <strong><c:out value="${winner}"/></strong>. You lose 1 point</p>
    	
    	<table class="table table-sm table-dark">
        		<tr>
        		    <th>Place</th>
          			<th>Dog</th>
          			<th>Speed</th>
        		</tr>
        	<c:forEach  items="${dogs}" var ="dog">
        		<c:set var="num" value="${num + 1}" scope="page"/>
        		<tr>
        			<td>${num}</td>
          			<td>${dog.getName()}</td>
          			<td>${dog.getNum()}</td>
       		 	</tr>
        	</c:forEach>
      </table>
   	</div>
    	${loginedUser.losePoints()}
	</c:if>  
       
    <c:if test="${selection != null}">  
    	<% request.setAttribute("selection", null); %>
  			<form action="${pageContext.request.contextPath}/gambleGame" method="get">
  				<input type="hidden" name="updatePoints" value="update" >
 				<input class="btn btn-primary font-weight-bold" type="submit" value="Play Again" />
			</form>
	</c:if> 
       
    </div>
    
</body>
</html>