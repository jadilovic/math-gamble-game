package bean;

import java.util.Random;  // For generating random number
import java.util.concurrent.ThreadLocalRandom;
import java.awt.geom.Rectangle2D;
import java.io.Serializable;
  
// NumberGuessBean, with session scope, for storing game data.
public class NumberDivision implements Serializable {

	private static final long serialVersionUID = 1L;
	
private int num1; // random number 1
   private int num2; // random number 2
	private int answer;       // result of adding two random numbers
	private int[] answers = new int[5]; // array of answers
   private boolean success;  // got the answer?
   private String hint;      // hinting messages, e.g., "higher", "lower"
   private int numGuesses;   // number of guesses made so far, init to 0
   private Random random;    // random number generator
  
   // Constructor
   public NumberDivision() {
      random = new Random(); // Init the random number generator
      reset();
   }
  
   // Reset the game
   public void reset() {
      // Generate a random int from 1 to 20, uniformly distributed.
	   num2 = randomGenerator2();
	   num1 = randomGenerator1(num2);
      answer = num1 / num2;
      answers[0] = answer;
      answers[1] = answer + 2;
      answers[2] = answer - 2;
      answers[3] = answer + 1;
      answers[4] = answer - 1; 
      shuffleArray(answers);
      success = false;
      numGuesses = 0;
   }
   

   	private int randomGenerator2() {
	   int ran1 = (random.nextInt(30) + 1);
	   return ran1;
   	}
  
   private int randomGenerator1(int ran2) {
	  int ran1;
	   do {
		   ran1 = (random.nextInt(200) + 31);
	   } while(ran1 % ran2 != 0);
	return ran1;
}

private void shuffleArray(int[] answers) {
	    Random rnd = ThreadLocalRandom.current();
	    for (int i = answers.length - 1; i > 0; i--)
	    {
	      int index = rnd.nextInt(i + 1);
	      // Simple swap
	      int a = answers[index];
	      answers[index] = answers[i];
	      answers[i] = a;
	    }
}

// <jsp:setProperty name="numguess" property="*"/> bounds to this method
   //   because setGuess() matches request parameter "guess".
   // Always set the values of numGuesses and hint.
   // Set success if user got the answer right.
   public void setGuess(String strIn) {
      ++numGuesses;  // one more guess step
  
      int numIn;
      // Convert the input String to an int.
      // Catch if the input string does not contain a valid int.
      try {
         numIn = Integer.parseInt(strIn);
      } catch (NumberFormatException e) {
         hint = "a number next time";
         return;
      }
  
      if (numIn == answer) {
         success = true;
      } else if (numIn < answer) {
         hint = "higher";
      } else if (numIn > answer) {
         hint = "lower";
      }
   }
  

// Public getters for private variables success, hint and numGuesses.
   // No public setters. Values are set in the setGuess() method.
   public boolean isSuccess() { return success; }
   public String getHint() { return hint; }
   public int getNumGuesses() { return numGuesses; }

   public int getNum1() {
	   return num1;
		}

   public int getNum2() {
	   return num2;
		}
   
   public int getAnswer0() {
	   return answers[0];
		}

   public int getAnswer1() {
	   return answers[1];
		}
   
   public int getAnswer2() {
	   return answers[2];
		}

   public int getAnswer3() {
	   return answers[3];
		}
   
   public int getAnswer4() {
	   return answers[4];
		}
}
