package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.UserAccount;

public class UserManager {

	// connect to the database
	private static Connection connection;
	
	// message from the database
	private static String message;
	
	public UserManager(Connection conn) {
		connection = conn;
	}
	
		public static List<UserAccount> getAllUsers() throws SQLException {
			// create list of all UserAccount objects
			List<UserAccount> listOfUsers = new ArrayList<UserAccount>();
			// create an SELECT SQL query
			String query = "SELECT * FROM users";
			// create a new ResultSet
			ResultSet rs = null;
			
			Statement statement = connection.createStatement();
				// execute the query
				rs = statement.executeQuery(query);
				// add users to the arrayList
				while (rs.next()) {
					listOfUsers.add(new UserAccount(rs.getString("userName"), rs.getString("gender"), 
					rs.getString("password"), rs.getString("role"), rs.getInt("points")));
				}
		
			if(listOfUsers.size() > 0)
				message = "List of users";
			else
				message = "No users in the database";
			return listOfUsers;
		}

		public UserAccount getUser(String userName) throws SQLException {
			// new user object
			UserAccount user = null;
			// create an SELECT SQL query
			String query = "SELECT * FROM users WHERE userName = ?";
			// create a new ResultSet
			ResultSet rs = null;
			
				PreparedStatement pstatement = connection.prepareStatement(query);
				// fill in the placeholders/parameters
				pstatement.setString(1, userName);
				// execute the query
				rs = pstatement.executeQuery();
				// set the cursor
				if (rs.next()) {
					// populate user account
					user = new UserAccount(rs.getString("userName"), rs.getString("gender"), 
							rs.getString("password"), rs.getString("role"), rs.getInt("points"));
					// close the ResultSet
					rs.close();
				}
				return user;
			}

		
		public boolean createUser(String userName, String gender, String password, String role, int points) throws SQLException {
			System.out.println("Add user");
			// create an SELECT SQL query
			String query = "INSERT INTO users (userName, gender, password, role, points) VALUES (?, ?, ?, ?, ?)";
			
			// checking validity of the name given and if it already exists
			if(validUserName(userName) && !userExists(userName)){
				// checking validity of password
				if(validPassword(password)) {
					
					PreparedStatement statement = connection.prepareStatement(query);
					
					// fill in the placeholders/parameters
					statement.setString(1, userName);
					statement.setString(2, gender);
					statement.setString(3, password);
					statement.setString(4, role);
					statement.setInt(5, points);
					// execute the query
					statement.executeUpdate();
					message = "User " + userName + " added to the database.";	
					return true;
				}
			}
			return false;
		}
		

		// method to check valid password
		private boolean validPassword(String password) {
            if (password.length() > 15 || password.length() < 8)
            {
                    message = "Password should be less than 15 and more than 8 characters in length.";
                    return false;
            }
            
            String upperCaseChars = "(.*[A-Z].*)";
            if (!password.matches(upperCaseChars ))
            {
                    message = "Password should contain atleast one upper case alphabet";
                    return false;
            }
            
            String lowerCaseChars = "(.*[a-z].*)";
            if (!password.matches(lowerCaseChars ))
            {
                    message = "Password should contain atleast one lower case alphabet";
                    return false;
            }
            
            String numbers = "(.*[0-9].*)";
            if (!password.matches(numbers))
            {
                    message = "Password should contain atleast one number.";
                    return false;
            }
			return true;
		}

		// method to check length of the name and if it contains only alphabets
		private boolean validUserName(String userName) throws SQLException {
			if(userName.length() <  5 || userName.length() > 10){
				message = "Username should be less than 11 and more than 4 characters in length.";
				return false;
			}
			else if(!onlyAlphabets(userName)){
				message = "Entered user name does not contain all alphabets. Please try again.";
				return false;
			} else 
			return true;
		}

		// method checking if airport already exists
		private boolean userExists(String userName) throws SQLException {
				if(getUser(userName) != null){
					message = "Entered user name already exists. Please try again.";
					return true;
				}
			return false;
		}

		
		// Checking if given name is all alphabets
		private static boolean onlyAlphabets(String name) {
	        return ((name != null) 
	                && (!name.equals("")) 
	                && (name.matches("^[a-zA-Z]*$")));
		}

		public void udatePoints(UserAccount user) throws SQLException {
			// create an SELECT SQL query
			String query = "UPDATE users SET points = ? WHERE userName = ?";
				PreparedStatement statement = connection.prepareStatement(query);
				// fill in the placeholders/parameters
				statement.setInt(1, user.getPoints());
				statement.setString(2, user.getUserName());
				// execute the query
				statement.executeUpdate();
		}
		
		// return message
		public String getMessage() {
			return message;
		}
}
