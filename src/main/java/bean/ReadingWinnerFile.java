package bean;
// Java Program to illustrate reading from Text File 
// using Scanner Class 
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner; 
public class ReadingWinnerFile { 
	
  public static void main(String[] args) throws Exception { 
	 System.out.println(getWinner());

  }

  private static String getWinner() {
	  // pass the path to the file as a parameter 
	  File file = new File("D:\\WebProjects\\devcenter-embedded-tomcat\\winner.txt"); 
	  Scanner sc = null;
	  try {
		  sc = new Scanner(file);
	} catch (FileNotFoundException e) {
		System.out.println("File not found");
		e.printStackTrace();
	}
    return sc.nextLine();
} 
}