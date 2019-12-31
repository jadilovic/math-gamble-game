<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gamble Game</title>
</head>
<body>
      <jsp:include page="_menu.jsp"></jsp:include>
       
      <h3>Gamble Game</h3>
       
      Hello, This is a Gamble Game protected page!
<div align="center">
        <jsp:plugin
            type="applet"
            code="applets.MyApplet.class"
            codebase="appletCode"
            align="">
             
            <jsp:params>
                <jsp:param name="firstName" value="James" />
                <jsp:param name="lastName" value="Bond" />
            </jsp:params>
             
            <jsp:fallback>
                <p>Could not load applet!</p>
            </jsp:fallback>
             
        </jsp:plugin>
    </div>
</body>
</html>