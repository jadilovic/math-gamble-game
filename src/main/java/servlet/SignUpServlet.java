package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import config.SecurityConfig;
import utils.MyUtils;
import utils.UserManager;

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public SignUpServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/signUpView.jsp");
 
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String message = "";
       System.out.println("TEST");
        Connection conn = MyUtils.getStoredConnection(request);
        UserManager newUser = new UserManager(conn);
        boolean userCreated;
        
		try {
			userCreated = newUser.createUser(userName, gender, password, SecurityConfig.ROLE_REGISTERED_USER, 0);
			 
	        if (userCreated) {
	            message = newUser.getMessage();
	            request.setAttribute("message", message);
	            RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
        dispatcher.forward(request, response);
	        } else {
	            message = newUser.getMessage();
	            request.setAttribute("message", message);
	            RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/signUpView.jsp");
	    dispatcher.forward(request, response);
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

 
    }
}
