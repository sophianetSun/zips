package logic;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class InfoCalendar {
	private Integer num;
	private Date regdate;
	private String user_id;
	private Integer in_type;
	private String name;
	private Double carbohydrate;
	private Double fat;
	private Double protein;
	private Integer amount;
	private Double calorie;
	private String nutri_memo;
	private String work_memo;

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	// Constructor
	public InfoCalendar() { }
	
	public InfoCalendar(Integer num, String regdate, String user_id, Integer in_type, String name, Double carbohydrate,
			Double fat, Double protein, Integer amount, Double calorie, String nutri_memo, String work_memo) throws ParseException {
		this.num = num;
		this.regdate = sdf.parse(regdate);
		this.user_id = user_id;
		this.in_type = in_type;
		this.name = name;
		this.carbohydrate = carbohydrate;
		this.fat = fat;
		this.protein = protein;
		this.amount = amount;
		this.calorie = calorie;
		this.nutri_memo = nutri_memo;
		this.work_memo = work_memo;
	}

	// Getter, Setter, toString


	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getRegdate() {
		return sdf.format(regdate);
	}

	public void setRegdate(String regdate) throws ParseException {
		this.regdate = sdf.parse(regdate);
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Integer getIn_type() {
		return in_type;
	}

	public void setIn_type(Integer in_type) {
		this.in_type = in_type;
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

	public String getNutri_memo() {
		return nutri_memo;
	}

	public void setNutri_memo(String nutri_memo) {
		this.nutri_memo = nutri_memo;
	}

	public String getWork_memo() {
		return work_memo;
	}

	public void setWork_memo(String work_memo) {
		this.work_memo = work_memo;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{ \"InfoCalendar\" : {\"num\":");
		builder.append(num);
		builder.append(", \"regdate\":\"");
		builder.append(regdate);
		builder.append("\", \"userId\":\"");
		builder.append(user_id);
		builder.append("\", \"in_type\":\"");
		builder.append(in_type);
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
		builder.append(", \"nutri_memo\":\"");
		builder.append(nutri_memo);
		builder.append("\", \"work_memo\":\"");
		builder.append(work_memo);
		builder.append("\"}}");
		return builder.toString();
	}

}
