package bean;

public class UserAccount {

	   public static final String GENDER_MALE = "M";
	   public static final String GENDER_FEMALE = "F";
	 
	   private String userName;
	   private String gender;
	   private String password;
	   private String role;
	   private int points;
	 
	   public UserAccount() {
	 
	   }
	 
	   public UserAccount(String userName, String gender, String password, String role, int points) {
	      this.userName = userName;
	      this.password = password;
	      this.gender = gender;
	      this.role = role;
	      this.points = points;

	   }
	 
	   public String getUserName() {
	      return userName;
	   }
	 
	   public void setUserName(String userName) {
	      this.userName = userName;
	   }
	 
	   public String getGender() {
	      return gender;
	   }
	 
	   public void setGender(String gender) {
	      this.gender = gender;
	   }
	 
	   public String getPassword() {
	      return password;
	   }
	 
	   public void setPassword(String password) {
	      this.password = password;
	   }
	   
	   public String getRole() {
		return role;
	   }

	public void setRole(String role) {
		this.role = role;
	}

	public int getPoints() {
		return points;
	}

	public void setPoints(int points) {
		this.points = points;
	}
	
	public void addPoints() {
		this.points++;
	}
	
	public void addThreePoints() {
		this.points += 3;
	}
	
	public void losePoints() {
		this.points--;
	}
}
