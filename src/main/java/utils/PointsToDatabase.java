package utils;

import java.sql.Connection;
import java.sql.SQLException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserAccount;
import utils.AppUtils;
import utils.MyUtils;
import utils.UserManager;

public class PointsToDatabase {

	private HttpServletRequest request;
	
	
	public PointsToDatabase(HttpServletRequest request2) {
		this.request = (HttpServletRequest) request2;
		toDatabase();
	}
	

	public void toDatabase() {
		Connection conn = MyUtils.getStoredConnection(request);
	    UserManager loginUser = new UserManager(conn);
	  
	    UserAccount user = AppUtils.getLoginedUser(request.getSession());{
	    	if(user != null) {
	    		try {
	    			loginUser.udatePoints(user);
	    		} catch (SQLException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	    	}
	    }
	}
}