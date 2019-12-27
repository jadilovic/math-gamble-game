package conn;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
  
public class MySQLConnUtils {
  
 public static Connection getMySQLConnection()
         throws ClassNotFoundException, SQLException {
     // Note: Connection parameters for ClearDB (MySQL) on Heroku.
     String hostName = "us-cdbr-iron-east-05.cleardb.net";
     String dbName = "heroku_061def86f42a458";
     String userName = "bc4270a704c773";
     String password = "d252df78";
     return getMySQLConnection(hostName, dbName, userName, password);
 }
  
 public static Connection getMySQLConnection(String hostName, String dbName,
         String userName, String password) throws SQLException,
         ClassNotFoundException {
    
     Class.forName("com.mysql.jdbc.Driver");
  
     // URL Connection for MySQL:
     // Example: 
     // jdbc:mysql://localhost:3306/simplehr
     String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
  
     Connection conn = DriverManager.getConnection(connectionURL, userName,
             password);
     return conn;
 }
}

