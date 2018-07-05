package logic;

import java.util.Date;

public class InfoCalendar {
	private Integer num;
	private Date regdate;
	private String userId;
	private Integer inType;
	private String name;
	private Double carbohydrate;
	private Double fat;
	private Double protein;
	private Integer amount;
	private Double calorie;
	private String nutriMemo;
	private String workMemo;
	// Constructor
	public InfoCalendar(Integer num, Date regdate, String userId, Integer inType, String name, Double carbohydrate,
			Double fat, Double protein, Integer amount, Double calorie, String nutriMemo, String workMemo) {
		super();
		this.num = num;
		this.regdate = regdate;
		this.userId = userId;
		this.inType = inType;
		this.name = name;
		this.carbohydrate = carbohydrate;
		this.fat = fat;
		this.protein = protein;
		this.amount = amount;
		this.calorie = calorie;
		this.nutriMemo = nutriMemo;
		this.workMemo = workMemo;
	}
	
	public InfoCalendar() { }

	// Getter, Setter, toString
	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getInType() {
		return inType;
	}

	public void setInType(Integer inType) {
		this.inType = inType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getCarbohydrate() {
		return carbohydrate;
	}

	public void setCarbohydrate(Double carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public Double getFat() {
		return fat;
	}

	public void setFat(Double fat) {
		this.fat = fat;
	}

	public Double getProtein() {
		return protein;
	}

	public void setProtein(Double protein) {
		this.protein = protein;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Double getCalorie() {
		return calorie;
	}

	public void setCalorie(Double calorie) {
		this.calorie = calorie;
	}

	public String getNutriMemo() {
		return nutriMemo;
	}

	public void setNutriMemo(String nutriMemo) {
		this.nutriMemo = nutriMemo;
	}

	public String getWorkMemo() {
		return workMemo;
	}

	public void setWorkMemo(String workMemo) {
		this.workMemo = workMemo;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("\"InfoCalendar\" : {\"num\":");
		builder.append(num);
		builder.append(", \"regdate\":\"");
		builder.append(regdate);
		builder.append("\", \"userId\":\"");
		builder.append(userId);
		builder.append("\", \"inType\":\"");
		builder.append(inType);
		builder.append("\", \"name\":\"");
		builder.append(name);
		builder.append("\", \"carbohydrate\":");
		builder.append(carbohydrate);
		builder.append(", \"fat\":");
		builder.append(fat);
		builder.append(", \"protein\":");
		builder.append(protein);
		builder.append(", \"amount\":");
		builder.append(amount);
		builder.append(", \"calorie\":");
		builder.append(calorie);
		builder.append(", \"nutriMemo\":");
		builder.append(nutriMemo);
		builder.append(", \"workMemo\":");
		builder.append(workMemo);
		builder.append("}");
		return builder.toString();
	}

	
	
	
}
