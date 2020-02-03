<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
	    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="HandheldFriendly" content="true">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 <style> 
            .gfg { 
                border-collapse:separate; 
                border-spacing:0 15px; 
            } 
        </style> 
</head>
<body style="background-color:powderblue;">
 
<jsp:include page="_menu.jsp"></jsp:include>   
 	<div align="center">

          <div class="p-3 bg-success text-dark">
         	 <h3>Login Page</h3>
         </div> 
      	<p style="color: red;"><b>${errorMessage}</b></p>
 
      <form method="POST" action="${pageContext.request.contextPath}/login">
         <input type="hidden" name="redirectId" value="${param.redirectId}" />
         <table class="gfg" border="0">
            <tr>
               <td>User Name</td>
               <td><input type="text" name="userName" value= "${user.userName}" /> </td>
            </tr>
            <tr>
               <td>Password</td>
               <td><input type="password" name="password" value= "${user.password}" /> </td>
            </tr>
          
            <tr align="center" >
               <td colspan ="2">
                  <input class="btn btn-success" type="submit" value= "Submit" />
                  <a class="btn btn-danger" href="${pageContext.request.contextPath}/">Cancel</a>
               </td>
            </tr>
         </table>
      </form>
 	<div class="p-3 mb-2 bg-warning" >
 		<p style="color:blue;">To log in as a guest use User Name: "guest" and Password: "12345678":</p>
 	</div>
      
 </div>
     
</body>
</html>