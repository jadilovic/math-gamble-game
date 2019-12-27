package utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import bean.UserAccount;

public class DataDAO {
	
	// connect to the database
	private static Connection connection;
	
	public DataDAO(Connection conn) {
		connection = conn;
	}

	private static final Map<String, UserAccount> mapUsers = new HashMap<String, UserAccount>();
	 
	   public void initUsers() throws SQLException {

		   UserAccount user = null;
			// create an SELECT SQL query
			String query = "SELECT * FROM users";
			// create a new ResultSet
			ResultSet rs = null;
			
			Statement statement = connection.createStatement();
				// execute the query
				rs = statement.executeQuery(query);
				// add users to the arrayList
				while (rs.next()) {
					user = new UserAccount(rs.getString("userName"), rs.getString("gender"), 
					rs.getString("password"), rs.getString("role"), rs.getInt("points"));
					
					mapUsers.put(user.getUserName(), user);
				}
	   }
	 
	   // Find a User by userName and password.
	   public static UserAccount findUser(String userName, String password) {
	      UserAccount u = mapUsers.get(userName);
	      if (u != null && u.getPassword().equals(password)) {
	         return u;
	      }
	      return null;
	   }
	 
}
