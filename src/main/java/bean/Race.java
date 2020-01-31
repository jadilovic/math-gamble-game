package bean;

import java.lang.reflect.Array;
import java.util.Arrays;

public class Race {

	private String winner;
	int x1, x2, x3, x4;
	public Dog[] dogs = new Dog[4];
	
	public Race() {
		dogs[0] = new Dog("Akitas", x1);
		dogs[1] = new Dog("Bulterrier", x2);
		dogs[2] = new Dog("Corgi", x3);
		dogs[3] = new Dog("Huski", x4);
	}

	public String getWinner() {
		return winner;
	}

	public void run() {
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
		
		Arrays.sort(dogs);
	}

	private int max(int x1, int x2, int x3, int x4) {
		int[] results = {x1, x2, x3, x4};
		int max = results[0];
		for(int i = 1; i < results.length; i++) {
			if(results[i] > max)
				max = results[i];
		}
		return max;
	}
}
