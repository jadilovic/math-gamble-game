<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Math Game</title>
</head>
<body>
    
      <jsp:include page="_menu.jsp"></jsp:include>
       
      <h3>Math Game</h3>
      
      <style>
          .error{ color: red; }
          .success { color: greenyellow; }
      </style>
    <%
        for(int i = 1; i<=10; i++){ %>
        <h5><%= +i%></h5>
    <% } %>
    <h1>Number Guess System</h1>
    <p>Guess Number within 1 and 10</p>

    <%
        final HttpSession       Sess = request.getSession();
        final boolean           JustStarted = Sess.isNew();
        final Integer           randomNumber;

        if(JustStarted){
                randomNumber = new Integer(new java.util.Random().nextInt(10));
                System.out.println("Random Number : " + randomNumber);
                Sess.setAttribute("number", randomNumber);
            } else {
                randomNumber = (Integer) Sess.getAttribute("number");
            }
    %>

    <%
        String inputText = request.getParameter("number");
        String errorMsg = null;
        boolean success = false;

        if(!JustStarted) {
            if (inputText != null && inputText.length() > 0) {
                int myNumber = Integer.parseInt(inputText);
                if (randomNumber != myNumber) {
                    if (myNumber > randomNumber)
                        errorMsg = "Number too large!";
                    else
                        errorMsg = "Number too Low!";
                } else {
                    errorMsg = "Congrats! you win";
                    success = true;
                }
            }
        }
    %>

    <div>
        <% if(errorMsg != null){ %>
            <p class="<% if(success){ %>
                        success
                       <% }else{ %>
                        error
                        <% } %>
                      ">
                <%= errorMsg %>
            </p>
        <% } %>
        <form method="post">
            <label for="number">Enter the Number : </label> <input type="tex" name="number" id="number" maxlength="3">
            <input type="submit" value="Submit">
        </form>
    </div>
  </body>
</html>
</body>
</html>