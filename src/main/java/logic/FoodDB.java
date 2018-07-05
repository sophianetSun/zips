package logic;

import java.io.Serializable;

public class FoodDB implements Serializable {
	private Integer no;
	private String group_type;
	private String food_name;
	private Integer amount;
	private Double calorie;
	private Double carbohydrate;
	private Double protein;
	private Double fat;
	private Double sugar;
	private Double na;
	private Double chol;
	private Double sat_fat;
	private Double trans_fat;
	
	// Constructor
	public FoodDB() { }
	
	public FoodDB(Integer no, String groupType, String foodName, Integer amount, Double calorie, Double carbohydrate,
			Double protein, Double fat, Double sugar, Double na, Double chol, Double satFat, Double transFat) {
		this.no = no;
		this.group_type = groupType;
		this.food_name = foodName;
		this.amount = amount;
		this.calorie = calorie;
		this.carbohydrate = carbohydrate;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.na = na;
		this.chol = chol;
		this.sat_fat = satFat;
		this.trans_fat = transFat;
	}

	// Getter, Setter, toString
	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getGroupType() {
		return group_type;
	}

	public void setGroupType(String groupType) {
		this.group_type = groupType;
	}

	public String getFoodName() {
		return food_name;
	}

	public void setFoodName(String foodName) {
		this.food_name = foodName;
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
		return sat_fat;
	}

	public void setSatFat(Double satFat) {
		this.sat_fat = satFat;
	}

	public Double getTransFat() {
		return trans_fat;
	}

	public void setTransFat(Double transFat) {
		this.trans_fat = transFat;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\"FoodDB\" : { \"no\":").append(no).append(", \"group_type\":\"").append(group_type).append("\", \"food_name\":\"")
				.append(food_name).append("\", \"amount\":").append(amount).append(", \"calorie\":").append(calorie)
				.append(", \"carbohydrate\":").append(carbohydrate).append(", \"protein\":").append(protein).append(", \"fat\":")
				.append(fat).append(", \"sugar\":").append(sugar).append(", \"na\":").append(na).append(", \"chol\":").append(chol)
				.append(", \"sat_fat\":").append(sat_fat).append(", \"trans_fat\":").append(trans_fat).append("}}");
		return builder.toString();
	}
	
	
}
