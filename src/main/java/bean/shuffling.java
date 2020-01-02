package bean;

import java.util.*;
import java.util.concurrent.ThreadLocalRandom;

class shuffling{
	
  public static void main(String args[]){
	  
	   int num1; // random number 1
	   int num2; // random number 2
		int answer;       // result of adding two random numbers
		int answer1;       // wrong answer
		int answer2;       // wrong answer
		int answer3;       // wrong answer
		int answer4;       // wrong answer
		Random random = new Random();
		
	   num1 = (random.nextInt(100) + 1);
	   num2 = (random.nextInt(100) + 1);
     answer = num1 + num2;
     answer1 = num1 + num2 + 2;
     answer2 = num1 + num2 - 2;
     answer3 = num1 + num2 + 5;
     answer4 = num1 + num2 - 5;
     
     int[] answers = {answer, answer1, answer2, answer3, answer4};
     
     for (int i = 0; i < answers.length; i++)
       System.out.print(answers[i] + " ");
     
     System.out.println();
   
    shuffleArray(answers);
    
    for (int i = 0; i < answers.length; i++)
      System.out.print(answers[i] + " ");
    
    System.out.println();
  }

  // Implementing Fisher–Yates shuffle
  static void shuffleArray(int[] ar)
  {
    // If running on Java 6 or older, use `new Random()` on RHS here
    Random rnd = ThreadLocalRandom.current();
    for (int i = ar.length - 1; i > 0; i--)
    {
      int index = rnd.nextInt(i + 1);
      // Simple swap
      int a = ar[index];
      ar[index] = ar[i];
      ar[i] = a;
    }
  }
}
