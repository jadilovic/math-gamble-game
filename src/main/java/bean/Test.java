package bean;

import java.util.Random;

public class Test {

	static Random random = new Random();
	
	static String winner;

	static int x1;

	static int x2;

	static int x3;

	static int x4;
	
	
	static Dog[] dogs = new Dog[4];
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int small;
		int big;
		for(int i = 0; i < 200; i++) {
			small = randomGenerator1();
			big = randomGenerator2(small);
			System.out.println(big + " / " + small + " = " + big / small);
		}	

			dogs[0] = new Dog("Blue", x1);
			dogs[1] = new Dog("Red", x2);
			dogs[2] = new Dog("Yellow", x3);
			dogs[3] = new Dog("Green", x4);
			
			run();
			System.out.println(getWinner());
			for(int i = 0; i < dogs.length; i++) {
				System.out.println(dogs[i].getName() + ", " + dogs[i].getNum());
			}
			
		}

		public static String getWinner() {
			return winner;
		}

		public static void run() {
			while(x1 < 1200 || x2 < 1200 || x3 < 1200 || x4 < 1200) {
				int move1 = (int) (Math.random() * 5);
				int move2 = (int) (Math.random() * 5);
				int move3 = (int) (Math.random() * 5);
				int move4 = (int) (Math.random() * 5);
				x1 += move1;
				dogs[0].setNum(x1);
				x2 += move2;
				dogs[1].setNum(x2);
				x3 += move3;
				dogs[2].setNum(x3);
				x4 += move4;
				dogs[3].setNum(x4);
			}
			
			int winnerNum = max(x1, x2, x3, x4);
			for(int i = 0; i < dogs.length; i++) {
				if(winnerNum == dogs[i].getNum())
					winner = dogs[i].getName();
			}
		}


		private static int max(int x1, int x2, int x3, int x4) {
			int[] results = {x1, x2, x3, x4};
			int max = results[0];
			for(int i = 1; i < results.length; i++) {
				if(results[i] > max)
					max = results[i];
			}
			return max;
		}

   	private static int randomGenerator1() {
	   int ran1 = (random.nextInt(29) + 1);
	   return ran1;
   	}
  
   private static int randomGenerator2(int ran1) {
	  int ran2;
	   do {
		   ran2 = (random.nextInt(200) + 31);
	   } while(ran2 % ran1 != 0);
	return ran2;
}

}
