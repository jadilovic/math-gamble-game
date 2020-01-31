package bean;

public class Dog implements Comparable<Dog>{

	private String name;
	private int num;
	
	public Dog(String name, int num) {
		this.setName(name);
		this.setNum(num);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public int compareTo(Dog compareDog) {
		int compareSpeed = ((Dog) compareDog).getNum();
		
		return compareSpeed - this.num;
	}
	
	
}
