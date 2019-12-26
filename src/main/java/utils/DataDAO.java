package utils;

import java.util.HashMap;
import java.util.Map;

import bean.UserAccount;

import config.SecurityConfig;

public class DataDAO {

	private static final Map<String, UserAccount> mapUsers = new HashMap<String, UserAccount>();
	 
	   static {
	      initUsers();
	   }
	 
	   private static void initUsers() {
	 
	      // This user has a role as GUEST.
	      UserAccount guest = new UserAccount("guest", "123", UserAccount.GENDER_MALE, SecurityConfig.ROLE_GUEST_USER, 0);
	 
	      // This user has a role as REGISTERED USER.
	      UserAccount registered = new UserAccount("registered", "123", UserAccount.GENDER_MALE, //
	            SecurityConfig.ROLE_REGISTERED_USER, 0);
	 
	      mapUsers.put(guest.getUserName(), guest);
	      mapUsers.put(registered.getUserName(), registered);
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
