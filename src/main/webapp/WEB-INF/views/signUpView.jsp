<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>
</head>
<body>
 
      <jsp:include page="_menu.jsp"></jsp:include>   
 
      <h3>Sign Up Page</h3>
 
      <p style="color: red;">${errorString}</p>
      
      	<c:if test="${param.message != null}">
	<div style="background-color:red" >
			<p><%= request.getAttribute("message") %></p>
	</div>
	</c:if>
 
      <form method="POST" action="${pageContext.request.contextPath}/signUp">
         <input type="hidden" name="redirectId" value="${param.redirectId}" />
         <input type="hidden" name="message" value="" />
         <table border="0">
            <tr>
               <td>Create User Name</td>
               <td><input type="text" name="userName" value= "${user.userName}" /> </td>
            </tr>
            <tr>
               <td>Create Password</td>
               <td><input type="password" name="password" value= "${user.password}" /> </td>
            </tr>
            <tr>
               <td>Select Gender</td>
               <td>
                 <select name="gender">
    				<option value="M">M</option>
    				<option value="F">F</option>
  				</select>
                </td>
            </tr>
            <tr>
               <td colspan ="2">
                  <input type="submit" value= "Submit" />
                  <a href="${pageContext.request.contextPath}/">Cancel</a>
               </td>
            </tr>
         </table>
      </form>
 
      <p style="color:blue;">To log in as a guest use User Name: "guest" and Password: "12345678":</p>
       <a href="${pageContext.request.contextPath}/login">Login</a>
      
</body>
</html>