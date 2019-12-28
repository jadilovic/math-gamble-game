package bean;

import java.util.Random;  // For generating random number

import java.io.Serializable;
  
// NumberGuessBean, with session scope, for storing game data.
public class NumberGuess implements Serializable {
  
   private int num1; // random number 1
   private int num2; // random number 2
	private int answer;       // result of adding two random numbers
   private boolean success;  // got the answer?
   private String hint;      // hinting messages, e.g., "higher", "lower"
   private int numGuesses;   // number of guesses made so far, init to 0
   private Random random;    // random number generator
  
   // Constructor
   public NumberGuess() {
      random = new Random(); // Init the random number generator
      reset();
   }
  
   // Reset the game
   public void reset() {
      // Generate a random int between 1 to 100, uniformly distributed.
	   num1 = (random.nextInt(100) + 1);
	   num2 = (random.nextInt(100) + 1);
      answer = num1 + num2;
      success = false;
      numGuesses = 0;
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
         addPoints();
      } else if (numIn < answer) {
         hint = "higher";
      } else if (numIn > answer) {
         hint = "lower";
      }
   }
  
   private void addPoints() {
	
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
}
