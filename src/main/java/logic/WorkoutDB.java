package logic;

import java.io.Serializable;

public class WorkoutDB implements Serializable {
	private Integer num;
	private String name;
	private Double calorie;

	// Constructor
	public WorkoutDB(Integer num, String name, Double calorie) {
		super();
		this.num = num;
		this.name = name;
		this.calorie = calorie;
	}
	
	public WorkoutDB() { }

	// Getter, Setter, toString
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getCalorie() {
		return calorie;
	}

	public void setCalorie(Double calorie) {
		this.calorie = calorie;
	}

	@Override
	public String toString() {
		return "WorkoutDB [num=" + num + ", name=" + name + ", calorie=" + calorie + "]";
	}

}
