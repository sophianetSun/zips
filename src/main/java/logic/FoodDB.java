package logic;

import java.io.Serializable;

public class FoodDB implements Serializable {
	private Integer no;
	private String groupType;
	private String foodName;
	private Integer amount;
	private Double calorie;
	private Double carbohydrate;
	private Double protein;
	private Double fat;
	private Double sugar;
	private Double na;
	private Double chol;
	private Double satFat;
	private Double transFat;
	
	// Constructor
	public FoodDB() { }
	
	public FoodDB(Integer no, String groupType, String foodName, Integer amount, Double calorie, Double carbohydrate,
			Double protein, Double fat, Double sugar, Double na, Double chol, Double satFat, Double transFat) {
		this.no = no;
		this.groupType = groupType;
		this.foodName = foodName;
		this.amount = amount;
		this.calorie = calorie;
		this.carbohydrate = carbohydrate;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.na = na;
		this.chol = chol;
		this.satFat = satFat;
		this.transFat = transFat;
	}

	// Getter, Setter, toString
	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
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

	public Double getCarbohydrate() {
		return carbohydrate;
	}

	public void setCarbohydrate(Double carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public Double getProtein() {
		return protein;
	}

	public void setProtein(Double protein) {
		this.protein = protein;
	}

	public Double getFat() {
		return fat;
	}

	public void setFat(Double fat) {
		this.fat = fat;
	}

	public Double getSugar() {
		return sugar;
	}

	public void setSugar(Double sugar) {
		this.sugar = sugar;
	}

	public Double getNa() {
		return na;
	}

	public void setNa(Double na) {
		this.na = na;
	}

	public Double getChol() {
		return chol;
	}

	public void setChol(Double chol) {
		this.chol = chol;
	}

	public Double getSatFat() {
		return satFat;
	}

	public void setSatFat(Double satFat) {
		this.satFat = satFat;
	}

	public Double getTransFat() {
		return transFat;
	}

	public void setTransFat(Double transFat) {
		this.transFat = transFat;
	}
	
}
