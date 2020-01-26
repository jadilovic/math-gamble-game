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

import bean.UserAccount;
import utils.AppUtils;
import utils.DataDAO;
import utils.MyUtils;
import utils.UserManager;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public LoginServlet() {
        super();
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
 
        dispatcher.forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String errorMessage = "";
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        if(userName.equals("") || password.equals("")) {
    		errorMessage = "Please enter user name and password.";
            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
            dispatcher.forward(request, response);
            return;
        }
        Connection conn = MyUtils.getStoredConnection(request);
        UserManager loginUser = new UserManager(conn);
        UserAccount user = null;
        try {
			user = loginUser.getUser(userName);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
        //System.out.println("User password: " + user.getPassword());
        
        if(user != null) {
            if(user.getPassword().equals(password)) {
                AppUtils.storeLoginedUser(request.getSession(), user);
                    // Default after successful login
                    // redirect to /userInfo page
                    response.sendRedirect(request.getContextPath() + "/userInfo");
                    return;
                }
        		errorMessage = "Invalid password";
            }
        else {
        		errorMessage = "Invalid userName";
        }

            request.setAttribute("errorMessage", errorMessage);
            RequestDispatcher dispatcher //
                    = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
            dispatcher.forward(request, response);
            return;
        }
    }

